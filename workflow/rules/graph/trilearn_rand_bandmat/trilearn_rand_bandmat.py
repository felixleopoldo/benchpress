#!/usr/bin/env python2
# Generated a graph with band adjacency matrix with maximum bandwith.

from trilearn.graph import decomposable as dlib
import networkx as nx
import numpy as np
import pandas as pd
import sys

seed = int(sys.argv[2])
dim = int(sys.argv[3])
max_bandwidth = int(sys.argv[4])
filename = sys.argv[1]

np.random.seed(seed)
g = dlib.sample_random_AR_graph(dim, max_bandwidth)

m = nx.to_numpy_matrix(g)
df = pd.DataFrame(m, dtype=int)
df.to_csv(filename, index=None)
