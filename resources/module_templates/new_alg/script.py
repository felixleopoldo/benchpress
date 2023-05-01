sys.path.append("workflow/scripts/utils")
from add_timeout import *

import numpy as np
import time
import pandas as pd


def wrapper():

    seed = int(snakemake.wildcards["replicate"])
    df = pd.read_csv(snakemake.input["data"])
    samples = df.values

    # The algorithm goes here.
    p = df.shape[1]
    np.random.seed(seed)

    m = np.random.randint(p*p, size=(p, p))
    adjmat = (m + m.T) / 2
    np.fill_diagonal(adjmat, 0)
    adjmat.as_type(int)

    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save adjmat
    adjmat_df = pd.DataFrame(adjmat)
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

