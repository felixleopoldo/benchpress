if "tetrad_gfci" in pattern_strings:

    rule tetrad_gfci:
        input:
            "workflow/scripts/structure_learning_algorithms/tetrad_gfci.py",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_gfci"),
            time=alg_output_time_path("tetrad_gfci"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_gfci.py"