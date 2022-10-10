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
        df_noburnin["size"].plot()

        plt.title("Graph: "+snakemake.params["adjmat_string"] + "\nParameters: " +
                snakemake.params["param_string"] + "\nData: " + snakemake.params["data_string"], fontsize=6, ha="center")
        plt.ylabel(
            # "Graph: \n"+snakemake.params["adjmat_string"].replace("/","\n") + "\n\n" +
            # "Parameters: \n"+snakemake.params["param_string"].replace("/","\n") + "\n\n" +
            #"Data: \n"+snakemake.params["data_string"].replace("/","\n")  + "\n\n"
            "Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n") +
            "\n\nPlot:\n\nburn_in="+snakemake.wildcards["burn_in"] +
            "\nthinning="+snakemake.wildcards["thinning"] +
            "\nfunctional="+snakemake.wildcards["functional"], rotation="horizontal", fontsize=6, ha="right", va="center")

        plt.tight_layout()
        plt.savefig(snakemake.output["plot"])



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

        df_noburnin["score"].plot()
        plt.title("Graph: "+snakemake.params["adjmat_string"] + "\nParameters: " +
                snakemake.params["param_string"] + "\nData: " + snakemake.params["data_string"], fontsize=6, ha="center")
        plt.ylabel(
            # "Graph: \n"+snakemake.params["adjmat_string"].replace("/","\n") + "\n\n" +
            # "Parameters: \n"+snakemake.params["param_string"].replace("/","\n") + "\n\n" +
            #"Data: \n"+snakemake.params["data_string"].replace("/","\n")  + "\n\n"
            "Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n") +
            "\n\nPlot:\n\nburn_in="+snakemake.wildcards["burn_in"] +
            "\nthinning="+snakemake.wildcards["thinning"] +
            "\nfunctional="+snakemake.wildcards["functional"], rotation="horizontal", fontsize=6, ha="right", va="center")

        plt.tight_layout()
        plt.savefig(snakemake.output["plot"])
