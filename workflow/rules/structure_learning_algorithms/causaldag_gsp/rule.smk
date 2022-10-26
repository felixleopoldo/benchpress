if "causaldag_gsp" in pattern_strings:

    rule causaldag_gsp:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("causaldag_gsp"),
            time=alg_output_time_path("causaldag_gsp"),
            ntests=alg_output_ntests_path("causaldag_gsp"),

        container:
            docker_image("causaldag")
        script:
            "../scripts/structure_learning_algorithms/causaldag_gsp.py"