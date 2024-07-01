# This file essentially defines the pattern strings for all algorithms, 
# 
# 
# TODO: It would be if good one could have different patterns for the same algorithm, 
# so that one could omit some paramters e.g.
#

# This function takes the first element in a JSON object and creates a
# pattern string based on the keys. 
def dict_to_path(d):
    if len(d) == 0:
        return ""

    c = d[0].copy() # take the first element in the list. BUG
    c.pop("id") # remove id from the string as only the parameters should identify the computation.
    if "burnin_frac" in c: 
        c.pop("burnin_frac")
    if "threshold" in c:      
        c.pop("threshold")
    if "mcmc_estimator" in c:      
        c.pop("mcmc_estimator")
    if "active" in c:
        c.pop("active")
    if "standardized" in c:
        c.pop("standardized")
    
    sep = "/"
    # HACK: Should put standardized first if it exists.. 
    tmp = [key+"={"+key+"}" for key, val in c.items()]
    ret = sep.join(tmp)
    return ret

# The pattern strings are generated from the json config file.
def gen_pattern_strings(config):
    
    pattern_strings = {}
    # structure learning algorithms. 
    # May be good to add all since they might be input for other algs.
    for module in config["resources"]["structure_learning_algorithms"]:
        pattern_strings[module] = module+"/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"][module])

    # graph modules
    for module in config["resources"]["graph"]:
        pattern_strings[module] = module + "/" + dict_to_path(config["resources"]["graph"][module])

    # parameters modules
    for module in config["resources"]["parameters"]:
        pattern_strings[module] = module + "/" + dict_to_path(config["resources"]["parameters"][module])

    # data modules
    for module in config["resources"]["data"]:
        pattern_strings[module] = module + "/" + dict_to_path(config["resources"]["data"][module])    

    # Evaluation strings. These have not exactly the same logic as the above, but it works.
    pattern_strings["mcmc_traj_plots"] = "mcmc_traj_plots/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"])
    pattern_strings["mcmc_autocorr_plots"] = "mcmc_autocorr_plots/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_autocorr_plots"])
    pattern_strings["mcmc_heatmaps"] = "mcmc_heatmaps/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_heatmaps"])

    # Estimation parameters of mcmc algorithms
    pattern_strings["mcmc_est"] = "mcmc_params/"\
                                "mcmc_estimator={mcmc_estimator}/"\
                                "threshold={threshold}/"\
                                "burnin_frac={burnin_frac}"
    return pattern_strings


