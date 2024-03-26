rule random_precmat:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        params = "{output_dir}/parameters/" + \
                pattern_strings["random_precmat"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
         "docker://bpimages/bdgraph:2.72.0"
    script:
        "random_precmat.R"