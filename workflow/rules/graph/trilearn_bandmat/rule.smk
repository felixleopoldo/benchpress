rule gen_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["bandmat"] + "/seed={replicate}.csv"
    container:
        docker_image("trilearn")
    shell:
        "python2 workflow/rules/graph/trilearn_bandmat/trilearn_gen_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.bandwidth}"
