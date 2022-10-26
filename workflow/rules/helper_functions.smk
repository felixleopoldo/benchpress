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




