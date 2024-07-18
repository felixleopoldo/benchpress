
def heatmap_plots(bmark_setup):
    ret = {}
    ret["heatmap_plot"] = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/" + \
            "heatmap_plot.png",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf(bmark_setup, "mcmc_heatmaps", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in bmark_setup["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in [conf["id"] for conf in bmark_setup["evaluation"]["mcmc_heatmaps"]
                                                    if ("active" not in conf) or (conf["active"] == True)] ]
            for alg in active_algorithms(bmark_setup, "mcmc_heatmaps")]
    return ret

rule mcmc_heatmap_plot:
    input:
        traj="{output_dir}/adjvecs/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}/"\
            "adjvecs.csv"
    output:
        heatmap_plot="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_heatmaps"] + "/" \
        "adjmat=/{adjmat_string}/"\
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\
        "algorithm=/{alg_string}/"\
        "seed={seed}/"
        "heatmap_plot.png",
        # the graph is also saved in the script. Didnt manage to put it as an output
    params:
        data_string="{data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        alg_string="{alg_string}",
        burnin_frac="{burn_in}"
    container:
        docker_image("trilearn")
    script:
        "plot_heatmap_from_graphtraj.py"

# TODO:
rule mcmc_heatmap_csv:
    input:
        traj="{output_dir}/adjvecs/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}/"\
            "adjvecs.csv"
    output:
        heatmap_plot="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_heatmaps"] + "/" \
        "adjmat=/{adjmat_string}/"\
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\
        "algorithm=/{alg_string}/"\
        "seed={seed}/"
        "heatmap.csv",
        # the graph is also saved in the script. Didnt manage to put it as an output
    params:
        burnin_frac="{burn_in}"
    container:
        docker_image("trilearn")
    script:
        "plot_heatmap_from_graphtraj.py"



for bmark_setup in config["benchmark_setup"]:
    rule:
        name:
            "mcmc_heatmaps_"+bmark_setup["title"]
        input:    
            configfilename,
            **heatmap_plots(bmark_setup)
        output:
            touch("results/output/"+bmark_setup["title"]+"/mcmc_heatmaps/mcmc_heatmaps.done")
        run:    
            output_dir = "results/output/"+bmark_setup["title"]+"/mcmc_heatmaps/heatmaps"        
            if Path(output_dir + "/heatmaps").exists():
                # remove all files in the directory
                [f.unlink() for f in Path(output_dir + "/heatmaps").glob("*.png") ]

            if Path(output_dir+"/heatgraphs").exists():
                # remove all files in the directory
                [f.unlink() for f in Path(output_dir + "/heatgraphs").glob("*.png") ]
            
            shell("mkdir -p results/output/"+bmark_setup["title"]+"/mcmc_heatmaps/heatgraphs")
            shell("mkdir -p  results/output/"+bmark_setup["title"]+"/mcmc_heatmaps/heatmaps")
            # remove content if already exists using pathlib

            for i,f in enumerate(input.heatmap_plot):
                shell("cp "+f+" results/output/"+bmark_setup["title"]+"/mcmc_heatmaps/heatmaps/heatmap_" +str(i+1) +".png")
                shell("cp "+f+"-graph.png results/output/"+bmark_setup["title"]+"/mcmc_heatmaps/heatgraphs/heatgraph_" +str(i+1) +".png")
