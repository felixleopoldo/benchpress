rule:
    """ 
    The variable module_name is determined from the folder name
    and set in the Snakefile.
    """
    name:
        module_name
    input:
        input_algorithm=input_algorithm, # To use this, add a field called input_algorithm_id to the JSON file
        edgeConstraints_formatted=edge_constraints_tpc,        
        data = alg_input_data(),
        tpc="workflow/rules/structure_learning_algorithms/tpc/R/tskeleton.R"
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/bips_tpc:137e18be" # Change to None for local run

    script:
        # This is a template R script but it could be any R or Python script, 
        # even in a different directory.
        "script.R"
        #"script.py"
        # If in a different directory, make sure to use the absolute path starting with "/" in your file system if
        # you change to a script outside Benchpress a.s. e.g.            
        #"/home/felix/Desktop/mylib_myalg.R" 