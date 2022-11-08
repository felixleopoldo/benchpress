from castle.datasets import IIDSimulation
import numpy as np
import pandas as pd


seed = int(snakemake.wildcards["seed"])
np.random.seed(seed)

df = pd.read_csv(snakemake.input["params"])

dataset = IIDSimulation(W=df.values,
                        n=int(snakemake.wildcards["n"]),
                        method=snakemake.wildcards["method"],
                        sem_type=snakemake.wildcards["sem_type"],
                        noise_scale=float(snakemake.wildcards["noise_scale"]),
                        )
                        
pd.DataFrame(dataset.X, columns=df.columns).to_csv(snakemake.output["data"], index=False)
