# This script joins processed graph trajectories into one file. (it might become too large)
import pandas as pd
import numpy as np


traj = pd.read_csv(snakemake.input["traj"], index_col=0)

acs = []
for lag in range(1, int(snakemake.wildcards["lags"])+1):
    acs.append(traj["plotvalue"].autocorr(lag))
        
varying_param = traj["param"].unique()[0]
varying_param_val = traj["param_val"].unique()[0]

thinning = int(1)
if snakemake.wildcards["thinning"] != "None":
    thinning = int(snakemake.wildcards["thinning"])

df = pd.DataFrame({"plotvalue":acs}, index=np.arange(1, int(snakemake.wildcards["lags"])+1) * thinning)


df["param"] = varying_param
df["param_val"] = varying_param_val
df["seed"] = snakemake.wildcards["seed"]
df["mcmc_seed"] = snakemake.wildcards["mcmc_seed"]
df["alg"] = snakemake.params["alg"]
df["id"] = snakemake.wildcards["id"]
df["functional"] = snakemake.wildcards["functional"]
df["adjmat"] = snakemake.params["adjmat_string"]
df["parameters"] = snakemake.params["param_string"]
df["data"] = snakemake.params["data_string"]
df["alg_string"] = snakemake.params["alg_string"]
df["eval_string"] = snakemake.params["eval_string"]

df.index.name = 'sample'
df.to_csv(snakemake.output["traj"])
