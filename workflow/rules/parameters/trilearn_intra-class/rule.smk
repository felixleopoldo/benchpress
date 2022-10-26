if "trilearn_intra-class" in pattern_strings:
    rule intra_class_cov:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            params = "{output_dir}/parameters/" + \
                    pattern_strings["trilearn_intra-class"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("trilearn")
        shell:
            "python2 workflow/scripts/parameters_sampling/trilearn_g_intra_class_cov.py {input.adjmat} {output.params} {wildcards.rho} {wildcards.sigma2}"
