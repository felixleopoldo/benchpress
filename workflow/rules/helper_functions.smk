# A number of code snippets, just to reduce duplication.
# The function names are sometimes a bit misleading.

####  MCMC stuff
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
               "adjvecs_tobecompressed.csv"

def alg_output_seqgraph_path_nocomp(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
               "algorithm=/" + pattern_strings[algorithm] + "/"  + \
               "seed={replicate}/" \
               "adjvecs.csv"

### Standard algorithms 
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

# This is code repetition, yes...
def alg_output_ntests_path(algorithm):
    return "{output_dir}/ntests/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "ntests.txt"

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

def data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.csv"

def adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv",

def get_seed_range(seed_range):
    if seed_range == None:
        return [1]
    else:
        return range(seed_range[0], seed_range[1]+1)


def active_algorithm_files(wildcards):
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    
    algs = active_algorithms()
    alg_filenames = ["results/output/benchmarks/"+conf["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + alg + ".csv" for alg in algs]
    return alg_filenames

def active_algorithms(eval_method="benchmarks"):
    with open(configfilename) as json_file:
        conf = json.load(json_file)

    algs = []
    
    if (eval_method == "mcmc_traj_plots") or (eval_method == "mcmc_autocorr_plots") or (eval_method == "mcmc_heatmaps"):
        benchmarks_alg_ids = [benchmarks_dict["id"]  for benchmarks_dict in config["benchmark_setup"]["evaluation"][eval_method] if benchmarks_dict["active"] == True]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
            for alg_conf_id in benchmarks_alg_ids: 
                #print(alg_conf_id)
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append( alg )
    elif eval_method == "benchmarks":
        benchmarks_alg_ids = config["benchmark_setup"]["evaluation"]["benchmarks"]["ids"]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
            for alg_conf_id in benchmarks_alg_ids:        
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append( alg )
    else:
        benchmarks_alg_ids = [benchmarks_dict for benchmarks_dict in config["benchmark_setup"]["evaluation"][eval_method]]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
            for alg_conf_id in benchmarks_alg_ids:        
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append( alg )
    

    return list(set(algs))




