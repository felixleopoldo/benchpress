if "bnlearn_iamb" in pattern_strings:

    rule bnlearn_iamb:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_iamb"),
            time=alg_output_time_path("bnlearn_iamb"),
            ntests=alg_output_ntests_path("bnlearn_iamb"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_iamb" + ".R"
