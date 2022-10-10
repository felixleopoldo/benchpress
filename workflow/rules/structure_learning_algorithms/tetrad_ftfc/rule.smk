if "tetrad_ftfc" in pattern_strings:

    rule tetrad_ftfc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_ftfc"),
            time=alg_output_time_path("tetrad_ftfc"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_ftfc.py"