if "tetrad_fges" in pattern_strings:

    rule tetrad_fges:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_fges"),
            time=alg_output_time_path("tetrad_fges"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_fges.py"