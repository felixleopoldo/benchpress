import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns

heatmap = pd.read_csv(snakemake.input["matrix_filename"])
heatmap.index = heatmap.columns

with sns.axes_style("white"):
    sns.heatmap(heatmap,  annot=False,
                cmap="Blues",
                vmin=0.0, vmax=1.0, square=True,
                cbar=False,
                xticklabels=1, yticklabels=1)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)
plt.title(snakemake.params["title"], fontsize=6)
plt.savefig(snakemake.output["plot_filename"])
plt.clf()

