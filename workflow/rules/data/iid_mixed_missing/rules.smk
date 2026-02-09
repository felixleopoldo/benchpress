# Rules for sampling mixed data with missingness

rule sample_mixed_missing_data:
    input:
        params="{output_dir}/parameters/mixed_bn/{bn}/adjmat=/{adjmat}.rds",
        script="workflow/rules/data/iid_mixed_missing/script.R"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/mixed_bn/{bn}"\
             "/data=/"+pattern_strings["iid_mixed_missing"] + "/" \
             "seed={seed}.csv"
    wildcard_constraints:
        n="[0-9]*"
    shell:
        "Rscript workflow/rules/data/iid_mixed_missing/script.R " \
        "--params {input.params} " \
        "--filename {output.data} " \
        "--n {wildcards.n} " \
        "--seed {wildcards.seed}"
