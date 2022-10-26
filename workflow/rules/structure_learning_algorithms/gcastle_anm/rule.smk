if "gcastle_anm" in pattern_strings:

    rule gcastle_anm:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_anm"),
            time=alg_output_time_path("gcastle_anm"),
            ntests=alg_output_ntests_path("gcastle_anm"),
        params:
            alg="anm",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"