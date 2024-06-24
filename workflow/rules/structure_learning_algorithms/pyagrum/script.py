sys.path.append("workflow/scripts/utils")
# If you have a local folder for your program/library, you can add it to the path here.
# sys.path.append("/path/to/my/local/python_lib")
import os
import time
import numpy as np
import pandas as pd
from add_timeout import *
import pyAgrum as gum
from pyAgrum import BayesNet
from pathlib import Path
import csv


def adjacency_to_csv(bn: BayesNet, *, to_file: str):

    id_to_name = {bn.idFromName(name): name for name in bn.names()}

    with Path(to_file).open(mode="w", encoding="utf-8") as csvfile:
        writer = csv.writer(csvfile)
        # write header
        writer.writerow(id_to_name[col_id] for col_id in range(bn.size()))
        #write rows
        adj_mat = bn.adjacencyMatrix()
        writer.writerows(row for row in adj_mat)

def myalg():
    # Read in data (not used in this algorithm)
    df = pd.read_csv(snakemake.input["data"])

    # The algorithm goes here
    np.random.seed(int(snakemake.wildcards["seed"]))
    
    df = df.iloc[1:] # remove the first row with cardinalities

    tmpfile = snakemake.output["adjmat"] + ".tmp.csv"  # save the data to a temporary file
    df.to_csv(tmpfile, index=False) 

    learner=gum.BNLearner(tmpfile) # MIIC is used as default (some score-based are also implented)
    
    os.remove(tmpfile) # remove the temporary file
   
    if eval(snakemake.wildcards["useMDLCorrection"]):
        learner.useMDLCorrection() # for small dataset
        
    if eval(snakemake.wildcards["useSmoothingPrior"]):
        learner.useSmoothingPrior() # smoothing (default weight=1) for parameters

    bn = learner.learnBN() # learning
    
    # Save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # Save adjmat
    adjacency_to_csv(bn, to_file=snakemake.output["adjmat"])

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