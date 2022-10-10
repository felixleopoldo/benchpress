if "gt13_multipair" in pattern_strings:

    rule gt13_multipair:
        input:
            data=alg_input_data(),
        output:
            seqgraph=alg_output_seqgraph_path("gt13_multipair"),
            time=alg_output_time_path("gt13_multipair"),
        container:
            docker_image("thomasjava")
        shell:
            alg_shell("gt13_multipair")

    rule gt13_multipair_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("gt13_multipair"),
        output:
            adjmat=alg_output_adjmat_path("gt13_multipair"),
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"