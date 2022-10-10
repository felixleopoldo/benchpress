if "bnlearn_hc" in pattern_strings:

    rule hc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_hc"),
            time=alg_output_time_path("bnlearn_hc"),
            ntests=alg_output_ntests_path("bnlearn_hc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/bnlearn_hc.R"