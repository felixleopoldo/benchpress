# Plots a matrix as heatmap using seaborn.

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
matplotlib.use('Agg')

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
    plt.ylabel("Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n"),
               rotation="horizontal", fontsize=6, ha="right", va="center")
plt.tight_layout()
plt.savefig(snakemake.output["plot_filename"])
plt.clf()
