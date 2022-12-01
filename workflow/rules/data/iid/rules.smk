# Rules for sampling data. Each models (graph, param) may have
# a unique way of sampling. This is hidden for the user but
# treated here.

rule sample_bin_bn_data:
    input:
        bn="{output_dir}/parameters/bin_bn/{bn}/adjmat=/{adjmat}.rds"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/bin_bn/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    shell:
        "Rscript workflow/rules/data/iid/sample_data_with_range_header.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

rule sample_loglindata:
    input:
        bn="{output_dir}/parameters/trilearn_hyper-dir/{bn}/adjmat=/{adjmat}.json"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/trilearn_hyper-dir/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/data_sampling/trilearn_sample_loglin_data.py {wildcards.replicate}  {input.bn} {output.data} {wildcards.n}"

rule sample_intra_class_data:
    input:
        "workflow/rules/data/iid/numpy_sample_mvn_data.py",
        cov="{output_dir}/parameters/trilearn_intra-class/{bn}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/trilearn_intra-class/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python2 workflow/rules/data/iid/numpy_sample_mvn_data.py  {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

rule sample_g_inverse_wishart:
    input:
        "workflow/scripts/data_sampling/numpy_sample_mvn_data.py",
        cov="{output_dir}/parameters/trilearn_g_inv_wishart/{bn}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/trilearn_g_inv_wishart/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/data_sampling/numpy_sample_mvn_data.py {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

rule sample_rgwish_data:
    input:
        "workflow/rules/data/iid/numpy_sample_mvn_data.py",
        cov="{output_dir}/parameters/bdgraph_rgwish/{bn}/adjmat=/{adjmat}.csv" # This could probably be relaxed
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/bdgraph_rgwish/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python workflow/rules/data/iid/numpy_sample_mvn_data.py {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

"""
TODO: Standardisation should better be done in a separate preprocessing module 
in the data section in benchmark_setup.
"""
rule standardize:
    input:
        data="{output_dir}/data" \
             "/{model}"\
             "/data=/{data_alg}/{data_params}/seed={seed}.csv"
    output:
        data="{output_dir}/data" \
             "/{model}" \             
             "/data=/{data_alg}/standardized={standardized, (True|False)}/{data_params}/seed={seed}.csv"
    script:
        "standardize.R"

rule sample_data_fixed_bnfit:
    input:
        "workflow/rules/data/iid/sample_from_bnlearn_bn.R",
        bn="resources/parameters/myparams/bn.fit_networks/{bn}"        
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/parameters=/bn.fit_networks/{bn}/data=/iid/n={n}/seed={replicate}.csv"
    shell:
        "Rscript workflow/rules/data/iid/sample_from_bnlearn_bn.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

"""
This rule is for the case when te sem parameters are given as a matrix in 
a .csv file in resources/parameters/myparams/sem_params.
"""
rule sample_fixed_sem_params_data:
    # No copying here as for bn.fit_params.
    input:        
        bn="resources/parameters/myparams/{bn}"      
    output:
        data="{output_dir}/data/" \
             "adjmat=/{adjmat}/" \
             "parameters=/{bn}/" \
             "data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("bidag")
    script:
        "sample_sem_data.R" 


if "sem_params" in pattern_strings:
    # BUG: Parameters are matched wrongly here, as seed goes into the last variable
    # but it is not used anyway so it is ok...
    rule sample_sem_data:
        input:
            bn="{output_dir}/parameters/"+pattern_strings["sem_params"]+"/adjmat=/{adjmat}.csv"
        output:
            data="{output_dir}/data" \
                "/adjmat=/{adjmat}"\
                "/parameters=/" + pattern_strings["sem_params"] + "/" \ 
                "data=/iid/" \
                "n={n}/" \
                "seed={replicate}.csv"
        container:
            docker_image("bidag")
        script:
            "sample_sem_data.R" 


rule sample_cstrees_params_data:
    input:
        cstree = "{output_dir}/adjmat/{adjmat}/seed={replicate}.csv",
        #params="{output_dir}/parameters/"+pattern_strings["cstrees_params"]+"/seed={replicate}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/"+pattern_strings["cstrees_params"] + "/seed={replicate}" \
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        None
    conda:
        "cstrees.yml"
    script:
        "cstrees_data.py"