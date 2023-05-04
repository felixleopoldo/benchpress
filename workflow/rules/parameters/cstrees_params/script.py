import random
import pandas as pd
import networkx as nx
import numpy as np
import cstrees.cstree as ct
sys.path.append("/home/f/l/flrios/git/CStrees/src")

wc = snakemake.wildcards

seed = int(wc["replicate"])

df = pd.read_csv(snakemake.input["adjmat"], header=[0, 1])
print(df)

tt = ct.df_to_cstree(df)
np.random.seed(seed)  # 9
random.seed(seed)

ns = 0
tt.set_random_stage_parameters(alpha=float(wc["alpha"]))
for l, sl in tt.stages.items():
    for s in sl:
        ns += 1
        print(s)

dfparams = pd.DataFrame({"seed": [seed],
                         "alpha": [float(wc["alpha"])]})

dfparams.to_csv(snakemake.output["params"], index=False)

# {
#     "graph_id": "jackdag.csv",
#     "parameters_id": "jackparams.csv",
#     "data_id": "nonstandardized",
#     "seed_range": [
#         1,
#         1
#     ]
# }

# {
#     "graph_id": "test",
#     "parameters_id": "ctparams",
#     "data_id": "nonstandardized",
#     "seed_range": [
#         1,
#         1
#     ]
# },