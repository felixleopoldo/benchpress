
rule trilearn_rand_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_rand_bandmat"] + "/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python2 workflow/rules/graph/trilearn_rand_bandmat/trilearn_rand_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.max_bandwidth}"
