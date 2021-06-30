import pandas as pd
import networkx as nx
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns
import sys
sns.set_style("whitegrid")

def estimate_heatmap(df):
    heatmap = None
    for index, row in df.iterrows():
        if row["index"] == 0:
            heatmap = nx.to_numpy_array(g)
            
        if row["index"] > int(snakemake.params["burnin"]):
            cur_index = df["index"].iloc[index]
            prev_index = df["index"].iloc[index-1]
            reps = cur_index - prev_index        
            heatmap += nx.to_numpy_matrix(g) * reps

        added = edges_str_to_list(row["added"], edgesymb)
        removed = edges_str_to_list(row["removed"], edgesymb)
        g.add_edges_from(added)
        g.remove_edges_from(removed)

    heatmap = heatmap / df["index"].iloc[-1] # almost right
    return heatmap

def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1]) for edge in edges_str if len(edge.split(edgesymb))==2]
    return edges


df = pd.read_csv(snakemake.input["traj"], sep=",")

if snakemake.params["graph_type"]== "dag":
    g = nx.DiGraph()
    edgesymb="->"
else:
    g = nx.Graph()

if snakemake.params["estimator"] == "map":
    maxscore = df[3:]["score"].max()    
    for index, row in df.iterrows():
        added = edges_str_to_list(row["added"])
        removed = edges_str_to_list(row["removed"])
        g.add_edges_from(added)
        g.remove_edges_from(removed)
        if row["score"] == maxscore:
            break
        
    pd.DataFrame(nx.to_numpy_array(g)).to_csv(snakemake.output["adjmat"], index=False)

if snakemake.params["estimator"] == "heatmap":

    heatmap = estimate_heatmap(df)
    df_heatmap = pd.DataFrame(heatmap)
    df_heatmap.columns = g.nodes()
    df_heatmap.to_csv(snakemake.output["heatmap"], index=False)

if snakemake.params["estimator"] == "threshold":
    heatmap = estimate_heatmap(df)
    adjmat = (heatmap > float(snakemake.params["threshold"])) * 1
    df_adjmat = pd.DataFrame(adjmat)
    df_adjmat.columns = g.nodes()
    df_adjmat.to_csv(snakemake.output["adjmat"], index=False)
