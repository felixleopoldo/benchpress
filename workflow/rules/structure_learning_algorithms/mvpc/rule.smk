rule:
    """ 
    MVPC algorithm
    """
    name:
        module_name
    input:
        data = alg_input_data(),
        edgeConstraints_formatted=edge_constraints_mvpc    
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    container:
        "docker://bpimages/mvpc:e95160c"
    script:
        "script.R"        
