rule bin_bn:
    input:        
        "workflow/rules/parameters/bin_bn/sample_bayesian_network_for_dag.R",
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn = "{output_dir}/parameters/" + \
            pattern_strings["bin_bn"] + "/" \
            "seed={seed}/adjmat=/{adjmat}.rds"
    params:
        collider_flag = lambda wildcards: "--collider_effect" if hasattr(wildcards, 'collider_effect') and wildcards.collider_effect == "True" else "",
        strong_flag = lambda wildcards: "--strong_effects" if hasattr(wildcards, 'strong_effects') and wildcards.strong_effects == "True" else ""
    container:
        "docker://bpimages/benchpress:2.1.0"
    shell:
        "Rscript workflow/rules/parameters/bin_bn/sample_bayesian_network_for_dag.R " \
        "--filename_dag {input.adjmat} " \
        "--filename {output} "  \
        "--min {wildcards.min} " \
        "--max {wildcards.max} " \
        "--seed {wildcards.seed} " \
        "{params.collider_flag} " \
        "{params.strong_flag}"