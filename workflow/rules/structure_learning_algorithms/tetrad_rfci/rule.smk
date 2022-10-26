if "tetrad_rfci" in pattern_strings:

    rule tetrad_rfci:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_rfci"),
            time=alg_output_time_path("tetrad_rfci"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_rfci.py"