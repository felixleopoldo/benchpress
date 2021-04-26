import pandas as pd
import numpy as np
import networkx as nx      
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from pandas.plotting import autocorrelation_plot
import seaborn as sns
from trilearn.graph import trajectory
import sys

sns.set_style("whitegrid")

def edges_str_to_list(str):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split("-")[0], edge.split("-")[1]) for edge in edges_str if len(edge.split("-"))==2]
    return edges

df = pd.read_csv(sys.argv[1], sep=",")


g = nx.Graph()
size = []

for index, row in df.iterrows():
    added = edges_str_to_list(row["added"])
    removed = edges_str_to_list(row["removed"])
    g.add_edges_from(added)
    g.remove_edges_from(removed)
    size.append(g.size())

df["size"] = size
T= df["index"].iloc[-1] # approximate length

newindex = pd.Series(range(T))
df2 = df[["index","size","score"]][2:].set_index("index") # removes the two first rows.

df2 = df2.reindex(newindex).reset_index().reindex(columns=df2.columns).fillna(method="ffill")


df_noburnin = df2[int(T*0.3):]
df_noburnin["size"].plot()

plt.savefig(sys.argv[2])



traj_length = len(df_noburnin)

print(sys.argv[1])
print("Traj length " +str(traj_length))

B = 10000
sizes = np.zeros(B)
for i in range(B):
    tmpdf = df_noburnin.sample(n=T/4, replace=True)["size"]
    sizes[i] = tmpdf.mean()


boot_mean = sizes.mean()
print("boot mean: " + str(boot_mean))

boot_stderr = np.sqrt(sum((sizes - boot_mean)**2) / (B-1))

print("boot stderr: " + str(boot_stderr))

