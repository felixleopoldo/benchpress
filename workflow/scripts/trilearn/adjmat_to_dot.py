import networkx as nx 
import pandas as pd
from networkx.drawing.nx_agraph import write_dot
import sys

adjmat_filename = sys.argv[1]
dot_filename = sys.argv[2]

df = pd.read_csv(adjmat_filename, dtype=int)
adjmat = df.values

mapping  = {i:val for i,val in enumerate(list(df))}
graph = nx.from_numpy_array(adjmat)

graph = nx.relabel_nodes(graph, mapping)

write_dot(graph, dot_filename)