if "bdgraph_graphsim" in pattern_strings:
    rule bdgraph_graphsim:
        input:
            "workflow/scripts/graph_sampling/bdgraph_graphsim.R"
        output:        
            adjmat = "{output_dir}/adjmat/" + pattern_strings["bdgraph_graphsim"] + "/seed={replicate}.csv"
        container:
            docker_image("bdgraph")
        script:
            "../scripts/graph_sampling/bdgraph_graphsim.R"