rule gcastle_mcsl:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_mcsl"),
        time=alg_output_time_path("gcastle_mcsl"),
        ntests=alg_output_ntests_path("gcastle_mcsl"),
    params:
        alg="mcsl",
    container:
        docker_image("gcastle")
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"