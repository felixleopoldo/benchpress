import os
import sys

import subprocess as sp
from tempfile import TemporaryDirectory
import shutil
from pathlib import Path, PurePosixPath

sys.path.insert(0, os.path.dirname(__file__))

import common


def test_mcmc_heatmap_plot():

    with TemporaryDirectory() as tmpdir:
        workdir = Path(tmpdir) / "workdir"
        data_path = PurePosixPath(".tests/unit/mcmc_heatmap_plot/data")
        expected_path = PurePosixPath(".tests/unit/mcmc_heatmap_plot/expected")

        # Copy data to the temporary workdir.
        shutil.copytree(data_path, workdir)

        # dbg
        print("results/evaluation=/mcmc_heatmaps/burn_in=200000/adjmat=/bdgraph_graphsim/p=50/graph=circle/class=None/size=None/prob=0.2/seed=1/parameters=/intra-class/rho=0.4/sigma2=1.0/seed=1/data=/iid/standardized=False/n=1000/algorithm=/gt13_multipair/alg_params=/n_samples=1000000/datatype=continuous/randomits=1000/prior=bc/ascore=0.1/bscore=0.001/clq=None/sep=None/penalty=None/mcmc_seed=1/seed=1/heatmap_plot.eps", file=sys.stderr)

        # Run the test job.
        sp.check_output([
            "python",
            "-m",
            "snakemake", 
            "results/evaluation=/mcmc_heatmaps/burn_in=200000/adjmat=/bdgraph_graphsim/p=50/graph=circle/class=None/size=None/prob=0.2/seed=1/parameters=/intra-class/rho=0.4/sigma2=1.0/seed=1/data=/iid/standardized=False/n=1000/algorithm=/gt13_multipair/alg_params=/n_samples=1000000/datatype=continuous/randomits=1000/prior=bc/ascore=0.1/bscore=0.001/clq=None/sep=None/penalty=None/mcmc_seed=1/seed=1/heatmap_plot.eps",
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
