if "bnlearn_rsmax2" in pattern_strings:

    rule bnlearn_rsmax2:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_rsmax2"),
            time=alg_output_time_path("bnlearn_rsmax2"),
            ntests=alg_output_ntests_path("bnlearn_rsmax2"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_rsmax2" + ".R"
