
rule:
    name:
        module_name
    input:
        params="{output_dir}/parameters/{params}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
            "/adjmat=/{adjmat}"\
            "/parameters=/{params}/" \
            "data=/"+pattern_strings[module_name] + "/" \
            "seed={seed}.csv"
    wildcard_constraints:
        n="[0-9]*"
    container:
        "docker://bpimages/sandbox:1.0" # Change to None for local run
    script:
        "script.R"
