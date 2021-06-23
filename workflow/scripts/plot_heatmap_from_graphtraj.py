import pandas as pd
import networkx as nx
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("whitegrid")

def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1]) for edge in edges_str if len(edge.split(edgesymb))==2]
    return edges

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
adjmat = np.matrix(np.zeros((p,p)))
for index, row in df.iterrows():
    if row["index"] == 0:
        if row["index"] >= int(snakemake.wildcards["burn_in"]):
            adjmat = nx.to_numpy_array(g)
    if row["index"] > 0:
        cur_index = df["index"].iloc[index]
        prev_index = df["index"].iloc[index-1]
        reps = cur_index - prev_index
        if row["index"] >= int(snakemake.wildcards["burn_in"]):
            adjmat += nx.to_numpy_matrix(g, nodelist=nodeorder) * reps ## Set nodelist here
    
    added = edges_str_to_list(row["added"], edgesymb)
    removed = edges_str_to_list(row["removed"], edgesymb)
    g.add_edges_from(added)
    g.remove_edges_from(removed)

heatmap = adjmat / (df["index"].iloc[-1] - float(snakemake.wildcards["burn_in"]))  # TODO: almost correct

# need to reorganze matrix according to node orders..
with sns.axes_style("white"):
    sns.heatmap(heatmap,  annot=False, fmt=".2f",
                cmap="Blues",
                vmin=0.0, vmax=1.0, square=True,
                cbar=True,
                xticklabels=nodeorder, yticklabels=nodeorder)
#                xticklabels=1, yticklabels=1)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)
#cax = plt.gcf().axes[-1]
#cax.tick_params(labelsize=6)

plt.title("Graph: "+snakemake.params["adjmat_string"] +"\nParameters: " +snakemake.params["param_string"] +"\nData: " +snakemake.params["data_string"], fontsize=6, ha="center")
plt.ylabel(
    #"Graph: \n"+snakemake.params["adjmat_string"].replace("/","\n") + "\n\n" +
    #"Parameters: \n"+snakemake.params["param_string"].replace("/","\n") + "\n\n" +
    #"Data: \n"+snakemake.params["data_string"].replace("/","\n")  + "\n\n"
    "Algorithm:\n\n"+snakemake.params["alg_string"].replace("/","\n")+ "\n\nburn_in="+snakemake.wildcards["burn_in"], rotation="horizontal", fontsize=6, ha="right", va="center")

plt.tight_layout()

plt.savefig(snakemake.output["filename"])