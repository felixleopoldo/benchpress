"""
    The shell commands should be put in a separate bash script.
"""

rule:
    name: module_name
    input:
        data=alg_input_data(),
        extra_args="resources/extra_args/{extra_args}",
        constraints="resources/constraints/{constraints}",
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        "docker://bpimages/gobnilp:4347c64"
    script:
        "script.sh"