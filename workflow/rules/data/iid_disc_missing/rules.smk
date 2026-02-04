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


# """
# TODO: Standardisation should better be done in a separate preprocessing module
# in the data section in benchmark_setup.
# """
# rule standardize:
#     input:
#         data="{output_dir}/data" \
#              "/{model}"\
#              "/data=/{data_alg}/{data_params}/seed={seed}.csv"
#     output:
#         data="{output_dir}/data" \
#              "/{model}" \
#              "/data=/{data_alg}/{data_params}/standardized={standardized}/seed={seed}.csv"
#     wildcard_constraints:
#         standardized="(True|False)",
#         seed="[0-9]*"
#     script:
#         "standardize.R"

# rule sample_data_fixed_bnfit:
#     input:
#         "workflow/rules/data/iid/sample_from_bnlearn_bn.R",
#         bn="resources/parameters/myparams/bn.fit_networks/{bn}"
#     output:
#         data="{output_dir}/data/adjmat=/{adjmat}/parameters=/bn.fit_networks/{bn}/data=/"+pattern_strings["iid"]+"/seed={seed}.csv"
#     wildcard_constraints:
#         n="[0-9]*",
#         bn=r".*\.rds"
#     shell:
#         "Rscript workflow/rules/data/iid/sample_from_bnlearn_bn.R " \
#         "--filename {output.data} " \
#         "--filename_bn {input.bn} " \
#         "--samples {wildcards.n} " \
#         "--seed {wildcards.seed}"
