rule tetrad_imgscont:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("tetrad_imgscont"),
        time=alg_output_time_path("tetrad_imgscont"),
    container:
        docker_image("tetrad")
    script:
        "tetrad_imgscont.py"
