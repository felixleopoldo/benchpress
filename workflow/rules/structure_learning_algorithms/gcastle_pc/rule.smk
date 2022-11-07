rule gcastle_pc:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_pc"),
        time=alg_output_time_path("gcastle_pc"),
        ntests=alg_output_ntests_path("gcastle_pc"),
    params:
        alg="pc",
    container:
        docker_image("gcastle")
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"