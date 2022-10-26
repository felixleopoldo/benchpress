if "tetrad_fofc" in pattern_strings:

    rule tetrad_fofc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_fofc"),
            time=alg_output_time_path("tetrad_fofc"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_fofc.py"
