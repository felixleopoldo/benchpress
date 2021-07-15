
def summarise_alg_input_adjmat_est_path(algorithm):
    return "{output_dir}/adjmat_estimate/"\
            "adjmat=/{adjmat}/"\
            "parameters=/{bn}/"\
            "data=/{data}/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "seed={replicate}/" \
            "adjmat.csv"

def adjmat_estimate_path_mcmc(algorithm):
    ret = "{output_dir}/adjmat_estimate/"\
                        "adjmat=/{adjmat}/"\
                        "parameters=/{bn}/"\
                        "data=/{data}/"\ 
                        "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/" \
                        "seed={replicate}/" \
                        "adjmat.csv"
    return ret

def alg_output_seqgraph_path_fine_match(algorithm):
    return "{output_dir}/adjvecs/"\
                "adjmat=/{adjmat}/"\
                "parameters=/{bn}/"\
                "data=/{data}/"\ 
                "algorithm=/" + pattern_strings[algorithm] + "/"  + \
                "seed={replicate}/" \
                "adjvecs.csv"


def alg_output_seqgraph_path(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
               "algorithm=/" + pattern_strings[algorithm] + "/"  + \
               "seed={replicate}/" \
               "adjvecs.csv"
 
def alg_output_adjmat_path(algorithm):
    return "{output_dir}/adjmat_estimate/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "adjmat.csv"

def alg_output_time_path(algorithm):
    return "{output_dir}/time/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "time.txt"
def alg_input_data():
    return "{output_dir}/data/{data}/seed={replicate}.csv"

def time_path(algorithm):
    ret = "{output_dir}/time/"\
                    "adjmat=/{adjmat}/"\
                    "parameters=/{bn}/"\
                    "data=/{data}/"\
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"
    return ret

def summarise_alg_input_time_path(algorithm):
    return "{output_dir}/time/"\
                    "adjmat=/{adjmat}/"\
                    "parameters=/{bn}/"\
                    "data=/{data}/" \ 
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"

def summarise_alg_output_res_path(algorithm):
    return "{output_dir}/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "adjmat=/{adjmat}/"\
            "parameters=/{bn}/"\
            "data=/{data}/"\
            "seed={replicate}/" \
            "id={id}/" \        
            "result.csv"
    # this seed belongs to data actually, and gets stripped from data after.
    # this is a build in hack to allow for fixed data, I think..

def result_path_mcmc(algorithm):
    res = "{output_dir}/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/"\
            "adjmat=/{adjmat}/"\
            "parameters=/{bn}/"\
            "data=/{data}/"\           
            "seed={replicate}/" \
            "id={id}/" \             
            "result.csv"
    return res

def data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.csv"

def adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv",

def get_seed_range(seed_range):
    if seed_range == None:
        return [1]
    else:
        return range(seed_range[0], seed_range[1]+1)

def join_string_sampled_model(algorithm, mode="result"):
    """ This is the main string for a benchmark.

    TOOD: Should contain evaluation=/{eval_param}
    where eval_param is e.g. SHD/ or TPR/graphtype=skeleton FPR/graphtype=cpdag.
    Create rule for roc
    """
    roc_alg_ids = [roc_dict for roc_dict in config["benchmark_setup"]["evaluation"]["roc"]["ids"]]
    
    ret = [[[expand("{output_dir}/"+mode+"/"\        
            "algorithm=/{alg_string}/"
            "adjmat=/{adjmat_string}/"
            "parameters=/{param_string}/"
            "data=/{data_string}/"
            "id={id}/" \        
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
            for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in roc_alg_ids]
    return ret

def join_summaries_shell(algorithm):
    return "sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

def join_summaries_output(algorithm):
    return "{output_dir}/output/roc/"+algorithm+".csv"

def gen_model_strings_from_conf(models, seed, setup):
    """
    Generate the graphs and paremeters simulatnepusly since we do not want 
    every combiantion of graphs and paramters.
    Maybe this should be part of the setup? -No, this part belongs to the method step, 
    not the model/data simulation step.
    There are 3 steps.
    1. Specify the models.
    2. Generate data sets from the models.
    3. Run a nunmber of structure learningn algortithms on th dataset.
    """
    pass

def gen_evaluation_string_from_conf(method, alg_id):
    eval_dict = next(item for item in config["benchmark_setup"]["evaluation"][method] if item["id"] == alg_id)
    return expand(pattern_strings[method], **eval_dict)

def gen_adjmat_string_from_conf(adjmat_id, seed):
    # find the adjmat_gen_method from adjmat_gen_id
    # Maybe fill up a dict as for structure learning algortihms
    # Then we would loose the seed.
    
    if adjmat_id in [c["id"] for c in config["resources"]["graph"]["pcalg_randdag"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["pcalg_randdag"] if item["id"] == adjmat_id)
        return expand(pattern_strings["pcalg_randdag"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["trilearn_cta"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["trilearn_cta"] if item["id"] == adjmat_id)
        return expand(pattern_strings["trilearn_cta"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["bandmat"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["bandmat"] if item["id"] == adjmat_id)
        return expand(pattern_strings["bandmat"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["rand_bandmat"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["rand_bandmat"] if item["id"] == adjmat_id)
        return expand(pattern_strings["rand_bandmat"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id is not None and Path("resources/adjmat/myadjmats/"+adjmat_id).is_file():
        filename_no_ext = os.path.splitext(os.path.basename(adjmat_id))[0]
        return  "myadjmats/" + filename_no_ext # this could be hepar2.csv e.g.

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["bdgraph_graphsim"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["bdgraph_graphsim"] if item["id"] == adjmat_id)
        return expand(pattern_strings["bdgraph_graphsim"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id is None:
        return None

def gen_parameter_string_from_conf(gen_method_id, seed):
    if gen_method_id in [c["id"] for c in config["resources"]["parameters"]["bin_bn"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["bin_bn"] if item["id"] == gen_method_id)
        return expand(pattern_strings["bin_bn"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["bdgraph_rgwish"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["bdgraph_rgwish"] if item["id"] == gen_method_id)
        return expand(pattern_strings["bdgraph_rgwish"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["sem_params"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["sem_params"] if item["id"] == gen_method_id)
        return expand(pattern_strings["sem_params"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["trilearn_hyper-dir"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["trilearn_hyper-dir"] if item["id"] == gen_method_id)
        return expand(pattern_strings["trilearn_hyper-dir"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["trilearn_intra-class"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["trilearn_intra-class"] if item["id"] == gen_method_id)
        return expand(pattern_strings["trilearn_intra-class"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["trilearn_g_inv_wishart"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["trilearn_g_inv_wishart"] if item["id"] == gen_method_id)
        return expand(pattern_strings["trilearn_g_inv_wishart"] + "/seed={seed}", **curconf, seed=seed)

    elif Path("resources/parameters/myparams/bn.fit_networks/"+str(gen_method_id)).is_file():
        return  "bn.fit_networks/" + gen_method_id # gen_method_id could be hepar2.rds e.g.

    elif Path("resources/parameters/myparams/sem_params/"+str(gen_method_id)).is_file():
        return  "sem_params/" + gen_method_id # gen_method_id could be hepar2.rds e.g.

    elif gen_method_id is None:
        return None

def gen_data_string_from_conf(data_id, seed,seed_in_path=True):
    if Path("resources/data/mydatasets/"+data_id).is_file():
        return "fixed" + \
            "/filename="+data_id + \
            "/n="+str(None) + \ 
            "/seed="+str(seed) 

    elif Path("resources/data/mydatasets/"+data_id).exists():        
        paths = Path("resources/data/mydatasets/").glob(data_id+'/*.csv')
        files = [x.name for x in paths if x.is_file()]

        return ["fixed" + \
                "/filename="+data_id + "/"+ f + \
                "/n="+str(None) + \ 
                "/seed="+str(seed) for f in files]

    elif data_id in [c["id"] for c in config["resources"]["data"]["iid"]]:
        # Find the data entry from the resources
        data = next(item for item in config["resources"]["data"]["iid"] if item["id"] == data_id)
        if seed_in_path:
            return expand("iid" +\
                            "/standardized={standardized}" + \ 
                            "/n={n}" + \
                            "/seed={seed}", 
                            n = data["sample_sizes"],
                            standardized = data["standardized"],
                            seed = seed)
        else:
            return expand("iid" +\
                        "/standardized={standardized}" + \ 
                            "/n={n}",
                            standardized = data["standardized"],
                            n = data["sample_sizes"])

def active_algorithm_files(wildcards):
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    
    algs = active_algorithms()
    alg_filenames = ["results/output/roc/" + alg + ".csv" for alg in algs]
    
    return alg_filenames

def active_algorithms(eval_method="roc"):
    with open(configfilename) as json_file:
        conf = json.load(json_file)

    algs = []
    if eval_method == "mcmc_traj_plots" or eval_method == "mcmc_autocorr_plots" or eval_method == "mcmc_heatmaps":
        roc_alg_ids = [roc_dict["id"] for roc_dict in config["benchmark_setup"]["evaluation"][eval_method]]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
            for alg_conf_id in roc_alg_ids:        
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                        algs.append( alg )
    elif eval_method == "roc":
        roc_alg_ids = config["benchmark_setup"]["evaluation"]["roc"]["ids"]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
            for alg_conf_id in roc_alg_ids:        
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                        algs.append( alg )
    else:
        roc_alg_ids = [roc_dict for roc_dict in config["benchmark_setup"]["evaluation"][eval_method]]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
            for alg_conf_id in roc_alg_ids:        
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                        algs.append( alg )

    return algs



def summarise_alg_input_data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.csv"

def summarise_alg_input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv" 


