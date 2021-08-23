import numpy as np
from sklearn.covariance import GraphicalLasso
import pandas as pd
import time

seed = int(snakemake.wildcards["replicate"])
np.random.seed(seed)
data = snakemake.input["data"]
filename = snakemake.output["adjmat"]
df = pd.read_csv(data)

X = df.values

start = time.perf_counter()
cov = GraphicalLasso(alpha=float(snakemake.wildcards["alpha"]), 
                    mode=snakemake.wildcards["mode"], 
                    tol=float(snakemake.wildcards["tol"]), 
                    enet_tol=float(snakemake.wildcards["enet_tol"]), 
                    max_iter=int(snakemake.wildcards["max_iter"]), 
                    verbose=bool(snakemake.wildcards["verbose"]), 
                    assume_centered=bool(snakemake.wildcards["assume_centered"])).fit(X)

#adjmat = np.around(np.abs(cov.precision_), decimals=3) 
adjmat = ((np.around(np.abs(cov.precision_), decimals=3) > float(snakemake.wildcards["precmat_threshold"])) * 1 - np.identity(X.shape[1])).astype(int)


tottime = time.perf_counter() - start

time_filename = snakemake.output["time"]
np.savetxt(time_filename, [tottime])
dfadj = pd.DataFrame(adjmat)
dfadj.columns = df.columns

dfadj.to_csv(filename, index=False)
