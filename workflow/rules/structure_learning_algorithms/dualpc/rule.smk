if "dualpc" in pattern_strings:

    rule dualpc:
        input:
            "workflow/scripts/structure_learning_algorithms/dualpc.R",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("dualpc"),
            time=alg_output_time_path("dualpc"),
        container:
            docker_image("dualpc")
        script:
            "../scripts/structure_learning_algorithms/dualpc.R"