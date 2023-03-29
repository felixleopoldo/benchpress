rule rblip_asobs:
    input:
        "workflow/rules/structure_learning_algorithms/rblip_asobs/rblip_asobs.R",
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("rblip_asobs"),
        time=alg_output_time_path("rblip_asobs"),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/benchpress:1.2.0"
    shell:
        "/usr/bin/time -f \"%e\" -o {output.time} " \
        "Rscript workflow/rules/structure_learning_algorithms/rblip_asobs/rblip_asobs.R " \
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