rule sample_sem_params:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn =    "{output_dir}/parameters/" + \
                pattern_strings["sem_params"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
        "docker://bpimages/bidag:2.1.4"
    script:
        "sample_semparams.R" 