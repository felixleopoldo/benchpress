from trilearn.graph import decomposable as dlib
import networkx as nx
import numpy as np
import pandas as pd

seed = int(snakemake.wildcards["seed"])
dim = int(snakemake.wildcards["dim"])
alpha = float(snakemake.wildcards["alpha"])
beta = float(snakemake.wildcards["beta"])
filename = snakemake.output["adjmat"]

np.random.seed(seed)
g = dlib.sample(dim, alpha=alpha, beta=beta)

m = nx.to_numpy_matrix(g)
df = pd.DataFrame(m, dtype=int)
df.to_csv(filename, index=None)
