wc = snakemake.wildcards
sys.path.append(wc["libdir"])
import cstrees.cstree as ct
import numpy as np
import networkx as nx


np.random.seed(int(wc["replicate"]))
p = int(wc["p"])

#t = ct.sample_cstree(p)
cards = [2] * p

t = ct.sample_cstree(cards, 
                     max_cvars=wc["max_cvars"], 
                     prob_cvar=wc["prob_cvar"], 
                     prop_nonsingleton=1)
#t.set_random_stage_parameters()
#t.create_tree()
#t.set_random_parameters()
#a = t.plot()
#x = t.sample(1500)

df =  t.to_df()
print(df)

df.to_csv(snakemake.output["adjmat"], index=False)
