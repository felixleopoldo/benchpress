rule:
    name:
        module_name
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings[module_name] + "/seed={seed}.csv"
    container:
        "docker://bpimages/bidag:2.1.4"
    script: 
        "sample_dags.R"
