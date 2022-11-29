rule:
    name:
        module_name
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        params = "{output_dir}/parameters/" + \
                pattern_strings[module_name] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
        None
    conda:
        "cstrees.yml"
    script:
        "script.py"