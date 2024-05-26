# Converts an adjacency matrix of a graph into dot format.

import networkx as nx
import pandas as pd
from networkx.drawing.nx_agraph import write_dot
import sys
import numpy as np

adjmat_filename = sys.argv[1]
dot_filename = sys.argv[2]

df = pd.read_csv(adjmat_filename, dtype=int)
adjmat = df.values

mapping = {i: val for i, val in enumerate(list(df))}

# Separate cases for the undirected and directed/mixed graphs
graph = None
if (np.transpose(adjmat) == adjmat).all():
    graph = nx.from_numpy_array(adjmat, create_using=nx.Graph())
    graph = nx.relabel_nodes(graph, mapping)
    write_dot(graph, dot_filename)
else:
    graph = nx.from_numpy_array(adjmat, create_using=nx.DiGraph())
    graph = nx.relabel_nodes(graph, mapping)

    # convert to pygrapviz graph and set some edge properties, dir=none for undirected edges
    agraph = nx.nx_agraph.to_agraph(graph)    
    for i in range(adjmat.shape[0]):
        for j in range(adjmat.shape[1]):
            if (adjmat[i, j] == 1) and (adjmat[j, i] == 1):
                agraph.remove_edge(mapping[j], mapping[i])
                # add the same edge but without direction
                agraph.add_edge(mapping[i], mapping[j], dir="none")

    agraph.draw(dot_filename, prog= 'dot')