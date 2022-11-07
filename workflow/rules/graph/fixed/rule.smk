rule fixed_adjmat:
    input:
        "resources/adjmat/myadjmats/{adjmat}.csv"
    output:
        "{output_dir}/adjmat/myadjmats/{adjmat}.csv"        
    shell:       
        "cp {input} {output}"