sys.path.append("workflow/scripts/utils")
# If you have a local folder for your program/library, you can add it to the path here.
# sys.path.append("/path/to/my/local/python_lib")

from os import PRIO_PGRP
import time

import numpy as np
import pandas as pd
from gues import grues

from add_timeout import *


def grues_wrap():
    # Read in data, seed, and params
    df = pd.read_csv(snakemake.input["data"])
    rng = np.random.default_rng(int(snakemake.wildcards["mcmc_seed"]))
    mc_len = int(snakemake.wildcards["n_iterations"])

    # set prior
    prior_n_sources = int(snakemake.wildcards["prior_n_sources"])
    if prior_n_sources == 0:
        prior = None
    else:
        prior = (prior_n_sources, df.shape[1])

    # run MCMC
    model = grues.InputData(df.to_numpy(), rng)
    model.mcmc(init=("gauss", 0.05), max_moves=mc_len, prior=prior)

    # Save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # Convert to and save seqgraph
    labels = df.columns
    first = labels[0]
    others = labels[1:]
    first_to_others = ";".join((f"{first}-{other}" for other in others))

    all_uecs = model.uec_markov_chain
    all_scores = model.nuc_markov_chain
    change_idcs = np.flatnonzero(all_scores[:-1] != all_scores[1:])

    edges_init = np.argwhere(np.triu(all_uecs[0]))
    score_init = all_scores[0]
    add_init = ";".join((f"{labels[i]}-{labels[j]}" for (i, j) in edges_init))

    with open(snakemake.output["seqgraph"], "w") as f:
        f.write("index,score,added,removed\n")
        f.write(f"-2,0.0,[{first_to_others}],[]\n")
        f.write(f"-1,0.0,[],[{first_to_others}]\n")
        f.write(f"0,{score_init},[{add_init}],[]\n")
        for idx in change_idcs:
            score = all_scores[idx]
            uec_1, uec_2 = all_uecs[idx : idx + 2]
            added_edges = np.argwhere(np.triu(~uec_1 & uec_2))
            add = ";".join((f"{labels[i]}-{labels[j]}" for (i, j) in added_edges))
            rmed_edges = np.argwhere(np.triu(uec_1 & ~uec_2))
            rm = ";".join((f"{labels[i]}-{labels[j]}" for (i, j) in rmed_edges))
            f.write(f"{idx+1},{score},[{add}],[{rm}]\n")


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
