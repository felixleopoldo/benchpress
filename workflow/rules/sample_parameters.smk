rule bnlearn_networks:
    output:
        "{output_dir}/bn/bn.fit_networks/{bn}"
    #shell:
    #    "mkdir -p {wildcards.output_dir}" + "/bn/bn.fit_networks/ " \
    #    "&& wget https://www.bnlearn.com/bnrepository/{wildcards.bn}/{wildcards.bn}.rds "
    #    "--output-document {output}"


# rule sample_linear_gaussian_parameters_notears:
#     input:
#         adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
#     output:        
#         bn = "{output_dir}/bn/" + pattern_strings["notears_parameters_sampling"] + "/" \
#             "seed={seed}/" \            
#             "adjmat=/{adjmat}.csv"

    singularity:
        docker_image("notears")
    shell:
        "python workflow/scripts/notears/generate_random_dag_parameters.py " \
        "--edge_coefficient_range_from {wildcards.edge_coefficient_range_from} " \
        "--edge_coefficient_range_to {wildcards.edge_coefficient_range_to} " \
        "--filename {output.bn} " \
        "--dag_filename {input.adjmat} " \
        "--seed {wildcards.seed}"

rule sample_binary_bn:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn = "{output_dir}/bn/" + \
            pattern_strings["generateBinaryBN"] + "/" \
            "seed={seed}/adjmat=/{adjmat}.rds"

    shell:
        "Rscript workflow/scripts/sample_bayesian_network_for_dag.R " \
        "--filename_dag {input.adjmat} " \
        "--filename {output} "  \
        "--min {wildcards.min} " \
        "--max {wildcards.max} " \
        "--seed {wildcards.seed} "

rule sample_pcalg_sem_params:
    input:
        adjmat = "{output_dir}/adjmat/"+pattern_strings["DAGavparents"]+"/seed={seed}.csv" 
    output:
        bn =    "{output_dir}/bn/" + \
                pattern_strings["pcalg_sem_params"] + "/" \
                "seed={seed}/"+\
                "adjmat=/"+pattern_strings["DAGavparents"]+"/seed={seed}.csv"
    script:
        "../scripts/sample_pcalg_semparams.R" 

rule hyper_dir:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}/seed={seed}.csv" 
    output:
        bn =    "{output_dir}/bn/" + \
                pattern_strings["hyper-dir"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}/seed={seed}.json"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/trilearn/sample_hyper-dir.py {output.bn} {wildcards.seed} {wildcards.n_levels} {wildcards.pseudo_obs} {input.adjmat}" 
#    script:
#        "../scripts/trilearn/sample_hyper-dir.py" 
