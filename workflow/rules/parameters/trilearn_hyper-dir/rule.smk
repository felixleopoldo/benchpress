rule trilearn_hyper_dir:
    input:
        "workflow/rules/parameters/trilearn_hyper-dir/trilearn_sample_hyper-dir.py",
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn =    "{output_dir}/parameters/" + \
                pattern_strings["trilearn_hyper-dir"] + "/" \
                "seed={seed}/"+\
                "adjmat=/{adjmat}.json"
    container:
        "docker://bpimages/trilearn:2.0.4.0"
    shell:
        "python workflow/rules/parameters/trilearn_hyper-dir/trilearn_sample_hyper-dir.py {output.bn} {wildcards.seed} {wildcards.n_levels} {wildcards.pseudo_obs} {input.adjmat}" 
