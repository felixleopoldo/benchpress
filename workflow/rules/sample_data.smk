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
        "Rscript workflow/scripts/data_sampling/sample_data_with_range_header.R " \
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
        "workflow/scripts/data_sampling/numpy_sample_mvn_data.py",
        cov="{output_dir}/parameters/intra-class/{bn}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/intra-class/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/data_sampling/numpy_sample_mvn_data.py  {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

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
        "workflow/scripts/data_sampling/numpy_sample_mvn_data.py",
        cov="{output_dir}/parameters/bdgraph_rgwish/{bn}/adjmat=/{adjmat}.csv" # This could probably be relaxed
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/parameters=/bdgraph_rgwish/{bn}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/data_sampling/numpy_sample_mvn_data.py {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

rule standardize:
    input:
        data="{output_dir}/data" \
             "/{model}"\
             "/data=/iid/n={n}/seed={replicate}.csv"
    output:
        data="{output_dir}/data" \
             "/{model}"\
             "/data=/iid/standardized={standardized}/n={n}/seed={replicate}.csv"
    script:
        "../scripts/utils/standardize.R"

rule copy_fixed_data:
    input:        
        "resources/data/mydatasets/{filename}" # this ensures that the file exists and is copied again if changed.
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/parameters=/None/data=/fixed/filename={filename}/n={n}/seed={replicate}.csv"
    shell:
        "cp {input} {output.data}"

rule sample_data_fixed_bnfit:
    input:
        "workflow/scripts/data_sampling/sample_from_bnlearn_bn.R",
        bn="resources/parameters/myparams/bn.fit_networks/{bn}"        
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/parameters=/bn.fit_networks/{bn}/data=/iid/n={n}/seed={replicate}.csv"
    shell:
        "Rscript workflow/scripts/data_sampling/sample_from_bnlearn_bn.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

"""
This for the case when te sem parameters are gicen as a matrix in 
a .csv file in bn/sem_params.
"""
rule sample_fixed_sem_params_data:
    input:        
        bn="resources/parameters/myparams/sem_params/{bn}"        
    output:
        data="{output_dir}/data/" \
             "adjmat=/{adjmat}/" \
             "parameters=/{bn}/" \
             "data=/iid/n={n}/seed={replicate}.csv"
    container:
        docker_image("bidag")
    script:
        "../scripts/data_sampling/sample_sem_data.R" 

if "sem_params" in pattern_strings:
    rule sample_sem_data:
        input:
            script="workflow/scripts/data_sampling/sample_sem_data.R",
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
            "../scripts/data_sampling/sample_sem_data.R" 