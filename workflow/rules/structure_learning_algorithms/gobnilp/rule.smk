if "gobnilp" in pattern_strings:

    rule gobnilp:
        input:
            data=alg_input_data(),
            extra_args="resources/extra_args/{extra_args}",
            constraints="resources/constraints/{constraints}",
        output:
            adjmat=alg_output_adjmat_path("gobnilp"),
            time=alg_output_time_path("gobnilp"),
        container:
            docker_image("gobnilp")
        shell:
            alg_shell("gobnilp")