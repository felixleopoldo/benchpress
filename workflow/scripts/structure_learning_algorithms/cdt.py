sys.path.append("workflow/scripts/utils")

import time
import numpy as np
import pandas as pd
import networkx as nx
from add_timeout import *


def wrapper():
    # read data
    df = pd.read_csv(snakemake.input["data"])
    
    # random seed
    np.random.seed(int(snakemake.wildcards["seed"]))
    
    
    if(snakemake.params["alg"] == "cam"):
        from cdt.causality.graph import CAM
        cam = CAM(score=snakemake.wildcards["score"],
                  cutoff=float(snakemake.wildcards["cutoff"]),
                  variablesel=eval(snakemake.wildcards["variablesel"]),
                  selmethod=snakemake.wildcards["selmethod"],
                  pruning=eval(snakemake.wildcards["pruning"]),
                  prunmethod=snakemake.wildcards["prunmethod"])
        nx_g = cam.create_graph_from_data(df)

    else:
        raise ValueError("Unrecognised CDT algorithm!")
    
    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save adjmat
    adjmat_df = pd.DataFrame(np.array(nx.adjacency_matrix(nx_g, df.columns).todense()))
    adjmat_df.columns = df.columns
    adjmat_df.to_csv(snakemake.output["adjmat"], index=False)

    # ntests is not applicable for this algorithm
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")


start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    wrapper()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  snakemake.output["adjmat"],
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        wrapper()
