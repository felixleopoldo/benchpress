rule mixed_bn:
    input:        
        "workflow/rules/parameters/mixed_bn/script.R",
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn = "{output_dir}/parameters/" + \
            pattern_strings["mixed_bn"] + "/" \
            "seed={seed}/adjmat=/{adjmat}.rds"
    shell:
        "Rscript workflow/rules/parameters/mixed_bn/script.R " \
        "--filename_dag {input.adjmat} " \
        "--filename {output} " \
        "--seed {wildcards.seed} " \
        "--prob_discrete {wildcards.prob_discrete} " \
        "--min_levels {wildcards.min_levels} " \
        "--max_levels {wildcards.max_levels} " \
        "--min_bins {wildcards.min_bins} " \
        "--max_bins {wildcards.max_bins} " \
        "--coef_min {wildcards.coef_min} " \
        "--coef_max {wildcards.coef_max} " \
        "--noise_sd_min {wildcards.noise_sd_min} " \
        "--noise_sd_max {wildcards.noise_sd_max} " \
        "--dirichlet_alpha {wildcards.dirichlet_alpha}"
