import os
from cProfile import label
from itertools import groupby
from tkinter.ttk import Style
from turtle import color
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt
import matplotlib.cm as cm
import matplotlib.colors as colors
import numpy as np
import matplotlib
sns.set_style("whitegrid")

sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})
sns.set_context('notebook')
matplotlib.use('Agg')

df = pd.read_csv(snakemake.input["trajs"], index_col=None)

algs = df["alg"].unique()
params = df["parameters"].unique()
adjmats = df["adjmat"].unique()
datas = df["data"].unique()
seeds = df["seed"].unique()
mcmc_seeds = df["mcmc_seed"].unique()
algparams = df["param"].unique()
algparam_vals = df["param_val"].unique()
functionals = df["functional"].unique()

cnt1 = 1
cnt2 = 1


for adjmat in adjmats:
    for param in params:
        for data in datas:
            for seed in seeds:
                for alg in algs:
                    for functional in functionals:
                        tmp = df.loc[(df["adjmat"] == adjmat) &
                                    (df["parameters"] == param) &
                                    (df["data"] == data) & 
                                    (df["seed"] == seed) & 
                                    (df["alg"] == alg)]

                        if len(tmp) == 0:
                            continue
                        
                        # Remove unnecessary legends
                        tmp['param_val'] = tmp.param_val.astype('category')                      
                        # Plot trajectories for all parameter settings
                        with sns.axes_style("whitegrid"):
                            sns.lineplot(data=tmp, x="sample", y=functional,
                                        hue="param_val", style="param", 
                                        units="mcmc_seed",
                                        estimator=None, lw=0.7, alpha=1.0)

                        plt.title("Alg: " + alg + "\nGraph: "+adjmat +
                                "\nParams: " + param + "\nData: " + data, 
                                fontsize=8)
                        if not os.path.isdir(snakemake.output["multi"]):
                                    os.makedirs(snakemake.output["multi"])
                        
                        plt.savefig(snakemake.output["multi"] +"/"+ str(cnt1) + ".png")
                        plt.clf()
                        cnt1 += 1
                        
                        # Plot trajectories in different colors for fixed alg settings 
                        for algparam in algparams:
                            for algparam_val in algparam_vals:
                                tmp = df.loc[(df["adjmat"] == adjmat) &
                                    (df["parameters"] == param) &
                                    (df["data"] == data) & 
                                    (df["seed"] == seed) & 
                                    (df["alg"] == alg) &
                                    (df["param"] == algparam) & 
                                    (df["param_val"] == algparam_val)]
                                
                                if len(tmp) == 0:
                                    continue
                                tmp['mcmc_seed'] = tmp.mcmc_seed.astype('category')  
                                with sns.axes_style("whitegrid"):
                                    sns.lineplot(data=tmp, x="sample", y=functional,
                                        hue="mcmc_seed", legend=False,                                                                   
                                        estimator=None, lw=0.7, alpha=1.0)

                                plt.title("Graph: "+adjmat +
                                        "\nParams: " + param + "\nData: " + data, 
                                        fontsize=8)
                                alg_string = tmp['alg_string'].unique()[0] # since there are different mcmc_seeds                         
                                plt.ylabel("Algorithm:\n\n"+alg_string.replace("/", "\n"),rotation="horizontal", fontsize=6, ha="right", va="center" )#+ "\n\nburn_in=" +
                                #             snakemake.wildcards["burn_in"], 
                                plt.tight_layout()
                                if not os.path.isdir(snakemake.output["single"]):
                                    os.makedirs(snakemake.output["single"])
                                plt.savefig(snakemake.output["single"]  +"/"+ str(cnt2) + ".png")
                                
                                cnt2 += 1
                                plt.clf()
