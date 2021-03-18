import json
import pandas as pd 
import numpy as np
import networkx as nx
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

all_trajs = []

with open(snakemake.input["traj"]) as f:
    data = json.load(f)

# create adjmats
for adjvec in data:
    l = int(np.sqrt(len(adjvec)))
    mat = np.array(adjvec, dtype=int).reshape(l,l)
    all_trajs.append(mat)

size_traj = pd.Series([np.sum(m)/2 for m in all_trajs])

pd.plotting.autocorrelation_plot(size_traj)

plt.savefig(snakemake.output["plot"])

#size_traj.to_csv(snakemake.output["plot"] +".csv", index=False, header=False)
