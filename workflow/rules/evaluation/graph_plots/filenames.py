
def bnlearn_graphvizcompare_plots(filename="graphvizcompare",ext="pdf"):
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/" + \
            filename + "." + ext,
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string="graphvizcompare/layout=True",
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"]) if sim_setup["graph_id"] != None]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                 if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]["ids"]]
            for alg in active_algorithms("graph_plots")]
    return ret

def adjmat_diffplots(filename="adjmat_diffplot",ext="png"):
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/" + \
            filename + "." + ext,
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string="adjmat_diffplot",
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"]) if sim_setup["graph_id"] != None]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]["ids"]]
            for alg in active_algorithms("graph_plots")]
    return ret


def adjmat_plots():
    ret = [[[[expand("{output_dir}/adjmat_estimate/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}/"
            "adjmat.png",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]["ids"]]
            for alg in active_algorithms("graph_plots")]
    return ret


def adjmats():

    ret = [[[[expand("{output_dir}/adjmat_estimate/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}/"
            "adjmat.csv",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]["ids"]]
            for alg in active_algorithms("graph_plots")]
    return ret

def graph_plots():
    ret = [[[[expand("{output_dir}/graph_plot/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\
            "seed={seed}.png",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg]
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]["ids"]]
            for alg in active_algorithms("graph_plots")]
    return ret