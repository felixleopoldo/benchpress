import json
import pandas as pd 
import numpy as np
import networkx as nx
#import matplotlib.pyplot as plt


all_trajs = [[] for _ in snakemake.input["adjvecs"]]

i=0
for adjvecs_file in snakemake.input["adjvecs"]:
    with open(adjvecs_file) as f:
        data = json.load(f)
    
    # create adjmats
    for adjvec in data:
        l = int(np.sqrt(len(adjvec)))
        mat = np.array(adjvec, dtype=int).reshape(l,l)
        all_trajs[i].append(mat)
    i +=1

size_traj = pd.Series([np.sum(m)/2 for m in all_trajs[0]])

size_traj.to_csv(snakemake.output["traj"], index=False, header=False)