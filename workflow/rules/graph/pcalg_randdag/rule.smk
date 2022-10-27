rule sample_adjmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["pcalg_randdag"] + "/seed={replicate}.csv"
    container:
        docker_image("bidag")
    script: 
        "sample_dags.R"
