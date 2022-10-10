if "bnlearn_pcstable" in pattern_strings:

    rule bnlearn_pcstable:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_pcstable"),
            time=alg_output_time_path("bnlearn_pcstable"),
            ntests=alg_output_ntests_path("bnlearn_pcstable"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_pcstable" + ".R"
