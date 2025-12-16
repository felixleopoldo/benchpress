# Plots a matrix as heatmap using seaborn.
import os
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
matplotlib.use('Agg')
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})

# If the algorithm was timed out
if os.stat(snakemake.input["matrix_filename"]).st_size == 0:
    open(snakemake.output["plot_filename"], 'a').close()
else:
    heatmap = pd.read_csv(snakemake.input["matrix_filename"])
    heatmap.index = heatmap.columns

    with sns.axes_style("white"):
        sns.heatmap(heatmap,  annot=False, linewidth=1,
                    cmap="Blues",
                    vmin=0.0, vmax=1.0, square=True,
                    cbar=False,
                    xticklabels=1, yticklabels=1)
    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)
    plt.title(snakemake.params["title"], fontsize=6, ha="center")
    if snakemake.params["alg_string"]:
        unwrapped = snakemake.params["alg_string"].replace(
            "/", "\n")  # newlines separate the parameters
        wrapped_lines = []
        for line in unwrapped.splitlines():
            wrapped = [line[i:i+25] for i in range(0, len(line), 25)]
            wrapped_lines.extend(wrapped)
        wrapped_alg_string = "\n".join(wrapped_lines)
        #type = snakemake.params["graph_type"]
        #ylabel_text = f"Algorithm:\n\n{wrapped_alg_string}\n\nGraph type: {type}"
        ylabel_text = f"Algorithm:\n\n{wrapped_alg_string}"
        plt.ylabel(ylabel_text, rotation="horizontal",
                   fontsize=6, ha="right", va="center")
    plt.tight_layout()
    plt.savefig(snakemake.output["plot_filename"])
    plt.clf()
