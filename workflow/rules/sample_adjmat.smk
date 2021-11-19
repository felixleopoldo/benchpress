# Rules for sampling graphs (adjacancy matrices). 


rule sample_adjmat:
    input:
        "workflow/scripts/graph_sampling/sample_dags.R"
    output:        
        adjmat = "{output_dir}/adjmat/" + pattern_strings["pcalg_randdag"] + "/seed={replicate}.csv"
    singularity:
        docker_image("bidag")
    script:
        "../scripts/graph_sampling/sample_dags.R"

rule bdgraph_graphsim:
    input:
        "workflow/scripts/graph_sampling/bdgraph_graphsim.R"
    output:        
        adjmat = "{output_dir}/adjmat/" + pattern_strings["bdgraph_graphsim"] + "/seed={replicate}.csv"
    singularity:
        docker_image("bdgraph")
    script:
        "../scripts/graph_sampling/bdgraph_graphsim.R"

rule sample_adjmat_cta:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_cta"] + "/seed={replicate}.csv"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/graph_sampling/trilearn_sample_cta.py {output.adjmat} {wildcards.replicate} {wildcards.order} {wildcards.alpha} {wildcards.beta} "

rule gen_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["bandmat"] + "/seed={replicate}.csv"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/graph_sampling/trilearn_gen_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.bandwidth}"

rule rand_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["rand_bandmat"] + "/seed={replicate}.csv"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/graph_sampling/trilearn_rand_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.max_bandwidth}"

rule fixed_adjmat:
    input:
        "resources/adjmat/myadjmats/{adjmat}.csv"
    output:
        "{output_dir}/adjmat/myadjmats/{adjmat}.csv"        
    shell:       
        "cp {input} {output}"

rule bnlearn_adjmat:
    input:
        "{output_dir}/parameters/myparams/bn.fit_networks/{name}"
    output:
        "{output_dir}/adjmat/bn.fit_adjmats/{name}.csv"
    shell:
        "mkdir -p {wildcards.output_dir}" + "/adjmat/bn.fit_adjmats/ " \
        "&& Rscript workflow/scripts/utils/bnlearn_bn_to_adjmat.R " \
        "--filename_graph {output} " \
        "--filename_bn {input}"
