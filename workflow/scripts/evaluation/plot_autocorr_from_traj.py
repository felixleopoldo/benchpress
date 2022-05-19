# Reads agraph trajectory and plots the auto-correlation of a given functional.

import os
import sys
import statsmodels.api as sm
import seaborn as sns
from pandas.plotting import autocorrelation_plot
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import networkx as nx
import matplotlib
matplotlib.use('Agg')

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
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1])
             for edge in edges_str if len(edge.split(edgesymb)) == 2]
    return edges


# Treating the case when empty files are created. Such files
# are created if the algorithm was timed out.
if os.stat(snakemake.input["traj"]).st_size== 0:
    open(snakemake.output["plot"],'a').close()
else:

    df = pd.read_csv(snakemake.input["traj"], sep=",")

    if snakemake.wildcards["functional"] == "size":

        edges = edges_str_to_list(df["added"][0], edgesymb="->")
        if len(edges) != 0:
            g = nx.DiGraph()
            edgesymb = "->"
        else:
            edgesymb = "-"
            g = nx.Graph()

        size = []

        for index, row in df.iterrows():
            added = edges_str_to_list(row["added"], edgesymb)
            removed = edges_str_to_list(row["removed"], edgesymb)
            g.add_edges_from(added)
            g.remove_edges_from(removed)
            size.append(g.size())

        df["size"] = size
        T = df["index"].iloc[-1]  # approximate length

        newindex = pd.Series(range(T))
        # removes the two first rows.
        df2 = df[["index", "size"]][2:].set_index("index")

        df2 = df2.reindex(newindex).reset_index().reindex(
            columns=df2.columns).fillna(method="ffill")

        if snakemake.wildcards["thinning"] != "None":
            dfplot = df2["size"][int(snakemake.wildcards["burn_in"]):].iloc[::int(
                snakemake.wildcards["thinning"])]
        else:
            dfplot = df2["size"][int(snakemake.wildcards["burn_in"]):]
        # pd.plotting.autocorrelation_plot(dfplot.iloc[::int(snakemake.wildcards["thinning"])])

    elif snakemake.wildcards["functional"] == "score":
        T = df["index"].iloc[-1]  # approximate length

        newindex = pd.Series(range(T))

        # removes the two first rows.
        df2 = df[["index", "score"]][2:].set_index("index")
        df2 = df2.reindex(newindex).reset_index().reindex(
            columns=df2.columns).fillna(method="ffill")

        if snakemake.wildcards["thinning"] != "None":
            dfplot = df2[int(snakemake.wildcards["burn_in"]):][::int(snakemake.wildcards["thinning"])]
        else:
            dfplot = df2[int(snakemake.wildcards["burn_in"]):]

    if snakemake.wildcards["lags"] != "None":
        sm.graphics.tsa.plot_acf(dfplot, lags=int(snakemake.wildcards["lags"]))
    else:
        sm.graphics.tsa.plot_acf(dfplot)
    #autocorrelation_plot(df2["size"][int(snakemake.wildcards["burn_in"]):], n_samples=int(snakemake.wildcards["lags"]))

    # nlags = int(snakemake.wildcards["lags"])
    # lags = [dfplot.autocorr(lag=l) for l in range(1, nlags + 1)]

    # df = pd.DataFrame({"autocorr":lags, "nlags":range(1, nlags + 1) })

    # df.dropna().plot(x="nlags", y="autocorr")

    #plt.acorr(dfplot.values, usevlines=True, normed=True, maxlags=nlags)
    plt.title("Graph: "+snakemake.params["adjmat_string"] + "\nParameters: " +
            snakemake.params["param_string"] + "\nData: " + snakemake.params["data_string"], fontsize=6, ha="center")
    plt.ylabel(
        "Algorithm:\n\n"+snakemake.params["alg_string"].replace("/", "\n") +
        "\n\nPlot:\n\nburn_in="+snakemake.wildcards["burn_in"] +
        "\nthinning="+snakemake.wildcards["thinning"] +
        "\nlags="+snakemake.wildcards["lags"] +
        "\nfunctional="+snakemake.wildcards["functional"], rotation="horizontal", fontsize=6, ha="right", va="center")

    plt.tight_layout()
    plt.savefig(snakemake.output["plot"], dpi=300)
    plt.clf()
