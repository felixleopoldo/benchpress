if "bidag_itsearch" in pattern_strings:

    rule itsearch:
        input:
            "workflow/rules/structure_learning_algorithms/bidag_iterative_search/bidag_iterative_search.R",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bidag_itsearch"),
            time=alg_output_time_path("bidag_itsearch"),
        container:
            docker_image("bidag")
        script:
            "bidag_iterative_search.R"