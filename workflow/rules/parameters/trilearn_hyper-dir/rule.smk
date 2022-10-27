if "trilearn_hyper-dir" in pattern_strings:
    rule hyper_dir:
        input:
            adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
        output:
            bn =    "{output_dir}/parameters/" + \
                    pattern_strings["trilearn_hyper-dir"] + "/" \
                    "seed={seed}/"+\
                    "adjmat=/{adjmat}.json"
        container:
            docker_image("trilearn")
        shell:
            "python workflow/scripts/parameters_sampling/trilearn_sample_hyper-dir.py {output.bn} {wildcards.seed} {wildcards.n_levels} {wildcards.pseudo_obs} {input.adjmat}" 
