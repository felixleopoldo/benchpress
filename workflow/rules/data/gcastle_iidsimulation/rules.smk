


"""
This rule is for the case when te sem parameters are given as a matrix in 
a .csv file in resources/parameters/myparams/sem_params.
"""
rule sample_fixed_sem_params_data_gcastle:
    input:        
        params="resources/parameters/myparams/{bn}"        
    output:
        data="{output_dir}/data/" \
             "adjmat=/{adjmat}/" \
             "parameters=/{bn}/" \
             "data=/gcastle_iidsimulation/" \
             "method={method}/" \
             "sem_type={sem_type}/" \
             "noise_scale={noise_scale}/" \
             "n={n}/" \
             "seed={seed}.csv"
    container:
        docker_image("gcastle")
    script:
        "../scripts/data_sampling/gcastle_iidsimulation.py" 


if "sem_params" in pattern_strings:
    rule gcastle_iidsimulation:
        input:
            script="workflow/scripts/data_sampling/gcastle_iidsimulation.py",
            params="{output_dir}/parameters/"+pattern_strings["sem_params"]+"/adjmat=/{adjmat}.csv"
        output:
            data="{output_dir}/data" \
                "/adjmat=/{adjmat}"\
                "/parameters=/" + pattern_strings["sem_params"] + "/" \
                "data=/gcastle_iidsimulation/" \
                "method={method}/" \
                "sem_type={sem_type}/" \
                "noise_scale={noise_scale}/" \
                "n={n}/" \
                "seed={seed}.csv"
        container:
            docker_image("gcastle")
        script:
            "../scripts/data_sampling/gcastle_iidsimulation.py" 