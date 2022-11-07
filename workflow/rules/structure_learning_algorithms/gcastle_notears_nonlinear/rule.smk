rule gcastle_notears_nonlinear:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_notears_nonlinear"),
        time=alg_output_time_path("gcastle_notears_nonlinear"),
        ntests=alg_output_ntests_path("gcastle_notears_nonlinear"),
    params:
        alg="notears_nonlinear",
    container:
        docker_image("gcastle")
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"