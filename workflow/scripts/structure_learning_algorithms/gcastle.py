from castle.algorithms import Notears
import pandas as pd
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

    if(snakemake.params["alg"] == "notears"):
        df = pd.read_csv(snakemake.input["data"])

        n = Notears(lambda1=float(snakemake.wildcards["lambda1"]),
                    loss_type=snakemake.wildcards["loss_type"],
                    max_iter=int(snakemake.wildcards["max_iter"]),
                    h_tol=float(snakemake.wildcards["h_tol"]),
                    rho_max=float(snakemake.wildcards["rho_max"]),
                    w_threshold=float(snakemake.wildcards["w_threshold"]))
        n.learn(df.values, colums=df.columns)
        tottime = time.perf_counter() - start

        # save time        
        with open(snakemake.output["time"], "w") as text_file:
            text_file.write(str(tottime))

        # save adjmat
        adjmat_df = pd.DataFrame(n.causal_matrix)
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
