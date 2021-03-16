import trilearn.graph.decomposable
import trilearn.graph.graph as libg
from trilearn.distributions import discrete_dec_log_linear as loglin
import numpy as np
import pandas as pd
import networkx as nx
import json
import sys

seed = int(sys.argv[1])#int(snakemake.wildcards["seed"])

np.random.seed(seed)
param_filename = sys.argv[2]#snakemake.input["bn"]
data_samples = int(sys.argv[4])#int(snakemake.wildcards["sample_size"])
data_filename = sys.argv[3]#snakemake.output["data"]

parameters = loglin.read_local_hyper_consistent_parameters_from_json_file(param_filename)
with open(param_filename) as data_file:
    json_parameters = json.load(data_file)

graph = nx.Graph()
nodes = set()
for k in json_parameters.keys():
    if k=="no_levels":
        continue
    clique = json.loads(k)
    g = nx.complete_graph(clique)
    graph.add_edges_from(g.edges())
    graph.add_nodes_from(g.nodes())

no_levels = np.array(json_parameters["no_levels"])
levels = [range(l) for l in no_levels]

table = loglin.locals_to_joint_prob_table(graph, parameters, levels)

data = loglin.sample(table, data_samples)

data = np.vstack((no_levels, data))
data = np.vstack((range(graph.order()), data))
np.savetxt(data_filename, data, delimiter=',', fmt="%i")