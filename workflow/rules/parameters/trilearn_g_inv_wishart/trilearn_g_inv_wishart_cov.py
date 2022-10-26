# Given a decomposable graph (adjacency matrix) samples a covariance matrix from the
# graph inverse Wishart distribution.

import sys
import numpy as np
import pandas as pd
from trilearn.distributions import g_inv_wishart
import networkx as nx

adjmat = sys.argv[1]

df = pd.read_csv(adjmat)

graph = nx.from_numpy_array(df.values)
filename = sys.argv[2]

p = graph.order()
b = p + float(sys.argv[3])
D = np.matrix(np.identity(p))  # Scale parameter

seed = int(sys.argv[4])

np.random.seed(seed)

sigma = g_inv_wishart.sample(graph, b, D)

df = pd.DataFrame(sigma).to_csv(filename, index=False)
