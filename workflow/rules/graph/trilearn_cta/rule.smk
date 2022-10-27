if "trilearn_cta" in pattern_strings:
    rule sample_adjmat_cta:
        output:
            adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_cta"] + "/seed={replicate}.csv"
        container:
            docker_image("trilearn")
        shell:
            "python2 workflow/scripts/graph_sampling/trilearn_sample_cta.py {output.adjmat} {wildcards.replicate} {wildcards.order} {wildcards.alpha} {wildcards.beta} "
