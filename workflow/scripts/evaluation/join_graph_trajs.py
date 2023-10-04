# This script joins processed graph trajectories into one file. (it might become too large)
import pandas as pd

df = pd.DataFrame()
for filename in snakemake.input["trajs"]:
  tmp = pd.read_csv(filename, index_col=0)
  df = pd.concat([df, tmp])

df.index.name = 'sample'
df.to_csv(snakemake.output["trajs"])
