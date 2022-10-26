# Problem with seeds. The seed is includen in graph, bn and data, but not in algorithm.
# When the order of the data, parameters and data is changed, the seed is lost.
# It use to be matched out from data.

def traj_plots():
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "traj_plot.eps",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf("mcmc_traj_plots", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in [mcmc_traj_conf["id"] for mcmc_traj_conf in config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"]
                                                            if ("active" not in mcmc_traj_conf) or (mcmc_traj_conf["active"] == True)] ]
            for alg in active_algorithms("mcmc_traj_plots")]
    return ret

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

