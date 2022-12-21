rule bnlearn_rsmax2:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("bnlearn_rsmax2"),
        time=alg_output_time_path("bnlearn_rsmax2"),
        ntests=alg_output_ntests_path("bnlearn_rsmax2"),
    container:
        "docker://onceltuca/bnlearn:4.7"
    script:
        "bnlearn_rsmax2.R"
