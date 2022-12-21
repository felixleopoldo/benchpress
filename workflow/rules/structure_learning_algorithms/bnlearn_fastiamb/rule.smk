rule bnlearn_fastiamb:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_fastiamb"),
        time=alg_output_time_path("bnlearn_fastiamb"),
        ntests=alg_output_ntests_path("bnlearn_fastiamb"),
    container:
        "docker://onceltuca/bnlearn:4.7"
    script:
        "bnlearn_fastiamb.R"
