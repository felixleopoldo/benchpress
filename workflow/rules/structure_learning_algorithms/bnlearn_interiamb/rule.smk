rule bnlearn_interiamb:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_interiamb"),
        time=alg_output_time_path("bnlearn_interiamb"),
        ntests=alg_output_ntests_path("bnlearn_interiamb"),
    container:
        "docker://onceltuca/bnlearn:4.7"
    script:
        "bnlearn_inter-iamb.R"
