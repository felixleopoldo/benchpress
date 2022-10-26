
if "rblip_asobs" in pattern_strings:

    rule blip:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("rblip_asobs"),
            time=alg_output_time_path("rblip_asobs"),
        shell:
            "/usr/bin/time -f \"%e\" -o {output.time} " \
            "Rscript workflow/scripts/structure_learning_algorithms/rblip_asobs.R " \
            "--filename_data {input.data} " \
            "--output_dir {wildcards.output_dir} " \
            "--time {wildcards.timeout} " \
            "--scorer.method {wildcards.scorermethod} " \
            "--solver.method {wildcards.solvermethod} " \
            "--indeg {wildcards.indeg} " \
            "--cores {wildcards.cores} " \
            "--allocated {wildcards.allocated} " \
            "--scorefunction {wildcards.scorefunction} " \
            "--alpha {wildcards.alpha} " \
            "--verbose {wildcards.verbose_level} " \
            "--filename {output.adjmat} "