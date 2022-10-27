if "rand_bandmat" in pattern_strings:
    rule rand_bandmat:
        output:
            adjmat = "{output_dir}/adjmat/" + pattern_strings["rand_bandmat"] + "/seed={replicate}.csv"
        container:
            docker_image("trilearn")
        shell:
            "python2 workflow/scripts/graph_sampling/trilearn_rand_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.max_bandwidth}"
