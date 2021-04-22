def adjmat_estimate_path_mcmc(algorithm):
    ret = "{output_dir}/adjmat_estimate/"\
                        "adjmat=/{adjmat}/"\
                        "bn=/{bn}/"\
                        "data=/{data}/"\
                        "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/" \
                        "seed={replicate}/" \
                        "adjmat.csv"
    return ret

def alg_output_adjvecs_path(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/"  + \
                "seed={replicate}/" \
                "adjvecs.json"

def alg_output_seqgraph_path(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/"  + \
                "seed={replicate}/" \
                "adjvecs.csv"


def alg_input_data():
    return "{output_dir}/data/{data}/seed={replicate}.csv"

def time_path(algorithm):
    ret = "{output_dir}/time/"\
                    "adjmat=/{adjmat}/"\
                    "bn=/{bn}/"\
                    "data=/{data}/"\
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"
    return ret

def summarise_alg_input_time_path(algorithm):
    return "{output_dir}/time/"\
                    "adjmat=/{adjmat}/"\
                    "bn=/{bn}/"\
                    "data=/{data}/" \ 
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"

def summarise_alg_output_res_path(algorithm):
    return "{output_dir}/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
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
            "bn=/{bn}/"\
            "data=/{data}/"\   
            "seed={replicate}/" \
            "id={id}/" \             
            "result.csv"
    return res

def data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/bn=/{bn}/data=/{data}/seed={replicate}.csv"

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
    roc_alg_ids = [roc_dict for roc_dict in config["benchmark_setup"]["evaluation"]["ROC"]]
    
    ret = [[[expand("{output_dir}/"+mode+"/"\        
            "algorithm=/{alg_string}/"
            "adjmat=/{adjmat_string}/"
            "bn=/{param_string}/"
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
            for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in roc_alg_ids],
    
    # # Every algorithm should have this as output, where the parameters are added to the csv.
    # # A general rule should handle output e.g. SHD or TP, FP...
    # ret = [[[expand("{output_dir}/"
    #         "evaluation=/{evaluation_string}"\
    #         "algorithm=/{alg_string}/"
    #         "adjmat=/{adjmat_string}/"
    #         "bn=/{param_string}/"
    #         "data=/{data_string}/"
    #         + eval_method + ".csv",
    #         output_dir=config["benchmark_setup"]["output_dir"],
    #         alg_string=json_string[alg_conf["id"]],
    #         plot_legend=alg_conf["plot_legend"],
    #         evaluation_string=get_eval_string(eval_method),
    #         adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
    #         param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
    #         data_string=gen_data_string_from_conf(sim_setup["data_id"], seed))
    #         for seed in get_seed_range(sim_setup["seed_range"])]
    #         for sim_setup in config["benchmark_setup"]["data"]]
    #         for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["algorithm_ids"]],
    return ret

def join_summaries_shell(algorithm):
    #    "Rscript scripts/join_csv_files.R --filename {output} --files {input.res} "  \
    return "sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

def join_summaries_output(algorithm):
    return "{output_dir}/"+algorithm+".csv"

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

def gen_adjmat_string_from_conf(adjmat_id, seed):
    # find the adjmat_gen_method from adjmat_gen_id
    # Maybe fill up a dict as for structure learning algortihms
    # Then we would loose the seed.
    
    if adjmat_id in [c["id"] for c in config["resources"]["graph"]["generateDAGMaxParents"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["generateDAGMaxParents"] if item["id"] == adjmat_id)
        return expand(pattern_strings["generateDAGMaxParents"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["cta"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["cta"] if item["id"] == adjmat_id)
        return expand(pattern_strings["cta"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["bandmat"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["bandmat"] if item["id"] == adjmat_id)
        return expand(pattern_strings["bandmat"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["rand_bandmat"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["rand_bandmat"] if item["id"] == adjmat_id)
        return expand(pattern_strings["rand_bandmat"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif Path("resources/adjmat/myadjmats/"+adjmat_id).is_file():
        filename_no_ext = os.path.splitext(os.path.basename(adjmat_id))[0]
        return  "myadjmats/" + filename_no_ext # this could be hepar2.csv e.g.

    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["DAGavparents"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["DAGavparents"] if item["id"] == adjmat_id)
        return expand(pattern_strings["DAGavparents"] + "/seed={seed}", **adjmat_dict, seed=seed)

    elif adjmat_id is None:
        return None

def gen_parameter_string_from_conf(gen_method_id, seed):
    #with open(configfilename) as json_file:
    #    conf = json.load(json_file)

    if gen_method_id in [c["id"] for c in config["resources"]["parameters"]["generateBinaryBN"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["generateBinaryBN"] if item["id"] == gen_method_id)
        return expand(pattern_strings["generateBinaryBN"] + "/seed={seed}", **curconf, seed=seed)
       
    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["pcalg_sem_params"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["pcalg_sem_params"] if item["id"] == gen_method_id)
        return expand(pattern_strings["pcalg_sem_params"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["hyper-dir"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["hyper-dir"] if item["id"] == gen_method_id)
        return expand(pattern_strings["hyper-dir"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["intra-class"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["intra-class"] if item["id"] == gen_method_id)
        return expand(pattern_strings["intra-class"] + "/seed={seed}", **curconf, seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["g_inv_wishart"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["g_inv_wishart"] if item["id"] == gen_method_id)
        return expand(pattern_strings["g_inv_wishart"] + "/seed={seed}", **curconf, seed=seed)

    elif Path("resources/bn/bn.fit_networks/"+str(gen_method_id)).is_file():
        return  "bn.fit_networks/" + gen_method_id # gen_method_id could be hepar2.rds e.g.

    elif Path("resources/bn/sem_params/"+str(gen_method_id)).is_file():
        return  "sem_params/" + gen_method_id # gen_method_id could be hepar2.rds e.g.

    elif gen_method_id is None:
        return None

def gen_data_string_from_conf(data_id, seed,seed_in_path=True):

    if Path("resources/data/mydatasets/"+data_id).is_file():
        return "fixed" + \
            "/filename="+data_id + \
            "/n="+str(None) + \ 
            "/seed="+str(seed) # TODO: this may cause som error with seed somewhere

    elif data_id in [c["id"] for c in config["resources"]["data"]["standard_sampling"]]:
        # Find the data entry from the resources
        data = next(item for item in config["resources"]["data"]["standard_sampling"] if item["id"] == data_id)
        if seed_in_path:
            return expand("standard_sampling" +\
                            "/standardized={standardized}" + \ 
                            "/n={n}" + \
                            "/seed={seed}", 
                            n = data["sample_sizes"],
                            standardized = data["standardized"],
                            seed = seed)
        else:
            return expand("standard_sampling" +\
                        "/standardized={standardized}" + \ 
                            "/n={n}",
                            standardized = data["standardized"],
                            n = data["sample_sizes"])

def active_algorithm_files(wildcards):
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    algs = active_algorithms()
    alg_filenames = ["results/" + alg + ".csv" for alg in algs]
    
    return alg_filenames

def active_algorithms(eval_method="ROC"):
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    algs = []
    roc_alg_ids = [roc_dict for roc_dict in config["benchmark_setup"]["evaluation"][eval_method]]
    for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
        for alg_conf_id in roc_alg_ids:        
            if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append( alg )

    return algs

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

def summarise_alg_input_data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/bn=/{bn}/data=/{data}/seed={replicate}.csv"

def summarise_alg_input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv" 

def summarise_alg_input_adjmat_est_path(algorithm):
    return "{output_dir}/adjmat_estimate/"\
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "seed={replicate}/" \
            "adjmat.csv"

