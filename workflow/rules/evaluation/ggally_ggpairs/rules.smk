include: "filename_gen.py"

rule plot_pairs:
    input:
        data=summarise_alg_input_data_path()
    output:
        filename="{output_dir}/pairs/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={seed}.png",
    params:
        data="Graph:\n{adjmat}/parameters=/{bn}/data=/{data}/seed={seed}"
    script:
        "pairs.R"

for bmark_setup in config["benchmark_setup"]:
    bmark_setup_title = bmark_setup["title"]
    if "ggally_ggpairs" in bmark_setup["evaluation"]:
        rule:
            name: 
                "ggally_ggpairs_"+bmark_setup_title
            input:
                "workflow/rules/evaluation/ggally_ggpairs/pairs.R",
                pairsplots=pairs(bmark_setup) # This will not trigger the rule if these files have already been generated.
            output:
                temp(touch("results/output/"+bmark_setup_title+"/ggally_ggpairs/ggally_ggpairs.done"))
            params:
                bmark_setup=bmark_setup_title
            run:
                for i,f in enumerate(input.pairsplots):
                    shell("cp "+f+" results/output/{params.bmark_setup}/ggally_ggpairs/pairs_" +str(i+1) +".png")