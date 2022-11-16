rule gcastle_anm:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_anm"),
        time=alg_output_time_path("gcastle_anm"),
        ntests=touch(alg_output_ntests_path("gcastle_anm")),
    params:
        alg="anm",
    container:
        "docker://onceltuca/gcastle:1.0.3"
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"