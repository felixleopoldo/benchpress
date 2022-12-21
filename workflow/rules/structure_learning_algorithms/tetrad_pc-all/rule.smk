rule tetrad_pc_all:
    input:
        data=alg_input_data()
    output:
        adjmat=alg_output_adjmat_path("tetrad_pc-all"),
        time=alg_output_time_path("tetrad_pc-all"),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://onceltuca/causal-cmd:1.1.3"
    script:
        "tetrad_pc.py"
