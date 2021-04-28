

rule sample_bindata:
    input:
        bn="{output_dir}/bn/generateBinaryBN/{bn}/adjmat=/{adjmat}.rds"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/generateBinaryBN/{bn}"\
             "/data=/standard_sampling/n={n}/seed={replicate}.csv"
    shell:
        "Rscript workflow/scripts/sample_data_with_range_header.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

rule sample_loglindata:
    input:
        bn="{output_dir}/bn/hyper-dir/{bn}/adjmat=/{adjmat}.json"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/hyper-dir/{bn}"\
             "/data=/standard_sampling/n={n}/seed={replicate}.csv"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/trilearn/sample_loglin_data.py {wildcards.replicate}  {input.bn} {output.data} {wildcards.n}"

rule sample_intra_class_data:
    input:
        "workflow/scripts/trilearn/sample_mvn_data.py",
        cov="{output_dir}/bn/intra-class/{bn}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/intra-class/{bn}"\
             "/data=/standard_sampling/n={n}/seed={replicate}.csv"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/trilearn/sample_mvn_data.py  {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

rule sample_g_inverse_wishart:
    input:
        "workflow/scripts/trilearn/sample_mvn_data.py",
        cov="{output_dir}/bn/g_inv_wishart/{bn}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/g_inv_wishart/{bn}"\
             "/data=/standard_sampling/n={n}/seed={replicate}.csv"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/trilearn/sample_mvn_data.py {input.cov} {output.data} {wildcards.n} {wildcards.replicate}"

rule standardize:
    input:
        data="{output_dir}/data" \
             "/{model}"\
             "/data=/standard_sampling/n={n}/seed={replicate}.csv"
    output:
        data="{output_dir}/data" \
             "/{model}"\
             "/data=/standard_sampling/standardized={standardized}/n={n}/seed={replicate}.csv"
    script:
        "../scripts/standardize.R"

rule copy_fixed_data:
    input:
        "{output_dir}/data/mydatasets/{filename}" # this ensures that the file exists and is copied again if changed.
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/bn=/None/data=/fixed/filename={filename}/n={n}/seed={replicate}.csv"
    shell:\
        "mkdir -p {wildcards.output_dir}/data/adjmat=/{wildcards.adjmat}/bn=/None/data=/fixed/filename={wildcards.filename}/n={wildcards.n} && "\
        "cp {input} {output.data}"

rule sample_bnfit_data:
    input:
        "workflow/scripts/sample_from_bnlearn_bn.R",
        bn="{output_dir}/bn/bn.fit_networks/{bn}"        
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/bn=/bn.fit_networks/{bn}/data=/standard_sampling/n={n}/seed={replicate}.csv"
    shell:
        "Rscript workflow/scripts/sample_from_bnlearn_bn.R " \
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
        bn="{output_dir}/bn/sem_params/{bn}"        
    output:
        data="{output_dir}/data/" \
             "adjmat=/{adjmat}/" \
             "bn=/sem_params/{bn}/" \
             "data=/standard_sampling/n={n}/seed={replicate}.csv"
    singularity:
        docker_image("bidag")
    script:
        "../scripts/sample_pcalg_sem_data.R" 

rule sample_pcalg_sem_data:
    input:
        script="workflow/scripts/sample_pcalg_sem_data.R",
        bn="{output_dir}/bn/"+pattern_strings["pcalg_sem_params"]+"/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/" + pattern_strings["pcalg_sem_params"] + "/" \
             "data=/standard_sampling/" \
             "n={n}/" \
             "seed={replicate}.csv"
    singularity:
        docker_image("bidag")
    script:
        "../scripts/sample_pcalg_sem_data.R" 