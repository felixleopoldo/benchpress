rule copy_bnfit:
    input:
        "resources/parameters/myparams/bn.fit_networks/{filename}.rds"
    output:
        "{output_dir}/parameters/myparams/bn.fit_networks/{filename}.rds"
    shell:       
        "cp {input} {output}"

# This is not activated as the params are read dicectly from  resources.
rule copy_sem_params:
    input:
        "resources/parameters/myparams/sem_params/{filename}.csv"
    output:
        "results/parameters/myparams/sem_params/{filename}.csv"
    #wildcard_constraints:
    #    output_dir="^((?!resources).)*$"
    shell:       
        "cp {input} {output}"