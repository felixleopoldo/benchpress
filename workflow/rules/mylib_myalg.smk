
if "mylib_myalg" in pattern_strings:
    rule mylib_myalg:
        input:                        
            # This makes the rule triggered when the code is altered.
            # If you change this you may have to use use the absolute path here, i.e. starting with "/".
            justatrigger="workflow/scripts/structure_learning_algorithms/mylib_myalg.R",
            data = alg_input_data()        
        output:
            adjmat = alg_output_adjmat_path("mylib_myalg"),
            time = alg_output_time_path("mylib_myalg"),
            ntests = alg_output_ntests_path("mylib_myalg")
        container:
            None
            #docker_image("docker://r-base") # This would run the script in a the r-base container.
        script:
            # This is a template R script but it could be any R or Python script, even in a different directory.
            "../scripts/structure_learning_algorithms/mylib_myalg.R"
            # Make sure to use the absolute path starting with "/" in your file system if
            # you change to a script outside Benchpress a.s. e.g.            
            #"/home/felix/Desktop/mylib_myalg.R"        
        # This is an example of how to run programs in other languages, instead of using "script", we use "shell".
        # shell:
        #    "/path/to/myalgcommand.sh {input.data}"
