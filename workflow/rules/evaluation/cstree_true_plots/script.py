sys.path.append("/home/f/l/flrios/git/CStrees/src")
import random
import tarfile
import os.path
import os
import pandas as pd
import networkx as nx
import numpy as np
import cstrees.cstree as ct


def make_tarfile(output_filename, source_dir):
    with tarfile.open(output_filename, "w:gz") as tar:
        tar.add(source_dir, arcname=os.path.basename(source_dir))

# Note this is only possible for small graphs p<20 and only 
# meaningful if the plot fits into the screen.

df = pd.read_csv(snakemake.input["cstree"], header=[0, 1])

seed = 1 # int(snakemake.wildcards["replicate"])

tt = ct.df_to_cstree(df)
np.random.seed(seed)
random.seed(seed)

# Need to get the parameters here.. or we plot without probabilities.
tt.set_random_stage_parameters() # This should not be necessary


# Check dimension  
if df.shape[1] > 6:
    with open(snakemake.output["cstree"], 'w') as fp:
        pass
else:
    agraph = tt.plot()
    agraph.draw(snakemake.output["cstree"])

rels = tt.csi_relations()
adjmats = ct.csi_relations_to_dags(rels, tt.co)

os.mkdir(snakemake.output["csdags"])

for key, graph in adjmats.items():
    agraph = nx.nx_agraph.to_agraph(graph)
    agraph.layout("dot")
    agraph.draw(snakemake.output["csdags"]+"/"+str(key) + ".png")
