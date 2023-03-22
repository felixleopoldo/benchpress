rule tetrad_fas:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("tetrad_fas"),
        time=alg_output_time_path("tetrad_fas"),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/causal-cmd:1.1.3"
    script:
        "tetrad_fas.py"