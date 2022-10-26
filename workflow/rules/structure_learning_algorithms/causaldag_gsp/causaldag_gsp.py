from operator import invert
from causaldag import rand, partial_correlation_suffstat, partial_correlation_test, MemoizedCI_Tester, gsp
import numpy as np
from contextlib import contextmanager
import time
import signal
import pandas as pd


@contextmanager
def timeoutf(timelimit, filename, time_filename, ntests_filename, start_time):
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

        # ntests is not applicable
        with open(ntests_filename, "w") as text_file:
            text_file.write("None")

    finally:
        # Unregister the signal so it won't be triggered
        # if the timeout is not reached.
        signal.signal(signal.SIGALRM, signal.SIG_IGN)


def raise_timeout(signum, frame):
    raise TimeoutError


def wrapper():
    
    seed = int(snakemake.wildcards["replicate"])
    df = pd.read_csv(snakemake.input["data"])
    samples = df.values
  
    np.random.seed(seed)
    suffstat = partial_correlation_suffstat(
        samples, invert=eval(snakemake.wildcards["invert"]))

    ci_tester = MemoizedCI_Tester(
        partial_correlation_test, suffstat, alpha=float(snakemake.wildcards["alpha"]))
    est_dag = gsp(nodes=list(df.columns),
                  ci_tester=ci_tester,
                  depth=int(snakemake.wildcards["depth"]),
                  nruns=int(snakemake.wildcards["nruns"]),
                  verbose=eval(snakemake.wildcards["verbose"]),
                  initial_undirected=snakemake.wildcards["initial_undirected"],
                  initial_permutations=None,
                  fixed_orders=set(),
                  fixed_adjacencies=set(),
                  fixed_gaps=set(),
                  use_lowest=eval(snakemake.wildcards["use_lowest"]),
                  max_iters = float(snakemake.wildcards["max_iters"]),
                  factor=int(snakemake.wildcards["factor"]),
                  progress_bar=eval(snakemake.wildcards["progress_bar"]),
                  summarize=eval(snakemake.wildcards["summarize"]))
    
    adjmat = est_dag.to_amat()[0]
    
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


start = time.perf_counter()
filename = snakemake.output["adjmat"]

if snakemake.wildcards["timeout"] == "None":
    wrapper()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  filename,
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        wrapper()
