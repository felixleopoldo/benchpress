rule gcastle_gae:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_gae"),
        time=alg_output_time_path("gcastle_gae"),
        ntests=alg_output_ntests_path("gcastle_gae"),
    params:
        alg="gae",
    container:
        docker_image("gcastle")
    script:
        "../scripts/structure_learning_algorithms/gcastle.py"