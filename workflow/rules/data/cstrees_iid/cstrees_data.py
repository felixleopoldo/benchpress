print("cstree data sampling")
sys.path.append("/home/f/l/flrios/git/CStrees/src")
import random
import pandas as pd
import networkx as nx
import numpy as np
import cstrees.cstree as ct

seed = int(snakemake.wildcards["seed"])

df = pd.read_csv(snakemake.input["cstree"], header=[0, 1])
print(df)

tt = ct.df_to_cstree(df)
# Note that the paramaters are generated here on the fly.
# We cant generate them separately in the parameters modules as
# the probability tree grows too fast. Instead we rely on the seed.

np.random.seed(seed) 
random.seed(seed)

ns = 0
# alpha is from the parameters as we for now dont store the parameters
# explicitly as the number of stages would blow for if we allow for
# singleton stages.
tt.set_random_stage_parameters(alpha=float(snakemake.wildcards["alpha"])) 
for l, sl in tt.stages.items():
    for s in sl:
        ns += 1
        print(s)

data = tt.sample(int(snakemake.wildcards["n"]))

datadf = pd.DataFrame(data)

datadf.columns = df.columns
print(datadf)

datadf.to_csv(snakemake.output["data"], index=False)
