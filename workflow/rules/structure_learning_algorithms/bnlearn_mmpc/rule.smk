if "bnlearn_mmpc" in pattern_strings:

    rule bnlearn_mmpc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_mmpc"),
            time=alg_output_time_path("bnlearn_mmpc"),
            ntests=alg_output_ntests_path("bnlearn_mmpc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_mmpc" + ".R"
