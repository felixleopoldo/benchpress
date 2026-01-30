rule disc_bn:
    input:        
        "workflow/rules/parameters/disc_bn/script.R",
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn = "{output_dir}/parameters/" + \
            pattern_strings["disc_bn"] + "/" \
            "seed={seed}/adjmat=/{adjmat}.rds"
    params:
        collider_flag = lambda wildcards: "--collider_effect" if hasattr(wildcards, 'collider_effect') and wildcards.collider_effect == "True" else ""
    container:
        "docker://bpimages/benchpress:2.1.0"
    shell:
        "Rscript workflow/rules/parameters/disc_bn/script.R " \
        "--filename_dag {input.adjmat} " \
        "--filename {output} "  \
        "--min {wildcards.min} " \
        "--max {wildcards.max} " \
        "--nstates {wildcards.nstates} " \
        "--seed {wildcards.seed} " \
        "{params.collider_flag}"