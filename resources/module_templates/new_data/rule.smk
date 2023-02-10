
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
        None
    script:
        "script.R"
