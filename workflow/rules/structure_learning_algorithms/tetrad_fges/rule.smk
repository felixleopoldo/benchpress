rule tetrad_fges:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("tetrad_fges"),
        time=alg_output_time_path("tetrad_fges"),
        ntests=touch(alg_output_ntests_path("tetrad_fges"))
    container:
        "docker://onceltuca/causal-cmd:1.1.3"
    script:
        "tetrad_fges.py"