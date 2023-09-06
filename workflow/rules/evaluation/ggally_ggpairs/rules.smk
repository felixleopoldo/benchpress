include: "filename_gen.py"

rule plot_pairs:
    input:
        data=summarise_alg_input_data_path()
    output:
        filename="{output_dir}/pairs/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.png",
    params:
        data="Graph:\n{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}"
    container:
        "docker://bpimages/ggally:2.1.2"
    script:
        "pairs.R"

rule ggally_ggpairs:
    input:
        "workflow/rules/evaluation/ggally_ggpairs/pairs.R",
        pairsplots=pairs() # This will not trigger the rule if these files have already been generated.
    output:
        temp(touch("results/output/ggally_ggpairs/ggally_ggpairs.done"))
    run:
        for i,f in enumerate(input.pairsplots):
            shell("cp "+f+" results/output/ggally_ggpairs/pairs_" +str(i+1) +".png")