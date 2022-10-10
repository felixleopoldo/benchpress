if "tetrad_fci" in pattern_strings:

    rule tetrad_fci:
        input:
            "workflow/scripts/structure_learning_algorithms/tetrad_fci.py",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_fci"),
            time=alg_output_time_path("tetrad_fci"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_fci.py"