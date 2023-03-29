rule bidag_iterative_search:
    input:
        data=alg_input_data()
    output:
        adjmat=alg_output_adjmat_path("bidag_itsearch"),
        time=alg_output_time_path("bidag_itsearch"),
        ntests=touch(alg_output_ntests_path("bidag_itsearch")),
    container:
        "docker://bpimages/bidag:2.0.3"
    script:
        "bidag_iterative_search.R"
