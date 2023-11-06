import numpy as np
import pandas as pd

from gues.sample import sample_causal_dag
from gues import grues


def grues_wrap(sm_data, sm_mcmc_seed, sm_n_iterations):
    # Read in data, seed, and params
    df = pd.read_csv(sm_data)
    rng = np.random.default_rng(sm_mcmc_seed)
    mc_len = int(sm_n_iterations)

    # run MCMC
    model = grues.InputData(df.to_numpy(), rng)
    model.mcmc(max_moves=mc_len)

    # Save time
    # tottime = time.perf_counter() - start
    # with open(snakemake.output["time"], "w") as text_file:
    #     text_file.write(str(tottime))

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

    with open("test_seqgraph.csv", "w") as f:
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


uec, dag_adj, sample = sample_causal_dag(5, 0.3, return_uec=True)

sm_data = "../../../../resources/data/mydatasets/2005_sachs_2_cd3cd28icam2_log_std.csv"
grues_wrap(sm_data, 0, 10)
