rule sample_adjmat_cta:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_cta"] + "/seed={replicate}.csv"
    container:
        "docker://bpimages/trilearn:2.0.2-arm64"
    shell:
        "python workflow/rules/graph/trilearn_cta/trilearn_sample_cta.py {output.adjmat} {wildcards.replicate} {wildcards.order} {wildcards.alpha} {wildcards.beta} "
