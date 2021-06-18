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
plt.title(snakemake.params["title"], fontsize=6, ha="center")
plt.ylabel(
    #"Graph: \n"+snakemake.params["adjmat_string"].replace("/","\n") + "\n\n" +
    #"Parameters: \n"+snakemake.params["param_string"].replace("/","\n") + "\n\n" +
    #"Data: \n"+snakemake.params["data_string"].replace("/","\n")  + "\n\n"
    "Algorithm:\n\n"+snakemake.params["alg_string"].replace("/","\n"), rotation="horizontal", fontsize=6, ha="right", va="center")
plt.savefig(snakemake.output["plot_filename"])
plt.clf()



