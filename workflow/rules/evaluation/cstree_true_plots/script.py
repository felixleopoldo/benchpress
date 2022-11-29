sys.path.append("/home/f/l/flrios/git/CStrees/src")
import random
import pandas as pd
import networkx as nx
import numpy as np
import cstrees.cstree as ct

# Note this is only possible for small graphs p<20 and only 
# meaningful if the plot fits into the screen.

df = pd.read_csv(snakemake.input["cstree"], header=[0, 1])

seed = 1 # int(snakemake.wildcards["replicate"])

# Check if dimension < 6  
tt = ct.df_to_cstree(df)
np.random.seed(seed)
random.seed(seed)

# Need to get the parameters here.. or we plot without probabilities.
tt.set_random_stage_parameters() # This should not be necessary

agraph = tt.plot()
agraph.draw(snakemake.output["plot"])