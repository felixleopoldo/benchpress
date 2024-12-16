rule:
    name:
        module_name
    input:
        data = alg_input_data(),
        edgeConstraints_formatted=edge_constraints_bips_tpc
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/bips_tpc:137e18b-amd64"
    script:
        "script.R"