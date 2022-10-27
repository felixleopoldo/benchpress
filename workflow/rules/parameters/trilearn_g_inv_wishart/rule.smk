if "trilearn_g_inv_wishart" in pattern_strings:
    rule trilearn_g_inv_wishart:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            params = "{output_dir}/parameters/" + \
                    pattern_strings["trilearn_g_inv_wishart"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.csv"
        container:
            docker_image("trilearn")
        shell:
            "python workflow/scripts/parameters_sampling/trilearn_g_inv_wishart_cov.py {input.adjmat} {output.params} {wildcards.dof} {wildcards.seed}"