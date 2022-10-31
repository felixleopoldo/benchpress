rule tetrad_fofc:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("tetrad_fofc"),
        time=alg_output_time_path("tetrad_fofc"),
    container:
        docker_image("tetrad")
    script:
        "tetrad_fofc.py"
