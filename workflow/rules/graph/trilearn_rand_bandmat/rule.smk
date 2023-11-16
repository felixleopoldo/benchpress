
rule trilearn_rand_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_rand_bandmat"] + "/seed={seed}.csv"
    container:
        "docker://bpimages/trilearn:2.0.3"
    shell:
        "python workflow/rules/graph/trilearn_rand_bandmat/trilearn_rand_bandmat.py {output.adjmat} {wildcards.seed} {wildcards.dim} {wildcards.max_bandwidth}"
