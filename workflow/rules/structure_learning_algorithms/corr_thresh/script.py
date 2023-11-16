sys.path.append("workflow/scripts/utils")
from add_timeout import *
from operator import invert

import numpy as np
from contextlib import contextmanager
import time
import pandas as pd
from numpy.linalg import inv

def wrapper():

    seed = int(snakemake.wildcards["seed"])
    df = pd.read_csv(snakemake.input["data"])
    
    
    samples = df.values

    # The algorithm context goes here.
    
    p = df.shape[1]
    np.random.seed(seed)

    m = np.random.randint(p*p, size=(p, p))
    adjmat = (m + m.T) / 2
    np.fill_diagonal(adjmat, 0)
    adjmat.astype(int)
    
    corr = df.corr().values
    prec = inv(corr)

    np.fill_diagonal(prec, 0)
    np.fill_diagonal(corr, 0)
    
    corr = (np.abs(corr) > float(snakemake.wildcards["thresh"])) * 1
    prec = (np.abs(prec) > float(snakemake.wildcards["thresh"])) * 1
    corr.astype(int)
    prec.astype(int)

    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save adjmat
    adjmat_df = pd.DataFrame(corr)
    adjmat_df.columns = df.columns
    adjmat_df.to_csv(snakemake.output["adjmat"], index=False)

    # ntests is not applicable
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")


# Use timeout if not None
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

