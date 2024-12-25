# This file reads a graph trajectory and returns an estimate such as the MAP graph,
# the mean graph, or the thresholded mean graph.

import sys
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import networkx as nx
import numpy as np
import matplotlib
import os
from mcmc_utils import *

matplotlib.use('Agg')
sns.set_style("whitegrid")

# Treating the case when empty files are created. Such files
# are created if the algorithm was timed out.
if os.stat(snakemake.input["traj"]).st_size > 0:
    df = pd.read_csv(snakemake.input["traj"], sep=",")
    edgesymb = get_edge_symb(df)

    if snakemake.params["estimator"] == "map":
        df_adjmat = get_max_score_graph(df)
        df_adjmat.to_csv(snakemake.output["adjmat"], index=False)

    if snakemake.params["estimator"] == "heatmap":
        df_heatmap = estimate_heatmap(df, float(snakemake.params["burnin_frac"]), edgesymb)
        df_heatmap.to_csv(snakemake.output["heatmap"], index=False)

    if snakemake.params["estimator"] == "threshold":
        # this is quite slow as it reads the whole trajectory.
        df_heatmap = estimate_heatmap(df, float(snakemake.params["burnin_frac"]), edgesymb)
        df_adjmat = (df_heatmap > float(snakemake.params["threshold"])) * 1
        df_adjmat.to_csv(snakemake.output["adjmat"], index=False)
else:
    if snakemake.params["estimator"] == "map" or snakemake.params["estimator"] == "threshold":
        open(snakemake.output["adjmat"],'a').close()
    if snakemake.params["estimator"] == "heatmap":
        open(snakemake.output["heatmap"],'a').close()