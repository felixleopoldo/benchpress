from contextlib import contextmanager
import numpy as np
from sklearn.covariance import GraphicalLasso
import pandas as pd
import time 
import signal

@contextmanager
def timeoutf(timelimit, filename, time_filename, start_time):
    # Register a function to raise a TimeoutError on the signal.
    signal.signal(signal.SIGALRM, raise_timeout)
    # Schedule the signal to be sent after ``time``.
    signal.alarm(timelimit)

    try:
        yield
    except TimeoutError:
        with open(filename, "w") as text_file:
            text_file.write("")

        tottime = time.perf_counter() - start_time
        with open(time_filename, "w") as text_file:
            text_file.write(str(tottime))
    finally:
        # Unregister the signal so it won't be triggered
        # if the timeout is not reached.
        signal.signal(signal.SIGALRM, signal.SIG_IGN)

def raise_timeout(signum, frame):
    raise TimeoutError

def wrapper():
    seed = int(snakemake.wildcards["seed"])
    np.random.seed(seed)
    data = snakemake.input["data"]
    df = pd.read_csv(data)
    X = df.values

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


start = time.perf_counter()
filename = snakemake.output["adjmat"]

if snakemake.wildcards["timeout"] == "None":
    wrapper()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]), filename, snakemake.output["time"], start):
        wrapper()

