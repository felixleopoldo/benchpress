rule:
    """ 
    The variable module_name is determined from the folder name
    and set in the Snakefile.
    """
    name:
        module_name
    input:
        # input_algorithm=input_algorithm # To use this, add a field called input_algorithm_id to the JSON file
        data = alg_input_data(),
        thelib="/home/felix/git/pasteacause/main.py"
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    container:
        None
    #    "docker://bpimages/sandbox:1.0" # Change to None for local run
    conda:
        "pasting"
    script:
        "script.py"