rule bdgraph_graphsim:
    output:        
        adjmat = "{output_dir}/adjmat/" + pattern_strings["bdgraph_graphsim"] + "/seed={replicate}.csv"
    container:
        docker_image("bdgraph")
    script:
        "bdgraph_graphsim.R"