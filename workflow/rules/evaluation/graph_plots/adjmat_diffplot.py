# Plots a matrix as heatmap using seaborn.
import os
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
matplotlib.use('Agg')

# If the algorithm was timed out or no true graph was provided in benchmark_setup.
if (os.stat(snakemake.input["adjmat_true"]).st_size == 0)  or (os.stat(snakemake.input["adjmat_est"]).st_size == 0):
    open(snakemake.output["filename"],'a').close()
else:
  adjmat_true = pd.read_csv(snakemake.input["adjmat_true"])
  adjmat_est = pd.read_csv(snakemake.input["adjmat_est"])

  adjmat_diff = 2*adjmat_true - adjmat_est
  adjmat_diff = adjmat_diff.replace([1], 3)
  adjmat_diff = adjmat_diff.replace([2], 1)
  adjmat_diff = adjmat_diff.replace([-1], 2)
  heatmap = adjmat_diff
  # 0: no edge
  # 1: false negative
  # 2: false positive
  # 3: correct edge

  colors = ["light grey", "windows blue", "red", "black"]
  cmap = sns.xkcd_palette(colors)
  heatmap.index = heatmap.columns
  #sns.set_style("whitegrid")
  with sns.axes_style("white"):
      sns.heatmap(heatmap,  annot=False, linewidth=1,
                  cmap=cmap,
                  vmin=0.0, vmax=3.0, square=True,
                  cbar=False,
                  xticklabels=1, yticklabels=1)
  cax = plt.gcf().axes[-1]
  cax.tick_params(labelsize=6)
  plt.title(snakemake.params["title"], fontsize=6, ha="center")
  if snakemake.params["alg_string"]:
      plt.ylabel("Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n")  + "\n\n" + "Graph type: " + snakemake.params["graph_type"], 
              rotation="horizontal", fontsize=6, ha="right", va="center")
  plt.tight_layout()
  plt.savefig(snakemake.output["filename"])
  plt.clf()