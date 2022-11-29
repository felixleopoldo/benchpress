sys.path.append("/home/f/l/flrios/git/CStrees/src")
import cstrees.cstree as ct
import numpy as np
import networkx as nx

np.random.seed(int(snakemake.wildcards["replicate"]))
p = int(snakemake.wildcards["p"])

t = ct.sample_cstree(p)

df =  t.to_df()
print(df)

df.to_csv(snakemake.output["adjmat"], index=False)
