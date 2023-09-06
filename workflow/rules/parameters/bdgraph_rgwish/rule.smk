rule bdgraph_rgwish:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        params = "{output_dir}/parameters/" + \
                pattern_strings["bdgraph_rgwish"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
        "docker://bpimages/bdgraph:2.72"
    script:
        "bdgraph_rgwish.R"