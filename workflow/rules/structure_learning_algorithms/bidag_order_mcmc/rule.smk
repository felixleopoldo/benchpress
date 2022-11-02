rule bidag_order_mcmc:
    input:
        data=alg_input_data(),
        startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
    output:  
        seqgraph=alg_output_seqgraph_path("bidag_order_mcmc"),
        time=alg_output_time_path("bidag_order_mcmc"),
        ntests=touch(alg_output_ntests_path("bidag_order_mcmc"))
    container:
        docker_image("bidag")
    script:
        "bidag_order_mcmc.R"
