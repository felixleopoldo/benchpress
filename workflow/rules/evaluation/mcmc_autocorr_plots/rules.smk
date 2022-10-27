
def processed_trajs(mcmc_module):
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/id={id}/"\
            "seed={seed}/"\
            "processed_graphtraj.csv",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf, # contains e.g. id
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf(mcmc_module, alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in [mcmc_traj_conf["id"] for mcmc_traj_conf in config["benchmark_setup"]["evaluation"][mcmc_module]
                                                            if ("active" not in mcmc_traj_conf) or (mcmc_traj_conf["active"] == True)] ]
            for alg in active_algorithms(mcmc_module)]

    return ret


def autocorr_plots():
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "autocorr_plot.png",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf("mcmc_autocorr_plots", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in [conf["id"] for conf in config["benchmark_setup"]["evaluation"]["mcmc_autocorr_plots"]
                                                    if ("active" not in conf) or (conf["active"] == True)] ]
            for alg in active_algorithms("mcmc_autocorr_plots")]
    return ret

# Only get the pattern strings for the actual mcmc algorithms
mcmc_alg_ids = set()

for mcmc_dict in config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"]:
    # get the actual conf

    alg_conf = None
    curalg = None
    for alg, algconfs in config["resources"]["structure_learning_algorithms"].items():
        mcmc_alg_ids.add(alg)
# Create adapted anonymous MCMC rules where the algorithm parameters are matched.
for algid in mcmc_alg_ids:
    if algid in ["bidag_order_mcmc", "parallelDG", "trilearn_pgibbs", "gg99_singlepair", "gt13_multipair"]:

        # Auto correlations
        rule:
            input:
                "workflow/scripts/evaluation/write_graph_traj.py",
                traj="{output_dir}/"\
                "evaluation=/" + pattern_strings["mcmc_traj_plots"] + "/"\
                "adjmat=/{adjmat_string}/"\
                "parameters=/{param_string}/"\
                "data=/{data_string}/"\
                "algorithm=/"+pattern_strings[algid]+"/id={id}/"\
                "seed={seed}/" \
                "processed_graphtraj.csv"
            output:
                traj="{output_dir}/"\
                "evaluation=/" + pattern_strings["mcmc_autocorr_plots"] + "/"\
                "adjmat=/{adjmat_string}/"\
                "parameters=/{param_string}/"\
                "data=/{data_string}/"\
                "algorithm=/"+pattern_strings[algid]+"/id={id}/"\
                "seed={seed}/" \
                "processed_graphtraj.csv"
            params:
                alg=algid, # Maybe this should be matched in the pattern string instead
                data_string="{data_string}",
                adjmat_string="{adjmat_string}",
                param_string="{param_string}",
                alg_string=pattern_strings[algid],
                eval_string=pattern_strings["mcmc_autocorr_plots"]
            container:
                docker_image("networkx")
            script:
                "../scripts/evaluation/write_autocorr_traj.py"

rule mcmc_autocorr_plot:
    input:
         "workflow/scripts/evaluation/plot_autocorr_from_traj.py",
         traj="{output_dir}/adjvecs/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}/"
            "adjvecs.csv"
    output:
        plot="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_autocorr_plots"] + "/" \
        "adjmat=/{adjmat_string}/"\
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\
        "algorithm=/{alg_string}/"\
        "seed={seed}/"
        "autocorr_plot.png"
    params:
        title="Graph: {adjmat_string}\nParameters: {param_string}\nData: {data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        data_string="{data_string}",
        alg_string="{alg_string}"
    container:
        docker_image("networkx")
    script:
        "../scripts/evaluation/plot_autocorr_from_traj.py"

# Joins processed trajs
rule mcmc_autocorr_plots_join_trajs:
    input:
        trajs=processed_trajs("mcmc_autocorr_plots") # should get lag trajs instead?
    output:
        # separate based on the ids
        trajs="results/output/mcmc_autocorr_plots/joined_autocorr.csv" # Lag trajs
    script:
        # First compute the autocorrelation at each lag
        "../scripts/evaluation/join_graph_trajs.py"

# This plots several trajectories in one figure
rule mcmc_autocorr_plots_plot_joined_trajs:
    input:
        configfilename,
        trajs=rules.mcmc_autocorr_plots_join_trajs.output.trajs,
    output:
        joined=touch("results/output/mcmc_autocorr_plots/mcmc_autocorr_plots_joined.done"),
        single=directory("results/output/mcmc_autocorr_plots/single_param_settings"),
        multi=directory("results/output/mcmc_autocorr_plots/multi_param_settings")
    params:
        xlab="Lag"
    container:
        docker_image("pydatascience")
    script:
        "../scripts/evaluation/plot_multi_trajs.py"

rule mcmc_autocorr_plots:
    input:
        configfilename,
        joined=rules.mcmc_autocorr_plots_plot_joined_trajs.output.joined,
        plots=autocorr_plots()
    output:
        touch("results/output/mcmc_autocorr_plots/mcmc_autocorr_plots.done"),
        dir=directory("results/output/mcmc_autocorr_plots/induvidual")
    run:
        for i,f in enumerate(input.plots):
            shell("mkdir -p {output.dir} && cp "+f+" {output.dir}/mcmc_autocorr_" +str(i+1) +".png")
