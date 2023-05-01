rule bnlearn_iambfdr:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_iambfdr"),
        time=alg_output_time_path("bnlearn_iambfdr"),
        ntests=alg_output_ntests_path("bnlearn_iambfdr"),
    container:
        "docker://bpimages/bnlearn:4.8.1"
    script:
        "bnlearn_iambfdr.R"
