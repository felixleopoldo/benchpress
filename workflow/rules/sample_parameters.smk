# Rules for sampling parameters gicen a graph.
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


if "sem_params" in pattern_strings:
    rule sample_sem_params:
        input:
            "workflow/scripts/parameters_sampling/sample_semparams.R", 
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            bn =    "{output_dir}/parameters/" + \
                    pattern_strings["sem_params"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("bidag")
        script:
            "../scripts/parameters_sampling/sample_semparams.R" 

if "trilearn_hyper-dir" in pattern_strings:
    rule hyper_dir:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            bn =    "{output_dir}/parameters/" + \
                    pattern_strings["trilearn_hyper-dir"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.json"
        container:
            docker_image("trilearn")
        shell:
            "python workflow/scripts/parameters_sampling/trilearn_sample_hyper-dir.py {output.bn} {wildcards.seed} {wildcards.n_levels} {wildcards.pseudo_obs} {input.adjmat}" 

if "trilearn_intra-class" in pattern_strings:
    rule intra_class_cov:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            params = "{output_dir}/parameters/" + \
                    pattern_strings["trilearn_intra-class"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("trilearn")
        shell:
            "python2 workflow/scripts/parameters_sampling/trilearn_g_intra_class_cov.py {input.adjmat} {output.params} {wildcards.rho} {wildcards.sigma2}"

if "trilearn_g_inv_wishart" in pattern_strings:
    rule trilearn_g_inv_wishart:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            params = "{output_dir}/parameters/" + \
                    pattern_strings["trilearn_g_inv_wishart"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("trilearn")
        shell:
            "python workflow/scripts/parameters_sampling/trilearn_g_inv_wishart_cov.py {input.adjmat} {output.params} {wildcards.dof} {wildcards.seed}"

if "bdgraph_rgwish" in pattern_strings:
    rule bdgraph_rgwish:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            params = "{output_dir}/parameters/" + \
                    pattern_strings["bdgraph_rgwish"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("bdgraph")
        script:
            "../scripts/parameters_sampling/bdgraph_rgwish.R"

rule copy_bnfit:
    input:
        "resources/parameters/myparams/bn.fit_networks/{filename}.rds"
    output:
        "{output_dir}/parameters/myparams/bn.fit_networks/{filename}.rds"
    shell:       
        "cp {input} {output}"