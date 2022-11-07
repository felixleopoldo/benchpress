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
             "data=/gcastle_iidsim/" \
             "method={method}/" \
             "sem_type={sem_type}/" \
             "noise_scale={noise_scale}/" \
             "n={n}/" \
             "seed={seed}.csv"
    container:
        docker_image("gcastle")
    script:
        "gcastle_iidsim.py" 


if "sem_params" in pattern_strings:
    rule gcastle_iidsim:
        input:            
            params="{output_dir}/parameters/"+pattern_strings["sem_params"]+"/adjmat=/{adjmat}.csv"
        output:
            data="{output_dir}/data" \
                "/adjmat=/{adjmat}"\
                "/parameters=/" + pattern_strings["sem_params"] + "/" \
                "data=/gcastle_iidsim/" \
                "method={method}/" \
                "sem_type={sem_type}/" \
                "noise_scale={noise_scale}/" \
                "n={n}/" \
                "seed={seed}.csv"
        container:
            docker_image("gcastle")
        script:
            "gcastle_iidsim.py" 