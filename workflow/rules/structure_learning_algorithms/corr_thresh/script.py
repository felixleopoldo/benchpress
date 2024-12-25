sys.path.append("workflow/scripts/utils")
from add_timeout import *
from operator import invert

import numpy as np
from contextlib import contextmanager
import time
import pandas as pd
from numpy.linalg import inv

from scipy import stats

def wrapper():

    seed = int(snakemake.wildcards["seed"])
    df = pd.read_csv(snakemake.input["data"])
    
    
    samples = df.values

    # The algorithm context goes here.
    
    p = df.shape[1]
    np.random.seed(seed)


    adjmat = None
    if snakemake.wildcards["method"] == "corr":

        corr = df.corr().values
        prec = inv(corr)

        np.fill_diagonal(prec, 0)
        np.fill_diagonal(corr, 0)
        
        corr = (np.abs(corr) > float(snakemake.wildcards["thresh"])) * 1
        prec = (np.abs(prec) > float(snakemake.wildcards["thresh"])) * 1
        corr.astype(int)
        prec.astype(int)
        adjmat = corr
        
    elif snakemake.wildcards["method"] == "pval":
        adjmat = np.zeros((p,p))
        for i in range(p-1):
            for j in range(i+1,p):
                # # TODO: Between discrete and continuous variables we should do a KS test
                # # check if col i is discrete
                # if df[df.columns[i]].dtype == "object":
                #     # if it is, check if col j is discrete
                #     if df[df.columns[j]].dtype == "object":
                #         # if both are discrete, do a chi2 test
                #         x = df[df.columns[i]].values
                #         y = df[df.columns[j]].values
                #         # create a contingency table
                #         table = pd.crosstab(x,y)
                #         # do the chi2 test
                #         chi2, pval, _, _ = stats.chi2_contingency(table)
                #     else:
                #         # if i is discrete and j is continuous, do a KS test
                #         x = df[df.columns[i]].values
                #         y = df[df.columns[j]].values
                #         _, pval = stats.ks_2samp(x, y)
                                                
                x = samples[:,i]
                y = samples[:,j]
                # create a dataframe with the two columns and drop the rows with NaN
                df2 = pd.DataFrame({df.columns[i]: x, df.columns[j]: y})
                df2 = df2.dropna()
                x = df2[df.columns[i]].values
                y = df2[df.columns[j]].values
                                                
                corr = stats.pearsonr(x, y)                                
                #r = np.corrcoef(x,y)[0,1]
                #t = r*np.sqrt((len(x)-2)/(1-r**2))
                #pval = 2*(1 - stats.t.cdf(np.abs(t), len(x)-2))
                
                pval = corr.pvalue                
                # print with 2 decimals
                
                adjmat[i,j] = pval
                adjmat[j,i] = pval

        adjmat = (adjmat < float(snakemake.wildcards["thresh"])) * 1
        # set the diagonal to 0
        np.fill_diagonal(adjmat, 0)
        
        adjmat.astype(int)
    else:
        raise ValueError("Invalid method: {}".format(snakemake.wildcards["method"]))
        

    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save adjmat
    adjmat_df = pd.DataFrame(adjmat)
    adjmat_df.columns = df.columns
    adjmat_df.to_csv(snakemake.output["adjmat"], index=False)

    # ntests is not applicable
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")


# Use timeout if not None
start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    wrapper()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  snakemake.output["adjmat"],
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        wrapper()

