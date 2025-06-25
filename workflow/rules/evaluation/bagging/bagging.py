#!/usr/bin/env python3
import numpy as np
import pandas as pd
import sys
import os

# Snakemake injects these for you:
adjs = snakemake.input
bag_value = snakemake.params.bag_value
config = snakemake.params.configfile
out_csv_adj = snakemake.output[0]
out_csv_avg = snakemake.output[1]


def idtoalg(run_id: str):
    """ Returns the algorithm name that the id belongs to, otherwise None """
    for key, alg in config["resources"]["structure_learning_algorithms"].items():
        for obj in alg:
            if obj["id"] == run_id:

                return key, obj
    return None, None


# 1. Load all adjacency matrices into a list of DataFrames
# mats = [pd.read_csv(path, index_col=0) for path in adjs]
mats = [pd.read_csv(path, header=0).loc[:, lambda df: ~
                                        df.columns.str.contains('^Unnamed')] for path in adjs]

if len(mats) == 0:
    print("ERROR: No adjacency matrices found, try adding some algorithms to the config file or check the input paths")
    exit(1)

if bag_value is None:
    # No bagging: blank csv file as output:
    pd.DataFrame().to_csv(out_csv_adj)
    pd.DataFram().to_csv(out_csv_avg)
else:
    if bag_value == "standard":
        weights = [1/len(mats)] * len(mats)
        threshold = 0.5
    else:
        # bag_cfg == ["weighted", {"threshold":t}, {"id1":w1, ...}]
        _, thr_obj, weight_obj = bag_value
        weights = []
        threshold = thr_obj["threshold"]

        name_weight = dict()
        for key, value in weight_obj.items():
            name_weight[idtoalg(key)[0]] = value

        # get the name of the adjmat
        for path in adjs:

            # get the name of the adjmat
            parts = path.split('algorithm=/')
            if len(parts) > 1:
                name = parts[1].split('/')[0]

            weights.append(name_weight[name])

        weights = np.array(weights)
        weights = weights / np.sum(weights)

    # Compute weighted average adjacency
    avg_df = sum(w * df for w, df in zip(weights, mats))

    # Threshold to binary edges
    bin_mat = (avg_df >= threshold).astype(int)

    # Save back out
    pd.DataFrame(avg_df).to_csv(out_csv_avg, index=False)
    pd.DataFrame(bin_mat).to_csv(out_csv_adj, index=False)
