rule bdgraph_rgwish:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        params = "{output_dir}/parameters/" + \
                pattern_strings["bdgraph_rgwish"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
        "docker://onceltuca/bdgraph:2.64"
    script:
        "bdgraph_rgwish.R"