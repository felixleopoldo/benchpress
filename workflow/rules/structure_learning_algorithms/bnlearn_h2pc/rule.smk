rule bnlearn_h2pc:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_h2pc"),
        time=alg_output_time_path("bnlearn_h2pc"),
        ntests=alg_output_ntests_path("bnlearn_h2pc"),
    container:
        docker_image("bnlearn")
    script:
        "bnlearn_h2pc.R"
