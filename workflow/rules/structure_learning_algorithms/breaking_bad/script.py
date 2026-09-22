sys.path.append("workflow/scripts/utils")

import subprocess
import tempfile
import time
from pathlib import Path

import numpy as np
import pandas as pd
from add_timeout import *

# Absolute path to the Search binary built inside the breaking-bad image by
# RESTORE_GUIDE.md Section 4.5 (see rule.smk).
SEARCH_BIN = "/repo/breaking-bad/build/src/Search"


def read_stat(stats_path, key):
    stats = pd.read_csv(stats_path, header=None, index_col=0).squeeze("columns")
    return stats.get(key)


def myalg():
    df = pd.read_csv(snakemake.input["data"])
    p = df.shape[1]

    baseline = snakemake.wildcards["baseline"]
    variant = int(snakemake.wildcards["variant"])
    alpha = float(snakemake.wildcards["alpha"])
    delete_op = int(snakemake.wildcards["delete_op"])

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Search requires a 2-D, float64, C-contiguous .npy input file.
        data_npy = tmpdir / "data.npy"
        np.save(data_npy, np.ascontiguousarray(df.values, dtype=np.float64))

        result_csv = tmpdir / "result.csv"
        stats_csv = tmpdir / "stats.csv"

        subprocess.run(
            [
                SEARCH_BIN,
                "--input", str(data_npy),
                "-a", str(alpha),
                "--output", str(result_csv),
                "--stats", str(stats_csv),
                "-v", "0",
                "--baseline", baseline,
                "--variant", str(variant),
                "--delete_op", str(delete_op),
            ],
            check=True,
        )

        # Search writes its own square adjacency matrix (adjmat[i, j] == 1
        # for a directed edge i -> j; both adjmat[i, j] and adjmat[j, i] set
        # for an undirected edge), with a header row of bare node indices.
        # Relabel to the input's actual variable names, per the Benchpress
        # adjmat.csv convention.
        adjmat = pd.read_csv(result_csv, header=0)
        adjmat.columns = df.columns
        adjmat.to_csv(snakemake.output["adjmat"], index=False)

        tottime = read_stat(stats_csv, "time")
        with open(snakemake.output["time"], "w") as f:
            f.write(str(tottime) if tottime is not None else str(time.perf_counter() - start))

        # local_score-#calls-total is the closest analogue to "ntests" for a
        # score-based search: the number of BIC score evaluations performed.
        ntests = read_stat(stats_csv, "local_score-#calls-total")
        with open(snakemake.output["ntests"], "w") as f:
            f.write(str(ntests) if ntests is not None else "None")


# This part starts the timer
start = time.perf_counter()

if snakemake.wildcards["timeout"] == "None":
    myalg()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  snakemake.output["adjmat"],
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        myalg()
