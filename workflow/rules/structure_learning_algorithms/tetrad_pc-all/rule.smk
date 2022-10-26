if "tetrad_pc-all" in pattern_strings:

    rule tetrad_pc_all:
        input:
            "workflow/scripts/structure_learning_algorithms/tetrad_pc.py",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_pc-all"),
            time=alg_output_time_path("tetrad_pc-all"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_pc.py"
