import os
import sys

import subprocess as sp
from tempfile import TemporaryDirectory
import shutil
from pathlib import Path, PurePosixPath

sys.path.insert(0, os.path.dirname(__file__))

import common


def test_bnlearn_graphvizcompare():

    with TemporaryDirectory() as tmpdir:
        workdir = Path(tmpdir) / "workdir"
        data_path = PurePosixPath(".tests/unit/bnlearn_graphvizcompare/data")
        expected_path = PurePosixPath(".tests/unit/bnlearn_graphvizcompare/expected")

        # Copy data to the temporary workdir.
        shutil.copytree(data_path, workdir)

        # dbg
        print("results/evaluation=/graphvizcompare/layout=True/adjmat=/pcalg_randdag/max_parents=5/n=20/d=4/par1=None/par2=None/method=er/DAG=True/seed=1/parameters=/sem_params/min=0.25/max=1/seed=1/data=/iid/standardized=True/n=300/algorithm=/tetrad_fges/alg_params=/faithfulnessAssumed=True/score=sem-bic/datatype=continuous/samplePrior=1/structurePrior=1/penaltyDiscount=0.75/timeout=None/seed=1/graphvizcompare.pdf", file=sys.stderr)

        # Run the test job.
        sp.check_output([
            "python",
            "-m",
            "snakemake", 
            "results/evaluation=/graphvizcompare/layout=True/adjmat=/pcalg_randdag/max_parents=5/n=20/d=4/par1=None/par2=None/method=er/DAG=True/seed=1/parameters=/sem_params/min=0.25/max=1/seed=1/data=/iid/standardized=True/n=300/algorithm=/tetrad_fges/alg_params=/faithfulnessAssumed=True/score=sem-bic/datatype=continuous/samplePrior=1/structurePrior=1/penaltyDiscount=0.75/timeout=None/seed=1/graphvizcompare.pdf",
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
