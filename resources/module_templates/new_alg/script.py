sys.path.append("workflow/scripts/utils")
# If you have a local folder for your program/library, you can add it to the path here.
# sys.path.append("/path/to/my/local/python_lib")

import time
import numpy as np
import pandas as pd
from add_timeout import *

def myalg():
    # Read in data (not used in this algorithm)
    df = pd.read_csv(snakemake.input["data"])

    # The algorithm goes here
    p = df.shape[1]
    np.random.seed(int(snakemake.wildcards["seed"]))
    
    m = np.random.rand(p*p).reshape((p, p))
    m = m > float(snakemake.wildcards["cutoff"])
    adjmat = (m | m.T) * 1
    np.fill_diagonal(adjmat, 0)
    adjmat.astype(int)

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