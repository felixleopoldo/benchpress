import sys
import networkx as nx
import numpy as np


graph = nx.read_adjlist(sys.argv[1])
adjmat = nx.to_numpy_matrix(graph, dtype=int)

adjmat = np.vstack([range(adjmat.shape[0]), adjmat])

np.savetxt(sys.argv[2], adjmat, delimiter=",",fmt='%d')