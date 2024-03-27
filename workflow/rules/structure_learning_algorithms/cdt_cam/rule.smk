rule cdt_cam:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("cdt_cam"),
        time=alg_output_time_path("cdt_cam"),
        ntests=alg_output_ntests_path("cdt_cam"),
    params:
        alg="cam",
    container:
        "docker://fentechai/cdt:0.6.0"
    script:
        "../../../scripts/structure_learning_algorithms/cdt.py"