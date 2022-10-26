if "bidag_order_mcmc" in pattern_strings:

    rule order_mcmc:
        input:
            "workflow/scripts/structure_learning_algorithms/bidag_order_mcmc.R",
            data=alg_input_data(),
            startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
        output:  # data seems to be matched wrongly
            seqgraph=alg_output_seqgraph_path("bidag_order_mcmc"),
            time=alg_output_time_path("bidag_order_mcmc"),
        container:
            docker_image("bidag")
        script:
            "../scripts/structure_learning_algorithms/bidag_order_mcmc.R"

    rule order_mcmc_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_fine_match("bidag_order_mcmc"),
        output:
            adjmat=adjmat_estimate_path_mcmc("bidag_order_mcmc"),
        params:
            graph_type="dag",
            estimator="threshold",
            threshold="{threshold}",
            burnin="{burnin}",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"