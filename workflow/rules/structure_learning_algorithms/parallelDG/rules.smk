if "parallelDG" in pattern_strings:

    rule parallelDG:
        input:
            data=alg_input_data(),
        output:
            adjvecs=alg_output_seqgraph_path("parallelDG"),
            time=alg_output_time_path("parallelDG"),
        container:
            docker_image("parallelDG")
        shell:
            alg_shell("parallelDG")

    rule parallelDG_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("parallelDG"),
        output:
            adjmat=alg_output_adjmat_path("parallelDG"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"