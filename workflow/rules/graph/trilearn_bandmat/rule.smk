rule trilearn_bandmat:
    output:
        adjmat = "{output_dir}/adjmat/" + pattern_strings["trilearn_bandmat"] + "/seed={replicate}.csv"
    container:
        "docker://bpimages/trilearn:2.0.1"
    shell:
        "python workflow/rules/graph/trilearn_bandmat/trilearn_gen_bandmat.py {output.adjmat} {wildcards.replicate} {wildcards.dim} {wildcards.bandwidth}"
