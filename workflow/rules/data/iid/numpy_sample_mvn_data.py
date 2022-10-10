# Samples from the multivariate normal distribution with 0 mean and given covariance matrix.
import sys
import numpy as np
import pandas as pd

cov_filename = sys.argv[1]
filename = sys.argv[2]
n = int(sys.argv[3])
seed = int(sys.argv[4])

df = pd.read_csv(cov_filename)

sigma = df.values
p = sigma.shape[1]

np.random.seed(seed)
X = np.matrix(np.random.multivariate_normal(np.zeros(p), sigma, n))

pd.DataFrame(X, columns=df.columns).to_csv(filename, index=False)
