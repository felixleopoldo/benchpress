import pandas as pd
import numpy as np
import networkx as nx          
import matplotlib
matplotlib.use('Agg')                                        
import matplotlib.pyplot as plt
from pandas.plotting import autocorrelation_plot
import seaborn as sns
import statsmodels.api as sm
import sys

#from pandas.compat import lmap


def autocorrelation_plot(series, n_samples=None, ax=None, **kwds):
    """Autocorrelation plot for time series.

    Parameters:
    -----------
    series: Time series
    ax: Matplotlib axis object, optional
    kwds : keywords
        Options to pass to matplotlib plotting method

    Returns:
    -----------
    ax: Matplotlib axis object
    """
    import matplotlib.pyplot as plt
    n = len(series)
    data = np.asarray(series)
    if ax is None:
        ax = plt.gca(xlim=(1, n_samples), ylim=(-1.0, 1.0))
    mean = np.mean(data)
    c0 = np.sum((data - mean) ** 2) / float(n)

    def r(h):
        return ((data[:n - h] - mean) *
                (data[h:] - mean)).sum() / float(n) / c0
    x = (np.arange(n) + 1).astype(int)
    y = lmap(r, x)
    z95 = 1.959963984540054
    z99 = 2.5758293035489004
    ax.axhline(y=z99 / np.sqrt(n), linestyle='--', color='grey')
    ax.axhline(y=z95 / np.sqrt(n), color='grey')
    ax.axhline(y=0.0, color='black')
    ax.axhline(y=-z95 / np.sqrt(n), color='grey')
    ax.axhline(y=-z99 / np.sqrt(n), linestyle='--', color='grey')
    ax.set_xlabel("Lag")
    ax.set_ylabel("Autocorrelation")
    if n_samples:
        ax.plot(x[:n_samples], y[:n_samples], **kwds)
    else:
        ax.plot(x, y, **kwds)
    if 'label' in kwds:
        ax.legend()
    ax.grid()
    return ax

sns.set_style("whitegrid")

def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1]) for edge in edges_str if len(edge.split(edgesymb))==2]
    return edges


df = pd.read_csv(snakemake.input["traj"], sep=",")

edges = edges_str_to_list(df["added"][0], edgesymb="->")
if len(edges) != 0:
    g = nx.DiGraph()
    edgesymb="->"
else:
    edgesymb="-"
    g = nx.Graph()    

size = []

for index, row in df.iterrows():
    added = edges_str_to_list(row["added"], edgesymb)
    removed = edges_str_to_list(row["removed"], edgesymb)
    g.add_edges_from(added)
    g.remove_edges_from(removed)
    size.append(g.size())

df["size"] = size
T= df["index"].iloc[-1] # approximate length

newindex = pd.Series(range(T))
df2 = df[["index","size"]][2:].set_index("index") # removes the two first rows.

df2 = df2.reindex(newindex).reset_index().reindex(columns=df2.columns).fillna(method="ffill")

dfplot = df2["size"][int(snakemake.wildcards["burn_in"]):]
pd.plotting.autocorrelation_plot(dfplot)
#sm.graphics.tsa.plot_acf(df2["size"][int(snakemake.wildcards["burn_in"]):], lags=int(snakemake.wildcards["lags"]))
#autocorrelation_plot(df2["size"][int(snakemake.wildcards["burn_in"]):], n_samples=int(snakemake.wildcards["lags"]))

# nlags = int(snakemake.wildcards["lags"])
# lags = []
# for l in range(1,nlags + 1):
#     print(dfplot.autocorr(lag=l))
#     lags.append(dfplot.autocorr(lag=l))

# plt.plot(range(1, nlags + 1), lags)

plt.savefig(snakemake.output["plot"])
plt.clf()


