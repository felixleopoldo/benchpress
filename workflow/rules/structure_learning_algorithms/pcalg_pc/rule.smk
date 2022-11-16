# The variable module_name is determined from the folder name
# and set in the Snakefile.
rule:
    name:
        module_name
    input:
        data=alg_input_data()
        
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://onceltuca/pcalg:2.7-3"
    script:
        "pcalg_pc.R"