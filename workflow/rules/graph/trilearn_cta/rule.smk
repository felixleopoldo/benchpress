rule sample_adjmat_cta:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_cta"] + "/seed={replicate}.csv"
    container:
        "docker://onceltuca/trilearn:1.25"
    shell:
        "python2 workflow/rules/graph/trilearn_cta/trilearn_sample_cta.py {output.adjmat} {wildcards.replicate} {wildcards.order} {wildcards.alpha} {wildcards.beta} "
