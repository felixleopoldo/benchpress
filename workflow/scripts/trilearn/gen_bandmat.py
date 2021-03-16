from trilearn.graph import decomposable as dlib
import networkx as nx
import numpy as np
import pandas as pd
import sys 
print str(sys.argv)
seed = int(sys.argv[2])
dim = int(sys.argv[3])#int(snakemake.wildcards["dim"])
bandwidth = int(sys.argv[4])#int(snakemake.wildcards["bandwidth"])
filename = sys.argv[1] #snakemake.output["adjmat"]

np.random.seed(seed)
g = dlib.gen_AR2_graph(dim)

m = nx.to_numpy_matrix(g)
print(g)
df = pd.DataFrame(m, dtype=int)

df.to_csv(filename, index=None)
