
rule:
    name:
        module_name
    input:
        data=alg_input_data(),
        input_algorithm=lambda wildcards: path_to_input_algorithm_graph(wildcards.input_algorithm_id) if hasattr(wildcards, 'input_algorithm_id') else [],
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=touch(alg_output_time_path(module_name)),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/equsa_psilearner:1.2.1"
    script:
        "psi_learner.R"
