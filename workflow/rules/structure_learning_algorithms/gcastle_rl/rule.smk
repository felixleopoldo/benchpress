
rule:
    name:
        module_name
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=alg_output_ntests_path(module_name)
    params:
        alg="rl"
    container:
        "docker://bpimages/gcastle:1.0.3"
    script:
        "../../../scripts/structure_learning_algorithms/gcastle.py"