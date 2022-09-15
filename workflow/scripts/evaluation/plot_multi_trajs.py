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
import re
sns.set_style("whitegrid")
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})
sns.set_context('notebook')
matplotlib.use('Agg')

df = pd.read_csv(snakemake.input["trajs"], index_col=None)

# Since the values might be  mix of nunbers and strings
df["param_val"] = df.param_val.astype(str)

algs = df["alg"].unique()
params = df["parameters"].unique()
adjmats = df["adjmat"].unique()
datas = df["data"].unique()
seeds = df["seed"].unique()
#mcmc_seeds = df["mcmc_seed"].unique() 

#algparam_vals = [str(v) for v in algparam_vals]

functionals = df["functional"].unique()

cnt1 = 1  # Filename counters
cnt2 = 1

for adjmat in adjmats:
    for param in params:
        for data in datas:
            for seed in seeds:
                for alg in algs:
                    # TODO/BUG: Should be separated by ID as well
                    algparams = df.loc[df["alg"]==alg]["param"].unique()
                    algparam_vals = df.loc[df["alg"]==alg]["param_val"].unique()

                    for functional in functionals:
                        tmp = df.loc[(df["adjmat"] == adjmat) &
                                     (df["parameters"] == param) &
                                     (df["data"] == data) &
                                     (df["seed"] == seed) &
                                     (df["functional"] == functional) &
                                     (df["alg"] == alg)]

                        if len(tmp) == 0:
                            continue

                        # Remove unnecessary legends
                        tmp['param_val'] = tmp.param_val.astype('category')
                        # Plot trajectories for all parameter settings
                        with sns.axes_style("whitegrid"):
                            sns.lineplot(data=tmp, x="sample", y="plotvalue",
                                         hue="param_val", style="param",
                                         units="mcmc_seed",
                                         estimator=None, lw=0.7, alpha=1.0)

                        plt.title("Graph: "+adjmat +
                                  "\nParams: " + param + "\nData: " + data,
                                  fontsize=6, ha="center")
                        # since there are different mcmc_seeds
                        alg_string = tmp['alg_string'].unique()[0]
                        eval_string = tmp['eval_string'].unique()[0]

                        ylab = "Algorithm:\n\n"+alg_string.replace("/", "\n") + \
                            "\n\nPlot params:\n\n" + \
                            eval_string.replace("/", "\n")
                        ylab = re.sub(r"mcmc_seed=\d+", "", ylab)

                        #for ap in algparams:
                        #   ylab = re.sub(r""+ap+"*?", "", ylab)
                        
                        plt.ylabel(ylab,
                                   rotation="horizontal", fontsize=6, ha="right", va="center")

                        if not os.path.isdir(snakemake.output["multi"]):
                            os.makedirs(snakemake.output["multi"])
                        cax = plt.gcf().axes[-1]
                        cax.tick_params(labelsize=6)
                        plt.legend(fontsize=6, title_fontsize=8)
                        plt.xlabel(snakemake.params["xlab"], fontsize=6)
                        plt.tight_layout()
                        plt.savefig(
                            snakemake.output["multi"] + "/" + str(cnt1) + ".png")
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
                                             (df["functional"] == functional) &
                                             (df["param"] == algparam) &
                                             (df["param_val"] == algparam_val)]

                                if len(tmp) == 0:
                                    continue
                                tmp['mcmc_seed'] = tmp.mcmc_seed.astype(
                                    'category')
                                with sns.axes_style("whitegrid"):
                                    sns.lineplot(data=tmp, x="sample", y="plotvalue",
                                                 hue="mcmc_seed", #legend=True,
                                                 estimator=None, lw=0.7, alpha=1.0)
                                plt.legend(fontsize=5, title_fontsize=8)
                                plt.title("Graph: "+adjmat +
                                          "\nParams: " + param + "\nData: " + data,
                                          fontsize=6, ha="center")
                                # since there are different mcmc_seeds
                                alg_string = tmp['alg_string'].unique()[0]

                                eval_string = tmp['eval_string'].unique()[
                                    0]
                                ylab = "Algorithm:\n\n"+alg_string.replace("/", "\n") + \
                                    "\n\nPlot params:\n\n" + \
                                    eval_string.replace("/", "\n")
                                ylab = re.sub(r"mcmc_seed=\d+", "", ylab)
                                plt.ylabel(ylab,
                                           rotation="horizontal", fontsize=6, ha="right", va="center")

                                plt.xlabel(snakemake.params["xlab"], fontsize=6)
                                cax = plt.gcf().axes[-1]
                                cax.tick_params(labelsize=6)
                                plt.tight_layout()
                                if not os.path.isdir(snakemake.output["single"]):
                                    os.makedirs(snakemake.output["single"])
                                plt.savefig(
                                    snakemake.output["single"] + "/" + str(cnt2) + ".png")

                                cnt2 += 1
                                plt.clf()
