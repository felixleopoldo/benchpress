rule trilearn_g_inv_wishart:
    input:
        "workflow/rules/parameters/trilearn_g_in_wishart/trilearn_g_inv_wishart_cov.py",
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        params = "{output_dir}/parameters/" + \
                pattern_strings["trilearn_g_inv_wishart"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.csv"
    container:
        "docker://bpimages/trilearn:1.25"
    shell:
        "python workflow/rules/parameters/trilearn_g_in_wishart/trilearn_g_inv_wishart_cov.py {input.adjmat} {output.params} {wildcards.dof} {wildcards.seed}"
