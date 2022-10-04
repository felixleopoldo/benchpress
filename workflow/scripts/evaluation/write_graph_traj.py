# This file processes a graph trajectory using the parameters for an MCMC method. 
# That could be e.g. thinning or removing burn-in samples.

import os
import json
import pandas as pd
import numpy as np
import networkx as nx


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

    # Size (#edges) trajectory 
    if snakemake.wildcards["functional"] == "size":

        # Checking if there are diderced edges. 
        # Otherwise they are undirected.
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

    # Score trajectory
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
            
    df_noburnin.rename(columns={snakemake.wildcards["functional"]:"plotvalue"}, inplace=True)

    # Opening conf file
    # This should be moves to the plotting
    f = open(snakemake.params["conf"])
    conf = json.load(f)
    # Get the algorithm object
    algs = conf["resources"]["structure_learning_algorithms"]
    alg = snakemake.params["alg"]
    algobjid = snakemake.wildcards["id"]
    alg_item = None
    for algob in algs[alg]:
        if algob["id"] == algobjid:
            alg_item = algob

    # Get the varying parameter
    varying_param = "id"
    varying_param_val = alg_item["id"]
    for key, val in alg_item.items():
        if isinstance(val, list) & (key != "mcmc_seed"):
            varying_param = key
            varying_param_val = snakemake.wildcards[varying_param]


    df_noburnin["param"] = varying_param
    df_noburnin["param_val"] = varying_param_val
    df_noburnin["seed"] = snakemake.wildcards["seed"]
    df_noburnin["mcmc_seed"] = snakemake.wildcards["mcmc_seed"]
    df_noburnin["alg"] = snakemake.params["alg"]
    df_noburnin["id"] = snakemake.wildcards["id"] # should get param and params_vals in plotting instead.
    df_noburnin["functional"] = snakemake.wildcards["functional"]
    df_noburnin["adjmat"] = snakemake.params["adjmat_string"]
    df_noburnin["parameters"] = snakemake.params["param_string"]
    df_noburnin["data"] = snakemake.params["data_string"]
    df_noburnin["alg_string"] = snakemake.params["alg_string"]
    df_noburnin["eval_string"] = snakemake.params["eval_string"]
    
    df_noburnin.to_csv(snakemake.output["traj"])