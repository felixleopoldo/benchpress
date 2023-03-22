rule gcastle_ica_lingam:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gcastle_ica_lingam"),
        time=alg_output_time_path("gcastle_ica_lingam"),
        ntests=alg_output_ntests_path("gcastle_ica_lingam"),
    params:
        alg="ica_lingam",
    container:
        "docker://bpimages/gcastle:1.0.3"
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"