rule gcastle_grandag:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_grandag"),
        time=alg_output_time_path("gcastle_grandag"),
        ntests=alg_output_ntests_path("gcastle_grandag"),
    params:
        alg="grandag",
    container:
        docker_image("gcastle")
    script:
        "../scripts/structure_learning_algorithms/gcastle.py"