
def heatmap_plots():
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "heatmap_plot.png",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf("mcmc_heatmaps", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in [conf["id"] for conf in config["benchmark_setup"]["evaluation"]["mcmc_heatmaps"]
                                                    if ("active" not in conf) or (conf["active"] == True)] ]
            for alg in active_algorithms("mcmc_heatmaps")]
    return ret


rule mcmc_heatmap_plot:
    input:
        "workflow/scripts/evaluation/plot_heatmap_from_graphtraj.py",
        traj="{output_dir}/adjvecs/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}/"\
            "adjvecs.csv"
    output:
        filename="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_heatmaps"] + "/" \
        "adjmat=/{adjmat_string}/"\
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\
        "algorithm=/{alg_string}/"\
        "seed={seed}/"
        "heatmap_plot.png"
    params:
        data_string="{data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        alg_string="{alg_string}"
    container:
        docker_image("networkx")
    script:
        "../scripts/evaluation/plot_heatmap_from_graphtraj.py"


rule mcmc_heatmaps:
    input:
        configfilename,
        plots=heatmap_plots()
    output:
        touch("results/output/mcmc_heatmaps/mcmc_heatmaps.done")
    run:
        for i,f in enumerate(input.plots):
            shell("cp "+f+" results/output/mcmc_heatmaps/heatmap_" +str(i+1) +".png")

