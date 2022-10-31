rule bidag_order_mcmc:
    input:
        data=alg_input_data(),
        startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
    output:  
        seqgraph=alg_output_seqgraph_path("bidag_order_mcmc"),
        time=alg_output_time_path("bidag_order_mcmc"),
    container:
        docker_image("bidag")
    script:
        "bidag_order_mcmc.R"

rule bidag_order_mcmc_est:
    input:
        traj=alg_output_seqgraph_path_fine_match("bidag_order_mcmc"),
    output:
        adjmat=adjmat_estimate_path_mcmc("bidag_order_mcmc"),
    params:
        graph_type="dag",
        estimator="threshold",
        threshold="{threshold}",
        burnin="{burnin}"
    container:
        docker_image("networkx")
    script:
        "../../../scripts/evaluation/graphtraj_est.py"