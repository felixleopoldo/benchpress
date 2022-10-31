rule tetrad_gfci:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("tetrad_gfci"),
        time=alg_output_time_path("tetrad_gfci"),
    container:
        docker_image("tetrad")
    script:
        "tetrad_gfci.py"