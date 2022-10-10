rule copy_bnfit:
    input:
        "resources/parameters/myparams/bn.fit_networks/{filename}.rds"
    output:
        "{output_dir}/parameters/myparams/bn.fit_networks/{filename}.rds"
    shell:       
        "cp {input} {output}"