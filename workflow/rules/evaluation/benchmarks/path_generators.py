def join_string_sampled_model(algorithm, mode="result"):
    """ This is the main string for a benchmark.

    TOOD: Should contain evaluation=/{eval_param}
    where eval_param is e.g. SHD/ or TPR/graphtype=skeleton FPR/graphtype=cpdag.
    Create rule for benchmarks
    """

    benchmarks_alg_ids = [benchmarks_dict for benchmarks_dict in config["benchmark_setup"]["evaluation"]["benchmarks"]["ids"]]

    ret = [[[expand("{output_dir}/"+mode+"/"
            "algorithm=/{alg_string}/"
            "adjmat=/{adjmat_string}/"
            "parameters=/{param_string}/"
            "data=/{data_string}/"
            "id={id}/"
            + mode + ".csv",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in benchmarks_alg_ids]
    return ret

# TODO: These should take a pattern string instead of an algorithm.
def summarise_alg_input_adjmat_est_path(algorithm):
    return ("{output_dir}/adjmat_estimate/"
            "adjmat=/{adjmat}/"
            "parameters=/{bn}/"
            "data=/{data}/"
            "algorithm=/" + pattern_strings[algorithm] + "/"
            "seed={seed}/"
            "adjmat.csv")

def summarise_alg_input_time_path(algorithm):
    return ("{output_dir}/time/"
            "adjmat=/{adjmat}/"
            "parameters=/{bn}/"
            "data=/{data}/"
            "algorithm=/" + pattern_strings[algorithm] + "/"
            "seed={seed}/"
            "time.txt")

# This is code repetition, yes...
def summarise_alg_input_ntests_path(algorithm):
    return ("{output_dir}/ntests/"
            "adjmat=/{adjmat}/"
            "parameters=/{bn}/"
            "data=/{data}/"
            "algorithm=/" + pattern_strings[algorithm] + "/"
            "seed={seed}/"
            "ntests.txt")

def summarise_alg_output_res_path(algorithm):
    return ("{output_dir}/result/"
            "algorithm=/" + pattern_strings[algorithm] + "/"
            "adjmat=/{adjmat}/"
            "parameters=/{bn}/"
            "data=/{data}/"
            "seed={seed}/"
            "id={id}/"
            "result.csv")
    # this seed belongs to data actually, and gets stripped from data after.
    # this is a build in hack to allow for fixed data, I think..

def join_summaries_shell(algorithm):
    return r"sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

def join_summaries_output(algorithm):
    return "{output_dir}/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +algorithm+".csv"

def summarise_alg_input_data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={seed}.csv"

def summarise_alg_input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv"

def result_path_mcmc(algorithm):
    return ("{output_dir}/result/"
            "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/"
            "adjmat=/{adjmat}/"
            "parameters=/{bn}/"
            "data=/{data}/"
            "seed={seed}/"
            "id={id}/"
            "result.csv")

