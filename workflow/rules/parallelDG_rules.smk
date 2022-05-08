# This file contains the rules for all structure learning algorithm 


if "parallelDG" in pattern_strings:
    rule parallelDG:
        input:
            data=alg_input_data()
        output:
            adjvecs = alg_output_seqgraph_path("parallelDG"),
            time = alg_output_time_path("parallelDG")
        container:
            docker_image("trilearn")
        shell:
            alg_shell("parallelDG")

    rule parallelDG_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj = alg_output_seqgraph_path("parallelDG"),
        output:
            adjmat = alg_output_adjmat_path("parallelDG") #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map"
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

    rule summarise_parallelDG:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data = summarise_alg_input_data_path(),
            adjmat_true = summarise_alg_input_adjmat_true_path(),
            adjmat_est = summarise_alg_input_adjmat_est_path("parallelDG"),
            time = summarise_alg_input_time_path("parallelDG")
        output:
            res = summarise_alg_output_res_path("parallelDG")
        shell:
            summarise_alg_shell("parallelDG")
        
    rule join_summaries_parallelDG:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("parallelDG")
        output:
            join_summaries_output("parallelDG")
        script:
            "../scripts/evaluation/join_csv_files.R"
