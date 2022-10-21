# Reads a grap trajectory and plots a heatmap of the expected graph.

import os

from sklearn.cluster import estimate_bandwidth
import networkx as nx
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
import math
from mcmc_utils import *

matplotlib.use('Agg')
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})


# Treating the case when empty files are created. Such files
# are created if the algorithm was timed out.
if os.stat(snakemake.input["traj"]).st_size== 0:
    open(snakemake.output["filename"],'a').close()
else:
    df = pd.read_csv(snakemake.input["traj"], sep=",")

    edgesymb = get_edge_symb(df)
    nodeorder = get_node_order(df)
    
    
    print("burnin frac plot {}".format(float(snakemake.params["burnin_frac"])))
    
    # Create heatmap
    heatmap = estimate_heatmap(df, float(snakemake.params["burnin_frac"]), edgesymb)
    
    # need to reorganize matrix according to node orders..
    sns.set(font_scale=0.4)
    with sns.axes_style("white"):
        sns.heatmap(heatmap, 
                    #annot=True, 
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
    plt.ylabel("Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n") + "\n\nburn_in=" +
            snakemake.wildcards["burn_in"], rotation="horizontal", fontsize=6, ha="right", va="center")


    plt.tight_layout()
    plt.savefig(snakemake.output["filename"])
    plt.clf()
