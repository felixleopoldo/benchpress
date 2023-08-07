include: "script.py"

rule:
    name:
        module_name
    input:
        data=alg_input_data(),
    output:
        seqgraph=alg_output_seqgraph_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/thomasgreen:1.19-bp"
    shell:
        alg_shell("gt13_multipair")

