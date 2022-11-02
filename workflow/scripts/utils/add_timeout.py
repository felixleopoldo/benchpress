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
        print("Timeout")
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




def add_timeout(algorithm):
    """Use this as a decorator for you algorithm
 

    Examples:
    >>> @mydecorator
        def myalg():
            pass

    Args:
        algrithm (function): A fucntion containing you algorithm.
    """
    def wrapper(*args, **kwargs): 
        print("hey")
     
        print(kwargs["timelimit"])
        if kwargs["timelimit"] == "None":
            algorithm(*args, **kwargs) # this it test function
        else:
            start = time.perf_counter()
            # with timeoutf(int(snakemake.wildcards["timeout"]),
            #             snakemake.output["adjmat"],
            #             snakemake.output["time"],
            #             snakemake.output["ntests"],
            #             start):
            with timeoutf(*args, **kwargs):
                algorithm(*args, **kwargs)
    return wrapper

