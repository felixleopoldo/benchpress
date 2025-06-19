#!/usr/bin/env python3
import numpy as np
import pandas as pd
import sys
import os

print("--------------------------------")
print("BAGGING PYTHON SCRIPT")
print("--------------------------------")

# Snakemake injects these for you:
adjs = snakemake.input
bag_value = snakemake.params.bag_value
out_csv = snakemake.output[0]


# print out the input:
# print("--------------------------------")
# print("Here are the input paths (from bagging.py):")
# print(adjs)
# print("--------------------------------")


# 1. Load all adjacency matrices into a list of DataFrames
# mats = [pd.read_csv(path, index_col=0) for path in adjs]


mats = [pd.read_csv(path, header=0).loc[:, lambda df: ~
                                        df.columns.str.contains('^Unnamed')] for path in adjs]


print("--------------------------------")
print("here is the bagging parameters")
print(bag_value)
print("--------------------------------")


# print("--------------------------------")
# print("Here are the adjmats (from bagging.py):")
# print(mats)
# print("--------------------------------")

if len(mats) == 0:
    print("ERROR: No adjacency matrices found, try adding some algorithms to the config file or check the input paths")
    exit(1)

if bag_value is None:
    # No bagging: blank csv file as output:
    pd.DataFrame().to_csv(out_csv)
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
            name_weight[idtoalg(key)] = value

        # get the name of the adjmat
        for path in adjs:

            # get the name of the adjmat
            parts = path.split('adjmat=/')
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
    pd.DataFrame(bin_mat).to_csv(out_csv, index=False)

    # print("--------------------")
    # print("Here is the final bagging file:")
    # print(bin_mat)
    # print("--------------------")

    # print("--------------------")
    # print("Here is the output path: ")
    # print(out_csv)
    # print("--------------------")
