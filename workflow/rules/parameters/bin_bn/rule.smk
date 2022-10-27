if "bin_bn" in pattern_strings:
    rule sample_binary_bn:
        input:
            "workflow/scripts/parameters_sampling/sample_bayesian_network_for_dag.R",
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            bn = "{output_dir}/parameters/" + \
                pattern_strings["bin_bn"] + "/" \
                "seed={seed}/adjmat=/{adjmat}.rds"
        shell:
            "Rscript workflow/scripts/parameters_sampling/sample_bayesian_network_for_dag.R " \
            "--filename_dag {input.adjmat} " \
            "--filename {output} "  \
            "--min {wildcards.min} " \
            "--max {wildcards.max} " \
            "--seed {wildcards.seed} "