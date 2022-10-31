rule dualpc:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("dualpc"),
        time=alg_output_time_path("dualpc"),
    container:
        docker_image("dualpc")
    script:
        "dualpc.R"