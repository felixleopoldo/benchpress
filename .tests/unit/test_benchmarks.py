import os
import sys

import subprocess as sp
from tempfile import TemporaryDirectory
import shutil
from pathlib import Path, PurePosixPath

sys.path.insert(0, os.path.dirname(__file__))

import common


def test_benchmarks():

    with TemporaryDirectory() as tmpdir:
        workdir = Path(tmpdir) / "workdir"
        data_path = PurePosixPath(".tests/unit/benchmarks/data")
        expected_path = PurePosixPath(".tests/unit/benchmarks/expected")

        # Copy data to the temporary workdir.
        shutil.copytree(data_path, workdir)

        # dbg
        print("results/output/benchmarks/benchmarks.done results/output/benchmarks/example/FPR_TPR_pattern.png results/output/benchmarks/example/FPRp_FNR_skel.png results/output/benchmarks/example/FNR_FPR_skel.png results/output/benchmarks/example/FPR_TPR_skel.png results/output/benchmarks/example/elapsed_time_joint.png results/output/benchmarks/example/graph_type.png results/output/benchmarks/example/SHD_cpdag_joint.png results/output/benchmarks/example/f1_skel_joint.png results/output/benchmarks/example/ntests_joint.png", file=sys.stderr)

        # Run the test job.
        sp.check_output([
            "python",
            "-m",
            "snakemake", 
            "results/output/benchmarks/benchmarks.done results/output/benchmarks/example/FPR_TPR_pattern.png results/output/benchmarks/example/FPRp_FNR_skel.png results/output/benchmarks/example/FNR_FPR_skel.png results/output/benchmarks/example/FPR_TPR_skel.png results/output/benchmarks/example/elapsed_time_joint.png results/output/benchmarks/example/graph_type.png results/output/benchmarks/example/SHD_cpdag_joint.png results/output/benchmarks/example/f1_skel_joint.png results/output/benchmarks/example/ntests_joint.png",
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
