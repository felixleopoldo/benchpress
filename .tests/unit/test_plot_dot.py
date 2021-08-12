import os
import sys

import subprocess as sp
from tempfile import TemporaryDirectory
import shutil
from pathlib import Path, PurePosixPath

sys.path.insert(0, os.path.dirname(__file__))

import common


def test_plot_dot():

    with TemporaryDirectory() as tmpdir:
        workdir = Path(tmpdir) / "workdir"
        data_path = PurePosixPath(".tests/unit/plot_dot/data")
        expected_path = PurePosixPath(".tests/unit/plot_dot/expected")

        # Copy data to the temporary workdir.
        shutil.copytree(data_path, workdir)

        # dbg
        print("results/adjmat_estimate/adjmat=/bdgraph_graphsim/p=50/graph=circle/class=None/size=None/prob=0.2/seed=1/parameters=/intra-class/rho=0.4/sigma2=1.0/seed=1/data=/iid/standardized=False/n=1000/algorithm=/order_mcmc/alg_params=/startspace_algorithm=itsearch/alg_params=/estimate=endspace/MAP=False/plus1it=6/posterior=0.5/scoretype=bge/chi=None/edgepf=None/am=0.1/aw=None/softlimit=9/hardlimit=14/alpha=0.01/gamma=1/cpdag=False/mergetype=skeleton/plus1=True/scoretype=bge/chi=None/edgepf=None/aw=None/am=0.1/alpha=0.05/gamma=1/stepsave=None/iterations=None/MAP=False/cpdag=False/mcmc_seed=1/estimation_method/threshold=0.5/burnin=0/seed=1/adjmat.ps", file=sys.stderr)

        # Run the test job.
        sp.check_output([
            "python",
            "-m",
            "snakemake", 
            "results/adjmat_estimate/adjmat=/bdgraph_graphsim/p=50/graph=circle/class=None/size=None/prob=0.2/seed=1/parameters=/intra-class/rho=0.4/sigma2=1.0/seed=1/data=/iid/standardized=False/n=1000/algorithm=/order_mcmc/alg_params=/startspace_algorithm=itsearch/alg_params=/estimate=endspace/MAP=False/plus1it=6/posterior=0.5/scoretype=bge/chi=None/edgepf=None/am=0.1/aw=None/softlimit=9/hardlimit=14/alpha=0.01/gamma=1/cpdag=False/mergetype=skeleton/plus1=True/scoretype=bge/chi=None/edgepf=None/aw=None/am=0.1/alpha=0.05/gamma=1/stepsave=None/iterations=None/MAP=False/cpdag=False/mcmc_seed=1/estimation_method/threshold=0.5/burnin=0/seed=1/adjmat.ps",
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
