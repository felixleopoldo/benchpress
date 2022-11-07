rule bnlearn_tabu:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_tabu"),
        time=alg_output_time_path("bnlearn_tabu"),
        ntests=alg_output_ntests_path("bnlearn_tabu"),
    container:
        docker_image("bnlearn")
    script:
        "bnlearn_tabu.R"