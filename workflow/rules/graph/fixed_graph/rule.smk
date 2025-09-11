
rule fixed_adjmat:
    input:
        "resources/adjmat/myadjmats/{adjmat}.csv"
    output:
        "{output_dir}/adjmat/myadjmats/{adjmat}.csv" 
    wildcard_constraints:
        output_dir="^(?!resources).*$"
    shell:
        "cp {input} {output}"