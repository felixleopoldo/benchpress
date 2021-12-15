# Reads a grap trajectory and plots a heatmap of the expected graph.

import os
import networkx as nx
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
matplotlib.use('Agg')

def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1])
             for edge in edges_str if len(edge.split(edgesymb)) == 2]
    return edges


# Treating the case when empty files are created. Such files
# are created if the algorithm was timed out.
if os.stat(snakemake.input["traj"]).st_size== 0:
    open(snakemake.output["filename"],'a').close()
else:
    df = pd.read_csv(snakemake.input["traj"], sep=",")

    # Check if directed and get the node order
    edges = edges_str_to_list(df["added"][0], edgesymb="->")
    if len(edges) != 0:
        g = nx.DiGraph()
        edgesymb = "->"
        nodeorder = []
        tmpedges = edges_str_to_list(df["added"][0], edgesymb="->")
        nodeorder.append(tmpedges[0][0])
        for edge in tmpedges:
            nodeorder.append(edge[1])

    else:
        g = nx.Graph()
        edgesymb = "-"
        nodeorder = []
        tmpedges = edges_str_to_list(df["added"][0], edgesymb)
        nodeorder.append(tmpedges[0][0])
        for edge in tmpedges:
            nodeorder.append(edge[1])


    # Create heatmap
    p = len(nodeorder)
    adjmat = np.matrix(np.zeros((p, p)))
    for index, row in df.iterrows():
        if row["index"] == 0:
            if row["index"] >= int(snakemake.wildcards["burn_in"]):
                adjmat = nx.to_numpy_array(g)
        if row["index"] > 0:
            cur_index = df["index"].iloc[index]
            prev_index = df["index"].iloc[index-1]
            reps = cur_index - prev_index
            if row["index"] >= int(snakemake.wildcards["burn_in"]):
                # Set nodelist here
                adjmat += nx.to_numpy_matrix(g, nodelist=nodeorder) * reps

        added = edges_str_to_list(row["added"], edgesymb)
        removed = edges_str_to_list(row["removed"], edgesymb)
        g.add_edges_from(added)
        g.remove_edges_from(removed)

    # TODO: almost correct. Counts the last index as the full length.
    heatmap = adjmat / (df["index"].iloc[-1] -
                        float(snakemake.wildcards["burn_in"]))

    # need to reorganze matrix according to node orders..
    with sns.axes_style("white"):
        sns.heatmap(heatmap, annot=False, linewidth=1,
                    # fmt=".2f",
                    cmap="Blues",
                    vmin=0.0, vmax=1.0, square=True,
                    cbar=False,
                    xticklabels=nodeorder,
                    yticklabels=nodeorder)

    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)

    plt.title("Graph: "+snakemake.params["adjmat_string"] + "\nParameters: " +
            snakemake.params["param_string"] + "\nData: " + snakemake.params["data_string"], fontsize=6, ha="center")
    plt.ylabel("Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n") + "\n\nburn_in=" +
            snakemake.wildcards["burn_in"], rotation="horizontal", fontsize=6, ha="right", va="center")

    plt.tight_layout()
    plt.savefig(snakemake.output["filename"])
    plt.clf()
