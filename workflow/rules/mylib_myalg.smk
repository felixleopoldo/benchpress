
if "mylib_myalg" in pattern_strings:
    rule mylib_myalg:
        input:
            data = alg_input_data(),
            thescript="workflow/scripts/structure_learning_algorithms/mydevdir/mylib_myalg.R"
        output:
            adjmat = alg_output_adjmat_path("mylib_myalg"),
            time = alg_output_time_path("mylib_myalg"),
            ntests = alg_output_ntests_path("mylib_myalg")
        container:
            None
            #docker_image("rbase")
        script:
            "../scripts/structure_learning_algorithms/mydevdir/mylib_myalg.R"

    rule summarise_mylib_myalg:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data = summarise_alg_input_data_path(),
            adjmat_true = summarise_alg_input_adjmat_true_path(),
            adjmat_est = summarise_alg_input_adjmat_est_path("mylib_myalg"),
            time = summarise_alg_input_time_path("mylib_myalg"),
            ntests = summarise_alg_input_ntests_path("mylib_myalg")
        output:
            res = summarise_alg_output_res_path("mylib_myalg")
        shell:
            summarise_alg_shell("mylib_myalg")
        
    rule join_summaries_mylib_myalg:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("mylib_myalg")
        output:
            join_summaries_output("mylib_myalg")
        script:
            "../scripts/evaluation/join_csv_files.R"
