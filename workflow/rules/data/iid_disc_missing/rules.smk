# Rules for sampling data. Each models (graph, param) may have
# a unique way of sampling. This is hidden for the user but
# treated here.


rule sample_disc_missing_data:
    input:
        bn="{output_dir}/parameters/disc_bn/{bn}/adjmat=/{adjmat}.rds",
        script="workflow/rules/data/iid_disc_missing/script.R"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/disc_bn/{bn}"\
             "/data=/"+pattern_strings["iid_disc_missing"] + "/" \
             "seed={seed}.csv"
    wildcard_constraints:
        n="[0-9]*"
    shell:
        "Rscript workflow/rules/data/iid_disc_missing/script.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.seed}"

rule sample_disc_bin_missing_data:
    input:
        bn="{output_dir}/parameters/bin_bn/{bn}/adjmat=/{adjmat}.rds",
        script="workflow/rules/data/iid_disc_missing/script.R"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/bin_bn/{bn}"\
             "/data=/"+pattern_strings["iid_disc_missing"] + "/" \
             "seed={seed}.csv"
    wildcard_constraints:
        n="[0-9]*"
    shell:
        "Rscript workflow/rules/data/iid_disc_missing/script.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.seed}"

