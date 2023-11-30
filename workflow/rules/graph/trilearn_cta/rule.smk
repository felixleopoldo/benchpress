rule sample_adjmat_cta:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_cta"] + "/seed={seed}.csv"
    container:
        "docker://bpimages/trilearn:2.0.4.0"
    shell:
        "python workflow/rules/graph/trilearn_cta/trilearn_sample_cta.py {output.adjmat} {wildcards.seed} {wildcards.order} {wildcards.alpha} {wildcards.beta} "
