from castle.datasets import DAG
import pandas as pd

p = int(snakemake.wildcards["n_nodes"])
d = int(snakemake.wildcards["n_edges"])

if snakemake.wildcards["method"] == "er":
    adjmat = DAG.erdos_renyi(n_nodes=p,
                             n_edges=d,
                             weight_range=None,
                             seed=int(snakemake.wildcards["seed"]))
elif snakemake.wildcards["method"] == "sf":
    adjmat = DAG.scale_free(n_nodes=p,
                            n_edges=d,
                            weight_range=None,
                            seed=int(snakemake.wildcards["seed"]))

pd.DataFrame(adjmat, dtype=int).to_csv(snakemake.output["adjmat"], index=None)