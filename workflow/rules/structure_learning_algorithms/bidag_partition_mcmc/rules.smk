rule bidag_partition_mcmc:
    input:
        data=alg_input_data(),
        startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
    output:  # data seems to be matched wrongly
        seqgraph=alg_output_seqgraph_path("bidag_partition_mcmc"),
        time=alg_output_time_path("bidag_partition_mcmc"),
    container:
        docker_image("bidag")
    script:
        "bidag_partition_mcmc.R"

rule bidag_partition_mcmc_est:
    input:
        traj=alg_output_seqgraph_path_nocomp("bidag_partition_mcmc"),
    output:
        adjmat=alg_output_adjmat_path("bidag_partition_mcmc"),  #here is the difference from order_mcmc. matching diffferently.
    params:
        graph_type="dag",
        estimator="threshold",
        threshold="{threshold}",
        burnin="{burnin}"
    container:
        docker_image("networkx")
    script:
        "../../../scripts/evaluation/graphtraj_est.py"