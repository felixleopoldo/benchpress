from trilearn.graph import decomposable as dlib
import networkx as nx
import numpy as np
import pandas as pd

seed = int(snakemake.wildcards["seed"])
dim = int(snakemake.wildcards["dim")]
max_bandwidth = int(snakemake.wildcards["max_bandwidth"])
filename = snakemake.output["adjmat"]

np.random.seed(seed)
g = dlib.sample_random_AR_graph(dim, max_bandwidth)

m = nx.to_numpy_matrix(g)
df = pd.DataFrame(m, dtype=int)
df.to_csv(filename, index=None)