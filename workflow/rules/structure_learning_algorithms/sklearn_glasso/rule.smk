if "sklearn_glasso" in pattern_strings:

    rule sklearn_glasso:
        input:
            data=alg_input_data(),
            sklearn_glasso="workflow/scripts/structure_learning_algorithms/sklearn_glasso.py",
        output:
            adjmat=alg_output_adjmat_path("sklearn_glasso"),
            time=alg_output_time_path("sklearn_glasso"),
        container:
            docker_image("pydatascience")
        script:
            "../scripts/structure_learning_algorithms/sklearn_glasso.py"