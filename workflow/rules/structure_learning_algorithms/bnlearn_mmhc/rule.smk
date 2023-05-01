rule bnlearn_mmhc:
    input:
        data=alg_input_data()
    output:
        adjmat=alg_output_adjmat_path("bnlearn_mmhc"),
        time=alg_output_time_path("bnlearn_mmhc"),
        ntests=alg_output_ntests_path("bnlearn_mmhc")
    container:
        "docker://bpimages/bnlearn:4.8.1"
    script:
        "bnlearn_mmhc.R"