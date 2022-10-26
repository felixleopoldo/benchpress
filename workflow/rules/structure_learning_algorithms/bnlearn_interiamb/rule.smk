if "bnlearn_interiamb" in pattern_strings:

    rule bnlearn_interiamb:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_interiamb"),
            time=alg_output_time_path("bnlearn_interiamb"),
            ntests=alg_output_ntests_path("bnlearn_interiamb"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/bnlearn_inter-iamb.R"
