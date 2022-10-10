def pairs():
    ret = [[expand("{output_dir}/pairs/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "seed={seed}"
            ".png",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
    return ret

rule plot_pairs:
    input:
        "workflow/scripts/utils/pairs.R",
        data=summarise_alg_input_data_path()
    output:
        filename="{output_dir}/pairs/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.png",
    params:
        data="Graph:\n{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}"
    script:
        "../scripts/utils/pairs.R"

rule ggally_ggpairs:
    input:
        "workflow/scripts/utils/pairs.R",
        pairsplots=pairs() # This will not trigger the rule if these files have already been generated.
    output:
        temp(touch("results/output/ggally_ggpairs/ggally_ggpairs.done"))
    run:
        for i,f in enumerate(input.pairsplots):
            shell("cp "+f+" results/output/ggally_ggpairs/pairs_" +str(i+1) +".png")