rule bdgraph_graphsim:
    output:        
        adjmat = "{output_dir}/adjmat/" + pattern_strings["bdgraph_graphsim"] + "/seed={replicate}.csv"
    container:
        "docker://bpimages/bdgraph:2.72"
    script:
        "bdgraph_graphsim.R"