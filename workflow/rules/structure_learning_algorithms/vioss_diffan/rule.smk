rule:
    """ 
    The variable module_name is determined from the folder name
    and set in the Snakefile.
    """
    name:
        module_name
    input:
        data = alg_input_data()        
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    conda:
        "environment.yml"
    container:
        "docker://onceltuca/vioss_diffan:fd83d01"
    script:
        "script.py"