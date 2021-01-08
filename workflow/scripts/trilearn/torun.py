#import trilearn.pgibbs as pg
#import pandas as pd
#import time

#print(snakemake.input["data"])

#df = pd.read_csv(snakemake.input[0], sep=' ', header=[0, 1])
#N = wildcards.N
#M = wildcards.M
#pseudo_obs = wildcards.pseudo_obs
#alpha = wildcards.alpha
#beta = wildcards.beta
#radii = wildcards.radii

#tic = time.perf_counter()
#traj = pg.sample_trajectory_loglin(df, N, M , pseudo_obs=pseudo_obs, alpha=alpha, beta=beta, radius=radii)
#toc = time.perf_counter()
#file1 = open(output.time, "w")
#file1.write(toc-tic) 
#file1.close()         

#traj.write_adjvec_trajectory(output.adjvecs)

