if "tetrad_lingam" in pattern_strings:

    rule tetrad_lingam:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_lingam"),
            time=alg_output_time_path("tetrad_lingam"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_lingam.py"
