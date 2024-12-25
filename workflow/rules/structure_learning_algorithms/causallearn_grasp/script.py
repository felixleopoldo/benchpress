sys.path.append("workflow/scripts/utils")

import time
import numpy as np
import pandas as pd
from add_timeout import *

from causallearn.search.PermutationBased.GRaSP import grasp


def myalg():
    # Read in data (not used in this algorithm)
    df = pd.read_csv(snakemake.input["data"])

    # The algorithm goes here
    p = df.shape[1]
    np.random.seed(int(snakemake.wildcards["seed"]))
    
    
    ######### GRaSP ##########
    maxP = int(snakemake.wildcards["maxP"])
    G = grasp(df, maxP=maxP)

    adjmat = np.zeros(p*p, dtype=int).reshape((p, p))
    
    for i in range(p):
        for j in range(p):
            if (G.graph[j,i] == 1) and (G.graph[i,j] == -1):
                adjmat[i,j] = 1
            elif (G.graph[j,i] == -1) and (G.graph[i,j] == -1):
                adjmat[i,j] = 1
                adjmat[j,i] = 1
    ########## End GRaSP #########

    # Save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # Save adjmat
    adjmat_df = pd.DataFrame(adjmat)
    adjmat_df.columns = df.columns
    adjmat_df.to_csv(snakemake.output["adjmat"], index=False)

    # ntests is not applicable for this algorithm
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")


# This part starts the timer 
start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    myalg()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  snakemake.output["adjmat"],
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        myalg()