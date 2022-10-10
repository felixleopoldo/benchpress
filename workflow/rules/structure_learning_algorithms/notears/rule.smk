
if "notears" in pattern_strings:

    rule notears:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("notears"),
            time=alg_output_time_path("notears"),
        container:
            docker_image("notears")
        shell:
            alg_shell("notears")