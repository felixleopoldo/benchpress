rule gcastle_corl:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_corl"),
        time=alg_output_time_path("gcastle_corl"),
        ntests=alg_output_ntests_path("gcastle_corl"),
    params:
        alg="corl",
    container:
        docker_image("gcastle")
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"