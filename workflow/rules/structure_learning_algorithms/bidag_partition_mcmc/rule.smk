rule bidag_partition_mcmc:
    input:
        data=alg_input_data(),
        startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
    output:
        seqgraph=alg_output_seqgraph_path("bidag_partition_mcmc"),
        time=alg_output_time_path("bidag_partition_mcmc"),
        ntests=touch(alg_output_ntests_path("bidag_partition_mcmc"))
    container:
        "docker://bpimages/bidag:2.1.4-arm64"
    script:
        "bidag_partition_mcmc.R"
