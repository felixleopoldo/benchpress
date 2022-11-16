
rule gcastle_rl:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_rl"),
        time=alg_output_time_path("gcastle_rl"),
        ntests=alg_output_ntests_path("gcastle_rl")
    params:
        alg="rl"
    container:
        "docker://onceltuca/gcastle:1.0.3"
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"