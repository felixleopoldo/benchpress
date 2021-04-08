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

start = time.clock()
cov = GraphicalLasso().fit(X)
adjmat = (np.around(np.abs(cov.precision_), decimals=3) > 0.01) * 1

tottime = time.clock() - start

time_filename = snakemake.output["time"]
np.savetxt(time_filename, [tottime])
pd.DataFrame(adjmat).to_csv(filename, index=False)
