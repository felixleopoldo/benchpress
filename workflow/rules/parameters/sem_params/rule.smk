if "sem_params" in pattern_strings:
    rule sample_sem_params:
        input:
            "workflow/rules/parameters/sem_params/sample_semparams.R", 
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            bn =    "{output_dir}/parameters/" + \
                    pattern_strings["sem_params"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("bidag")
        script:
            "sample_semparams.R" 