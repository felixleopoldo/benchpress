rule:
    """ 
    This is not an algorithm, just a hack to use imputed data.
    """
    name:
        module_name
    input:        
        data = alg_input_data()        
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    container:
        "docker://bpimages/mice:3.17.0-ranger"
    script:
        "script.R"