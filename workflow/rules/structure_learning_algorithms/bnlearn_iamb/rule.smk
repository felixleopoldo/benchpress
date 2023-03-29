rule bnlearn_iamb:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_iamb"),
        time=alg_output_time_path("bnlearn_iamb"),
        ntests=alg_output_ntests_path("bnlearn_iamb"),
    container:
        "docker://bpimages/bnlearn:4.7"
    script:
        "bnlearn_iamb.R"
