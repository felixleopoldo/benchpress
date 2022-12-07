sys.path.append("workflow/scripts/utils")

sys.path.append("/home/f/l/flrios/git/CStrees/src")
import cstrees.cstree as ct
import numpy as np
import networkx as nx

from add_timeout import *
import time
import pandas as pd


def wrapper():


    seed = int(snakemake.wildcards["replicate"]) + 100
    df = pd.read_csv(snakemake.input["data"])
    samples = df.values
    p = df.shape[1]
    np.random.seed(seed)

    # Just sample a random tree instead of a proper estimate.
    t = ct.sample_cstree(p) 
    df_cstree =  t.to_df()
    print(df_cstree)

    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save cstree
    df_cstree.to_csv(snakemake.output["cstree"], index=False)

    # ntests is not applicable
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")

# Use timeout if not None
start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    wrapper()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  snakemake.output["cstree"],
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        wrapper()

