import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib
import os
from pathlib import Path

matplotlib.use('Agg')
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})

output_dir = snakemake.params["output_dir"]
Path(output_dir).mkdir(parents=True, exist_ok=True)

true_adjmat = pd.read_csv(snakemake.input["true_adjmat"])
true_adjmat.index = true_adjmat.columns
true_adjmat_values = true_adjmat.values

n_seeds = snakemake.params["n_seeds"]
alg_strings = snakemake.params["alg_strings"]

all_adjmat_files = list(snakemake.input["adjmats"])
n_params = len(alg_strings)
files_per_param = len(all_adjmat_files) // n_params

for param_idx, alg_string in enumerate(alg_strings):
    start_idx = param_idx * files_per_param
    end_idx = start_idx + files_per_param
    adjmat_files = all_adjmat_files[start_idx:end_idx]
    
    adjmats = []
    node_names = None
    
    for f in adjmat_files:
        if os.stat(f).st_size == 0:
            continue
        df = pd.read_csv(f)
        df.index = df.columns
        if node_names is None:
            node_names = df.columns
        adjmats.append(df.values)
    
    if len(adjmats) == 0:
        continue
    
    stacked = np.stack(adjmats, axis=0)
    avg_adjmat = np.mean(stacked, axis=0)
    actual_n_seeds = len(adjmats)
    
    avg_df = pd.DataFrame(avg_adjmat, columns=node_names, index=node_names)
    
    base_name = f"{snakemake.params['alg_module']}_{snakemake.params['alg_id']}_{param_idx + 1}"
    
    avg_df.to_csv(f"{output_dir}/{base_name}_avg_adjmat.csv")
    
    title = (f"Graph: {snakemake.params['adjmat_string']}\n"
             f"Parameters: {snakemake.params['parameters_string']}\n"
             f"Data: {snakemake.params['data_string']}")
    
    ylabel = ("Algorithm:\n\n" + alg_string.replace("/", "\n") + 
              "\n\nn_seeds=" + str(actual_n_seeds))
    
    diff_matrix = np.zeros_like(avg_adjmat)
    
    for i in range(avg_adjmat.shape[0]):
        for j in range(avg_adjmat.shape[1]):
            prob = avg_adjmat[i, j]
            true_edge = true_adjmat_values[i, j] > 0
            
            if true_edge:
                diff_matrix[i, j] = prob
            else:
                diff_matrix[i, j] = -prob if prob > 0 else 0
    
    diff_df = pd.DataFrame(diff_matrix, columns=node_names, index=node_names)
    
    cmap = sns.diverging_palette(10, 130, as_cmap=True)
    with sns.axes_style("white"):
        sns.heatmap(diff_df, annot=False, linewidth=1,
                    cmap=cmap,
                    vmin=-1.0, vmax=1.0, square=True,
                    cbar=True, center=0,
                    xticklabels=1, yticklabels=1)
    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)
    diffplot_title = title + "\nGreen=TP, Red=FP"
    plt.title(diffplot_title, fontsize=6, ha="center")
    plt.ylabel(ylabel, rotation="horizontal", fontsize=6, ha="right", va="center")
    plt.tight_layout()
    plt.savefig(f"{output_dir}/{base_name}_diffplot.png")
    plt.clf()
