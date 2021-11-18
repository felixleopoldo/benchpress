# Samples a decomposable graph from the Christma tree algorithm.

from trilearn.graph import decomposable as dlib
import networkx as nx
import numpy as np
import pandas as pd
import sys

seed = int(sys.argv[2])
dim = int(sys.argv[3])
alpha = float(sys.argv[4])
beta = float(sys.argv[5])
filename = sys.argv[1]

np.random.seed(seed)
g = dlib.sample(dim, alpha=alpha, beta=beta)

m = nx.to_numpy_matrix(g)
df = pd.DataFrame(m, dtype=int)
df.to_csv(filename, index=None)
