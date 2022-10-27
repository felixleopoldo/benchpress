if "pcalg_pc" in pattern_strings:

    rule pcalg_pc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("pcalg_pc"),
            time=alg_output_time_path("pcalg_pc"),
        container:
            docker_image("pcalg")
        script:
            "pcalg_pc.R"