import trilearn.distributions.g_intra_class as gic
import networkx as nx
import numpy as np
import pandas as pd
import sys


adjmat = sys.argv[1]
df = pd.read_csv(adjmat)

graph =  nx.from_numpy_array(df.values)

filename = sys.argv[2]

rho = float(sys.argv[3])
s2 = float(sys.argv[4])

c = gic.cov_matrix(graph, rho, s2)

df = pd.DataFrame(c).to_csv(filename, index=False)