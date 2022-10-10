
if "gcastle_rl" in pattern_strings:

    rule gcastle_rl:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_rl"),
            time=alg_output_time_path("gcastle_rl"),
            ntests=alg_output_ntests_path("gcastle_rl"),
        params:
            alg="rl",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"