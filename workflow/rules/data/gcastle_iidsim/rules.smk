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
             "data=/"+pattern_strings["gcastle_iidsim"] + "/" \
             "seed={seed}.csv"
    wildcard_constraints:
        n="[0-9]*",
        bn=".*\.csv"
    container:
        "docker://onceltuca/gcastle:1.0.3"
    script:
        "gcastle_iidsim.py"

rule gcastle_iidsim:
    input:
        params="{output_dir}/parameters/{params}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
            "/adjmat=/{adjmat}"\
            "/parameters=/{params}/" \
            "data=/"+pattern_strings["gcastle_iidsim"] + "/" \
            "seed={seed}.csv"
    wildcard_constraints:
        n="[0-9]*"
    container:
        "docker://onceltuca/gcastle:1.0.3"
    script:
        "gcastle_iidsim.py"