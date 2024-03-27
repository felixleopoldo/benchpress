import numpy as np
import pandas as pd
import networkx as nx
from contextlib import contextmanager
import time
import signal

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
    # np.random.seed(seed)
    df = pd.read_csv(snakemake.input["data"])
    
    if(snakemake.params["alg"] == "cam"):
        from cdt.causality.graph import CAM
        cam = CAM(score=snakemake.wildcards["score"],
                  cutoff=float(snakemake.wildcards["cutoff"]),
                  variablesel=eval(snakemake.wildcards["variablesel"]),
                  selmethod=snakemake.wildcards["selmethod"],
                  pruning=eval(snakemake.wildcards["pruning"]),
                  prunmethod=snakemake.wildcards["prunmethod"])
        nx_g = cam.create_graph_from_data(df)

    else:
        raise ValueError("Unrecognised CDT algorithm!")
    
    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save adjmat
    adjmat_df = pd.DataFrame(np.array(nx.adjacency_matrix(nx_g, df.columns).todense()))
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
