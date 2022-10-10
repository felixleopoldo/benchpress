
if "trilearn_pgibbs" in pattern_strings:

    rule trilearn:
        input:
            data=alg_input_data(),
        output:
            adjvecs=alg_output_seqgraph_path("trilearn_pgibbs"),
            time=alg_output_time_path("trilearn_pgibbs"),
        container:
            docker_image("trilearn")
        shell:
            alg_shell("trilearn_pgibbs")

    rule trilearn_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("trilearn_pgibbs"),
        output:
            adjmat=alg_output_adjmat_path("trilearn_pgibbs"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"