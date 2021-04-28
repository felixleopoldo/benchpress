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
cov = GraphicalLasso().fit(X)
adjmat = (np.around(np.abs(cov.precision_), decimals=3) > 0.01 ) * 1 - np.identity(X.shape[1])

tottime = time.perf_counter() - start

time_filename = snakemake.output["time"]
np.savetxt(time_filename, [tottime])
dfadj = pd.DataFrame(adjmat)
dfadj.columns = df.columns

dfadj.to_csv(filename, index=False)
