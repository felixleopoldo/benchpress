rule bdgraph_graphsim:
    output:        
        adjmat = "{output_dir}/adjmat/" + pattern_strings["bdgraph_graphsim"] + "/seed={replicate}.csv"
    container:
        "docker://onceltuca/bdgraph:2.64"
    script:
        "bdgraph_graphsim.R"