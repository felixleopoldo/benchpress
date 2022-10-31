rule gcastle_golem:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_golem"),
        time=alg_output_time_path("gcastle_golem"),
        ntests=alg_output_ntests_path("gcastle_golem"),
    params:
        alg="golem",
    container:
        docker_image("gcastle")
    script:
        "../scripts/structure_learning_algorithms/gcastle.py"