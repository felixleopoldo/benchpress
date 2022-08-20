# Plots graph trajectory

import os
import sys
import seaborn as sns
from pandas.plotting import autocorrelation_plot
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import networkx as nx
import matplotlib
matplotlib.use('Agg')

sns.set_style("whitegrid")


def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1])
             for edge in edges_str if len(edge.split(edgesymb)) == 2]
    return edges


# Treating the case when empty files are created. Such files
# are created if the algorithm was timed out.
if os.stat(snakemake.input["traj"]).st_size== 0:
    open(snakemake.output["plot"],'a').close()
else:
    df = pd.read_csv(snakemake.input["traj"], sep=",")

    if snakemake.wildcards["functional"] == "size":

        edges = edges_str_to_list(df["added"][0], edgesymb="->")

        if len(edges) != 0:
            edgesymb = "->"
            g = nx.DiGraph()
        else:
            edgesymb = "-"
            g = nx.Graph()

        size = []

        for index, row in df.iterrows():
            added = edges_str_to_list(row["added"], edgesymb)
            removed = edges_str_to_list(row["removed"], edgesymb)
            g.add_edges_from(added)
            g.remove_edges_from(removed)
            size.append(g.size())

        df["size"] = size
        T = df["index"].iloc[-1]  # approximate length

        newindex = pd.Series(range(T))
        # removes the two first rows.
        df2 = df[["index", "size"]][2:].set_index("index")

        df2 = df2.reindex(newindex).reset_index().reindex(
            columns=df2.columns).fillna(method="ffill")

        if snakemake.wildcards["thinning"] != "None":
            df_noburnin = df2[int(snakemake.wildcards["burn_in"]):][::int(
                snakemake.wildcards["thinning"])]
        else:
            df_noburnin = df2[int(snakemake.wildcards["burn_in"]):]

    elif snakemake.wildcards["functional"] == "score":
        T = df["index"].iloc[-1]  # approximate length

        newindex = pd.Series(range(T))

        # removes the two first rows.
        df2 = df[["index", "score"]][2:].set_index("index")
        df2 = df2.reindex(newindex).reset_index().reindex(
            columns=df2.columns).fillna(method="ffill")

        if snakemake.wildcards["thinning"] != "None":
            df_noburnin = df2[int(snakemake.wildcards["burn_in"]):][::int(
                snakemake.wildcards["thinning"])]
        else:
            df_noburnin = df2[int(snakemake.wildcards["burn_in"]):]

    # Get id
    # Get seed number
    df_noburnin["seed"] = snakemake.wildcards["seed"]
    #df_noburnin["mcmc_seed"] = snakemake.wildcards["mcmc_seed"]
    
    # Get varying param.
    df_noburnin["param_var"] = snakemake.wildcards["param_var"]
    df_noburnin["param_val"] = snakemake.wildcards["param_val"]
    # kolla vilken som är lista. Men sen har amn ju inte de värdet ändå..
    df_noburnin["id"] = snakemake.wildcards["id"]
    df_noburnin.to_csv(snakemake.output["traj"])