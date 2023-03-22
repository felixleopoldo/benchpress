rule sklearn_glasso:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("sklearn_glasso"),
        time=alg_output_time_path("sklearn_glasso"),
        ntests=touch(alg_output_ntests_path("sklearn_glasso"))
    container:
        "docker://bpimages/datascience-python"
    script:
        "sklearn_glasso.py"