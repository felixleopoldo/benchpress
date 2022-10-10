if "tetrad_fask" in pattern_strings:

    rule tetrad_fask:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_fask"),
            time=alg_output_time_path("tetrad_fask"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_fask.py"
