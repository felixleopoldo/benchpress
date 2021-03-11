import json
import pandas as pd 
import numpy as np
import networkx as nx
import matplotlib.pyplot as plt
import seaborn as sns

matrices = []

with open(snakemake.input["traj"]) as f:
    data = json.load(f)

T = len(data)
print(T)
# create adjmats
for adjvec in data:
    l = int(np.sqrt(len(adjvec)))
    mat = np.array(adjvec, dtype=int).reshape(l,l)
    matrices.append(mat)


heatmap = matrices[0]
for i in range(1, T):
    heatmap += matrices[i]

print(heatmap)
heatmap = heatmap / T

#    aux.plot_heatmap(heatmap, cbar=False, annot=False,
#                     xticklabels=1,
#                     yticklabels=1)

with sns.axes_style("white"):
    sns.heatmap(heatmap,  annot=False,
                cmap="Blues",
                vmin=0.0, vmax=1.0, square=True,
                cbar=False,
                xticklabels=1, yticklabels=1)
#sns.set_style("whitegrid")
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)

plt.savefig(snakemake.output["plot_filename"])

