
rule:
    name:
        module_name
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings[module_name] + "/seed={replicate}.csv"
    container:
        None
    script: 
        "script.py"
        #"script.R"
