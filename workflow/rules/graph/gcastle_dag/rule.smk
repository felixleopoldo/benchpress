rule gcastle_dag:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["gcastle_dag"] + "/seed={replicate}.csv"
    container:
        "docker://onceltuca/gcastle:1.0.3"
    script: 
        "script.py"
