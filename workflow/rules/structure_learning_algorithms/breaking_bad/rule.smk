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
    container:
        # Built from LGAI-Research/breaking-bad (see the Dockerfile in this
        # directory for how). Tag matches the breaking-bad commit it was
        # built against.
        "docker://bpimages/breaking_bad:09d621a"
    script:
        "script.py"
