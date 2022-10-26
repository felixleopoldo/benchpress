if "bnlearn_fastiamb" in pattern_strings:

    rule bnlearn_fastiamb:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_fastiamb"),
            time=alg_output_time_path("bnlearn_fastiamb"),
            ntests=alg_output_ntests_path("bnlearn_fastiamb"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_fastiamb" + ".R"
