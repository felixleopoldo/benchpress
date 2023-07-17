sys.path.append("workflow/scripts/utils")
# If you have a local folder for your program/library, you can add it to the path here.
# sys.path.append("/path/to/my/local/python_lib")

import time

import numpy as np
import pandas as pd
from gues import grues

from add_timeout import *


def grues_wrap():
    # Read in data, seed, and params
    sample = pd.read_csv(snakemake.input["data"]).to_numpy()
    rng = np.random.seed(int(snakemake.wildcards["mcmc_seed"]))
    mc_len = int(int(snakemake.wildcards["n_iterations"]))

    # run MCMC
    model = grues.InputData(df)

    # Save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # Save seqgraph
    seqgraph_df = pd.DataFrame()
    seqgraph_df.to_csv(snakemake.output["seqgraph"], index=False)


# This part starts the timer
start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    grues_wrap()
else:
    with timeoutf(
        int(snakemake.wildcards["timeout"]),
        snakemake.output["adjmat"],
        snakemake.output["time"],
        snakemake.output["ntests"],
        start,
    ):
        grues_wrap()
