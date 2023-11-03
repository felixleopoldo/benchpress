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
    df = pd.read_csv(snakemake.input["data"])
    rng = np.random.seed(int(snakemake.wildcards["mcmc_seed"]))
    mc_len = int(snakemake.wildcards["n_iterations"])

    # run MCMC
    model = grues.InputData(df.to_numpy(), rng)
    model.mcmc(max_moves=mc_len)

    # Save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # Convert to and save seqgraph
    labels = df.head()
    first = labels[0]
    others = labels[1:]
    first_to_others = ";".join((f"{first}-{other}" for other in others))

    all_uecs = model.uec_markov_chain
    all_scores = model.nuc_markov_chain
    change_idcs = (all_scores[:-1] != all_scores[1:]).flatnonzero()

    edges_init = np.triu(all_uecs[0]).argwhere()
    score_init = all_scores[0]
    add_init = ";".join((f"{labels[i]}-{labels[j]}" for (i, j) in edges_init))

    with open(snakemake.output["seqgraph"], "w") as f:
        f.write("index,score,added,removed")
        f.write(f"-2,0.0,[{first_to_others}],[]")
        f.write(f"-1,0.0,[],[{first_to_others}]")
        f.write(f"0,{score_init},[{add_init}],[]")
        for idx in change_idcs:
            score = all_scores[idx]
            uec_1, uec_2 = all_uecs[idx : idx + 2]
            added_edges = np.triu(~uec_1 & uec_2).argwhere()
            add = ";".join((f"{labels[i]}-{labels[j]}" for (i, j) in added_edges))
            rmed_edges = np.triu(uec_1 & ~uec_2).argwhere()
            rm = ";".join((f"{labels[i]}-{labels[j]}" for (i, j) in rmed_edges))
            f.write(f"{idx},{score},[{add}],[{rm}]")


# This part starts the timer
start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    grues_wrap()
else:
    with timeoutf(
        int(snakemake.wildcards["timeout"]),
        snakemake.output["seqgraph"],
        snakemake.output["time"],
        snakemake.output["ntests"],
        start,
    ):
        grues_wrap()
