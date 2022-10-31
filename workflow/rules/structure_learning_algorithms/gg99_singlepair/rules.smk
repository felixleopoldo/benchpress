import script

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
        traj=alg_output_seqgraph_path_nocomp("gg99_singlepair"),
    output:
        adjmat=alg_output_adjmat_path("gg99_singlepair"),
    params:
        graph_type="dag",
        estimator="threshold",
        threshold="{threshold}",
        burnin="{burnin}"
    container:
        docker_image("networkx")
    script:
        "../../../scripts/evaluation/graphtraj_est.py"