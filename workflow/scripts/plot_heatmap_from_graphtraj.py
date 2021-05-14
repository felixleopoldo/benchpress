import pandas as pd
import networkx as nx
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns
import sys
sns.set_style("whitegrid")

def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1]) for edge in edges_str if len(edge.split(edgesymb))==2]
    return edges

df = pd.read_csv(sys.argv[1], sep=",")

adjmat = None

# Check if directed
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


for index, row in df.iterrows():
    if row["index"] == 0:
        adjmat = nx.to_numpy_array(g)
    if row["index"] > 0:
        cur_index = df["index"].iloc[index]
        prev_index = df["index"].iloc[index-1]
        reps = cur_index - prev_index        
        adjmat += nx.to_numpy_matrix(g, nodelist=nodeorder) * reps ## Set nodelist here
    
    added = edges_str_to_list(row["added"], edgesymb)
    removed = edges_str_to_list(row["removed"], edgesymb)
    g.add_edges_from(added)
    g.remove_edges_from(removed)



heatmap = adjmat / df["index"].iloc[-1] # almost right

# need to reorganze matrix according to node orders..
with sns.axes_style("white"):
    sns.heatmap(heatmap,  annot=True,
                cmap="Blues",
                vmin=0.0, vmax=1.0, square=True,
                cbar=True,
                xticklabels=nodeorder, yticklabels=nodeorder)
#                xticklabels=1, yticklabels=1)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)
cax = plt.gcf().axes[-1]
cax.tick_params(labelsize=6)

plt.savefig(sys.argv[2])