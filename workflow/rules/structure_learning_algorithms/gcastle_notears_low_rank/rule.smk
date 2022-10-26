if "gcastle_notears_low_rank" in pattern_strings:

    rule gcastle_notears_low_rank:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_notears_low_rank"),
            time=alg_output_time_path("gcastle_notears_low_rank"),
            ntests=alg_output_ntests_path("gcastle_notears_low_rank"),
        params:
            alg="notears_low_rank",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"