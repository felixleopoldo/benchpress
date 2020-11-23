rule bnlearn_networks:
    output:
        "{output_dir}/bn/bn.fit_networks/{bn}"
    #shell:
    #    "mkdir -p {wildcards.output_dir}" + "/bn/bn.fit_networks/ " \
    #    "&& wget https://www.bnlearn.com/bnrepository/{wildcards.bn}/{wildcards.bn}.rds "
    #    "--output-document {output}"


rule sample_linear_gaussian_parameters_notears:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:        
        bn = "{output_dir}/bn/" \
            "notears/" \
            "edge_coefficient_range_from={edge_coefficient_range_from}/"\
            "edge_coefficient_range_to={edge_coefficient_range_to}/"\
            "mean={mean}/" \
            "variance={variance}/" \
            "seed={seed}/" \            
            "adjmat=/{adjmat}.csv"
    singularity:
        docker_image("notears")
    shell:
        "python scripts/notears/generate_random_dag_parameters.py " \
        "--edge_coefficient_range_from {wildcards.edge_coefficient_range_from} " \
        "--edge_coefficient_range_to {wildcards.edge_coefficient_range_to} " \
        "--filename {output.bn} " \
        "--dag_filename {input.adjmat} " \
        "--seed {wildcards.seed}"

rule sample_binary_bn:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn = "{output_dir}/bn/generateBinaryBN/min={min}/max={max}/seed={seed}/adjmat=/{adjmat}.rds"
    shell:
        "Rscript scripts/sample_bayesian_network_for_dag.R " \
        "--filename_dag {input.adjmat} " \
        "--filename {output} "  \
        "--min {wildcards.min} " \
        "--max {wildcards.max} " \
        "--seed {wildcards.seed} "
