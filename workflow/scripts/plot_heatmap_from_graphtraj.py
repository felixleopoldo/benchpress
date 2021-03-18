import pandas as pd
import networkx as nx
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns
import sys
sns.set_style("whitegrid")

def edges_str_to_list(str):
    edges_str = str[1:-1].split(",")
    edges = [(int(edge.split("-")[0]), int(edge.split("-")[1])) for edge in edges_str if len(edge.split("-"))==2]
    return edges

df = pd.read_csv(sys.argv[1], sep=";")

adjmat = None
g = nx.Graph()

for index, row in df.iterrows():
    if row["index"] == 0:
        adjmat = nx.to_numpy_array(g)
    if row["index"] > 0:
        cur_index = df["index"].iloc[index]
        prev_index = df["index"].iloc[index-1]
        reps = cur_index - prev_index        
        adjmat += nx.to_numpy_matrix(g) * reps

    added = edges_str_to_list(row["added"])
    removed = edges_str_to_list(row["removed"])
    g.add_edges_from(added)
    g.remove_edges_from(removed)

heatmap = adjmat / df["index"].iloc[-1] # almost right

with sns.axes_style("white"):
    sns.heatmap(heatmap,  annot=False,
                cmap="Blues",
                vmin=0.0, vmax=1.0, square=True,
                cbar=False,
                xticklabels=1, yticklabels=1)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)

#plt.savefig(snakemake.output["plot_filename"])
plt.savefig(sys.argv[2])