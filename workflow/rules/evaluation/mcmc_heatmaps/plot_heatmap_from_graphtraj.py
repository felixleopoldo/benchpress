# Reads a grap trajectory and plots a heatmap of the expected graph.
from mcmc_utils import *
import math
import matplotlib
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import networkx as nx
from sklearn.cluster import estimate_bandwidth
import os
sys.path.append("workflow/scripts/evaluation")


matplotlib.use('Agg')
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})


# Treating the case when empty files are created. Such files
# are created if the algorithm was timed out.
if os.stat(snakemake.input["traj"]).st_size == 0:
    open(snakemake.output["filename"], 'a').close()
else:
    df = pd.read_csv(snakemake.input["traj"], sep=",")

    edgesymb = get_edge_symb(df)
    nodeorder = get_node_order(df)

    # Create heatmap
    heatmap = estimate_heatmap(
        df, float(snakemake.params["burnin_frac"]), edgesymb)

    ### Create heatmap plot ###

    # need to reorganize matrix according to node orders..
    sns.set(font_scale=0.4)
    with sns.axes_style("white"):
        sns.heatmap(heatmap,
                    annot=True,
                    linewidth=1,
                    fmt=".2f",
                    cmap="Blues",
                    vmin=0.0, vmax=1.0, square=True,
                    cbar=False,
                    xticklabels=nodeorder,
                    yticklabels=nodeorder)

    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)

    plt.title("Graph: "+snakemake.params["adjmat_string"] + "\nParameters: " +
              snakemake.params["param_string"] + "\nData: " + snakemake.params["data_string"], fontsize=6, ha="center")

    unwrapped = snakemake.params["alg_string"].replace(
        "/", "\n")  # newlines separate the parameters
    wrapped_lines = []
    for line in unwrapped.splitlines():
        wrapped = [line[i:i+25] for i in range(0, len(line), 25)]
        wrapped_lines.extend(wrapped)
    wrapped_alg_string = "\n".join(wrapped_lines)
    burn_in = snakemake.wildcards["burn_in"]
    ylabel_text = f"Algorithm:\n\n{wrapped_alg_string}\n\nburn_in={burn_in}"
    plt.ylabel(ylabel_text, rotation="horizontal",
               fontsize=6, ha="right", va="center")

    plt.tight_layout()

    plt.savefig(snakemake.output["heatmap_plot"])
    plt.clf()

    #### Create heatgraph plot ###
    mapping = {i: val for i, val in enumerate(nodeorder)}

    # Here we create a networkx graph with edge weights from the heatmap
    # first check if directed or not.
    edges = edges_str_to_list(df["added"][0], edgesymb)
    graph = None

    if edgesymb == "-":
        graph = nx.from_numpy_array(heatmap.values, create_using=nx.Graph())
    elif edgesymb == "->":
        graph = nx.from_numpy_array(heatmap.values, create_using=nx.DiGraph())

    graph = nx.relabel_nodes(graph, mapping)

    for edge in graph.edges(data=True):

        weight = edge[2]["weight"]
        edge[2]["label"] = round(weight, 2)
        edge[2]["color"] = "black"
        edge[2]["penwidth"] = weight

    # create the pygraphviz graph
    A = nx.nx_agraph.to_agraph(graph)

    # A.layout("circo")
    A.layout("dot")
    # args="mindist=2.0")
    A.draw(snakemake.output["heatmap_plot"]+"-graph.png")
