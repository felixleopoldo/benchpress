rule:
    """ 
    MVPC algorithm
    """
    name:
        module_name
    input:
        # input_algorithm=input_algorithm # To use this, add a field called input_algorithm_id to the JSON file
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
        # If in a different directory, make sure to use the absolute path starting with "/" in your file system if
        # you change to a script outside Benchpress a.s. e.g.            
        #"/home/felix/Desktop/mylib_myalg.R" 