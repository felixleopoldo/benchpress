rule:
    name:
        module_name
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        params = "{output_dir}/parameters/" + \
                pattern_strings[module_name] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
        "docker://bpimages/sandbox" # Change to None for local run
    script:
        "script.R" 
