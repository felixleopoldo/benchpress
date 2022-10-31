module_name = "mylib_myalg"
rule:
    input:
        data = alg_input_data()        
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    container:
        None
        #"docker://r-base" # This would run the script in a the r-base container.
    script:
        # This is a template R script but it could be any R or Python script, 
        # even in a different directory.
        "mylib_myalg.R"
        # Make sure to use the absolute path starting with "/" in your file system if
        # you change to a script outside Benchpress a.s. e.g.            
        #"/home/felix/Desktop/mylib_myalg.R" 