rule dcomposable_chain:
    input:
        data=alg_input_data(),
    output:
        seqgraph=touch(alg_output_seqgraph_path(module_name)),
    container:
        "docker://hallawalla/dualgl:0.1"
    script:
        "script.sh"

rule:
    name:
        module_name
    input:
        data=alg_input_data(),
        seqgraph=alg_output_seqgraph_path(module_name),
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=touch(alg_output_time_path(module_name)),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://hallawalla/dualgl:0.1"
    script:
        "screening.R"
