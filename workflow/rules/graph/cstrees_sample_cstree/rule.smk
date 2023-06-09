rule:
    name:
        module_name
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings[module_name] + "/seed={replicate}.csv"
    container:
        None
    conda:
        "cstrees.yml"
        #"cstrees"
        #"/home/f/l/flrios/NOBACKUP/flrios/miniconda3/envs/cstrees"
    script: 
        "script.py"
