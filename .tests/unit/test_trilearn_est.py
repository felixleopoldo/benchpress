import os
import sys

import subprocess as sp
from tempfile import TemporaryDirectory
import shutil
from pathlib import Path, PurePosixPath

sys.path.insert(0, os.path.dirname(__file__))

import common


def test_trilearn_est():

    with TemporaryDirectory() as tmpdir:
        workdir = Path(tmpdir) / "workdir"
        data_path = PurePosixPath(".tests/unit/trilearn_est/data")
        expected_path = PurePosixPath(".tests/unit/trilearn_est/expected")

        # Copy data to the temporary workdir.
        shutil.copytree(data_path, workdir)

        # dbg
        print("results/adjmat_estimate/adjmat=/bdgraph_graphsim/p=50/graph=circle/class=None/size=None/prob=0.2/seed=1/parameters=/intra-class/rho=0.4/sigma2=1.0/seed=1/data=/iid/standardized=False/n=1000/algorithm=/trilearn/alg_params=/datatype=continuous/alpha=0.5/beta=0.5/radii=80/N=50/M=100/pseudo_obs=1/mcmc_seed=1/seed=1/adjmat.csv", file=sys.stderr)

        # Run the test job.
        sp.check_output([
            "python",
            "-m",
            "snakemake", 
            "results/adjmat_estimate/adjmat=/bdgraph_graphsim/p=50/graph=circle/class=None/size=None/prob=0.2/seed=1/parameters=/intra-class/rho=0.4/sigma2=1.0/seed=1/data=/iid/standardized=False/n=1000/algorithm=/trilearn/alg_params=/datatype=continuous/alpha=0.5/beta=0.5/radii=80/N=50/M=100/pseudo_obs=1/mcmc_seed=1/seed=1/adjmat.csv",
            "-F", 
            "-j1",
            "--keep-target-files",
    
            "--directory",
            workdir,
        ])

        # Check the output byte by byte using cmp.
        # To modify this behavior, you can inherit from common.OutputChecker in here
        # and overwrite the method `compare_files(generated_file, expected_file), 
        # also see common.py.
        common.OutputChecker(data_path, expected_path, workdir).check()
