# Plots a matrix as heatmap using seaborn.
import os
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
import numpy as np
matplotlib.use('Agg')
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})


def idtoalg(run_id: str):
    """ Returns the algorithm name that the id belongs to, otherwise None """
    for key, alg in config["resources"]["structure_learning_algorithms"].items():
        for obj in alg:
            if obj["id"] == run_id:

                return key, obj
    return None, None


# If the algorithm was timed out
if os.stat(snakemake.input["matrix_filename"]).st_size == 0:
    open(snakemake.output["plot_filename"], 'a').close()
else:

    heatmap = pd.read_csv(snakemake.input["matrix_filename"])
    heatmap.index = heatmap.columns

    # Create figure with larger size to accommodate legend
    plt.figure(figsize=(14, 8))

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
        # here we add the bagging legend:
        num_edges = len(heatmap.values[heatmap.values > 0])

        legend_elements = []

        # Add algorithm info to legend
        legend_elements.append(plt.Line2D([0], [0], marker='s', color='w',
                                          markerfacecolor='lightblue', markersize=8,
                                          label=f'Bagging Path: {snakemake.params["alg_string"]}'))

        legend_elements.append(plt.Line2D([0], [0], marker='s', color='w',
                                          markerfacecolor='lightblue', markersize=8,
                                          label=f'Edges: {num_edges}'))
        # Add parameter info to legend
        if snakemake.params["configfile"]:
            config = snakemake.params.configfile
            bagging = config["benchmark_setup"][0]["evaluation"]["bagging"]

            print("-------------------------")
            print("HERE IS BAGGING INFO")
            print("-------------------------")

            # algorithms by id
            algs = np.array(config["benchmark_setup"][0]
                            ["evaluation"]["graph_estimation"]["ids"])

            if len(algs) == 0:
                print("ERROR IN HEATMAP: ALGS LIST EMPTY CHECK CONFIG FILE")
                exit(1)

            if bagging == "standard":
                type = "Standard"
                threshold = 0.5
                weights = np.full(len(algs), 1/len(algs))

            else:  # this is the weighted case
                type = "Weighted"
                for item in bagging:
                    if isinstance(item, dict):
                        if "threshold" in item:
                            threshold = item["threshold"]
                        else:
                            wdict = item

                values = []

                for alg in algs:
                    values.append(wdict[alg])

                weights = np.array(values)
                weights = weights / np.sum(weights)

                # Add weight statistics to legend

            legend_elements.append(plt.Line2D([0], [0], marker='s', color='w',
                                              markerfacecolor='lightblue', markersize=8,
                                              label=f'Bagging Type: {type}'))

            legend_elements.append(plt.Line2D([0], [0], marker='s', color='w',
                                              markerfacecolor='lightblue', markersize=8,
                                              label=f'Threshold: {threshold}'))

            legend_elements.append(plt.Line2D([0], [0], marker='s', color='w',
                                              markerfacecolor='lightblue', markersize=8,
                                              label=f'Weights:'))

            for index, alg in enumerate(algs):
                legend_elements.append(plt.Line2D([0], [0], marker='s', color='w',
                                                  markerfacecolor='lightblue', markersize=8,
                                                  label=f'{idtoalg(alg)[0]}: {weights[index]}'))

        if legend_elements:
            plt.legend(handles=legend_elements, loc='upper left', bbox_to_anchor=(1, 1),
                       fontsize=6, title='Graph Information', title_fontsize=7)

    plt.tight_layout()
    plt.savefig(snakemake.output["plot_filename"])
    plt.clf()
