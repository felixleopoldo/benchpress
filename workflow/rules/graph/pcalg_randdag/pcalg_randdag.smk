if "pcalg_randdag" in pattern_strings:
    rule sample_adjmat:
        input:
            "workflow/scripts/graph_sampling/sample_dags.R"
        output:        
            adjmat = "{output_dir}/adjmat/" + pattern_strings["pcalg_randdag"] + "/seed={replicate}.csv"
        container:
            docker_image("bidag")
        script:
            "../scripts/graph_sampling/sample_dags.R"
