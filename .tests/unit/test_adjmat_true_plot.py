import os
import sys

import subprocess as sp
from tempfile import TemporaryDirectory
import shutil
from pathlib import Path, PurePosixPath

sys.path.insert(0, os.path.dirname(__file__))

import common


def test_adjmat_true_plot():

    with TemporaryDirectory() as tmpdir:
        workdir = Path(tmpdir) / "workdir"
        data_path = PurePosixPath(".tests/unit/adjmat_true_plot/data")
        expected_path = PurePosixPath(".tests/unit/adjmat_true_plot/expected")

        # Copy data to the temporary workdir.
        shutil.copytree(data_path, workdir)

        # dbg
        print("results/adjmat/pcalg_randdag/max_parents=5/n=20/d=4/par1=None/par2=None/method=er/DAG=True/seed=1.eps", file=sys.stderr)

        # Run the test job.
        sp.check_output([
            "python",
            "-m",
            "snakemake", 
            "results/adjmat/pcalg_randdag/max_parents=5/n=20/d=4/par1=None/par2=None/method=er/DAG=True/seed=1.eps",
            "-f", 
            "-j1",
            "--keep-target-files",
            "--configfile",
            /home/felix/git/benchpress/config/config.json
    
            "--use-singularity",
            "--directory",
            workdir,
        ])

        # Check the output byte by byte using cmp.
        # To modify this behavior, you can inherit from common.OutputChecker in here
        # and overwrite the method `compare_files(generated_file, expected_file), 
        # also see common.py.
        common.OutputChecker(data_path, expected_path, workdir).check()
