rule bnlearn_sihitonpc:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_sihitonpc"),
        time=alg_output_time_path("bnlearn_sihitonpc"),
        ntests=alg_output_ntests_path("bnlearn_sihitonpc"),
    container:
        "docker://bpimages/bnlearn:4.7"
    script:
        "bnlearn_sihitonpc.R"
