
rule trilearn_rand_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_rand_bandmat"] + "/seed={replicate}.csv"
    container:
        "docker://bpimages/trilearn:2.0.1"
    shell:
        "python workflow/rules/graph/trilearn_rand_bandmat/trilearn_rand_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.max_bandwidth}"
