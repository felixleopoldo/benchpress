rule sample_adjmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["pcalg_randdag"] + "/seed={replicate}.csv"
    container:
        "docker://bpimages/bidag:2.1.4"
    script: 
        "sample_dags.R"
