if "gg99_singlepair" in pattern_strings:

    rule gg99_singlepair:
        input:
            data=alg_input_data(),
        output:
            seqgraph=alg_output_seqgraph_path("gg99_singlepair"),
            time=alg_output_time_path("gg99_singlepair"),
        container:
            docker_image("thomasjava")
        shell:
            alg_shell("gg99_singlepair")

    rule gg99_singlepair_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("gg99_singlepair"),
        output:
            adjmat=alg_output_adjmat_path("gg99_singlepair"),
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"