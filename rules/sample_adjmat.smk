rule sample_adjmat:
    output:        
        adjmat = "{output_dir}/adjmat/generateDAGMaxParents/p={p}/avpar={avparents}/seed={replicate}.csv"
    shell:
        "Rscript scripts/sample_dags.R " \
        "--filename {output.adjmat} " \ 
        "--nodes {wildcards.p} " \
        "--parents {wildcards.avparents} " \
        "--seed {wildcards.replicate}"

rule sample_adjmat_notears:
    output:        
        adjmat = "{output_dir}/adjmat/" \
                "notears/" \
                "num_nodes={num_nodes}/" \
                "num_edges={num_edges}/"\
                "seed={seed}.csv"
    singularity:
        docker_image("notears")
    shell:
        "python scripts/notears/generate_random_dag.py " \
        "--num_nodes {wildcards.num_nodes} " \
        "--num_edges {wildcards.num_edges} " \
        "--filename {output.adjmat} " \
        "--seed {wildcards.seed}"

rule bnlearn_adjmat:
    input:
        "{output_dir}/bn/bn.fit_networks/{name}"
    output:
        "{output_dir}/adjmat/bn.fit_adjmats/{name}.csv"
    shell:
        "mkdir -p {wildcards.output_dir}" + "/adjmat/bn.fit_adjmats/ " \
        "&& Rscript scripts/bnlearn_bn_to_adjmat.R " 
        "--filename_graph {output} "
        "--filename_bn {input}"
