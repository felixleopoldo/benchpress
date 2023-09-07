
rule:
    name:
        module_name
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings[module_name] + "/seed={replicate}.csv"
    container:
        "docker://bpimages/sandbox:1.0" # Change to None for local execution
    script: 
        "script.R"
