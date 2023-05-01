rule hc:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_hc"),
        time=alg_output_time_path("bnlearn_hc"),
        ntests=alg_output_ntests_path("bnlearn_hc"),
    container:
        "docker://bpimages/bnlearn:4.8.1"
    script:
        "bnlearn_hc.R"