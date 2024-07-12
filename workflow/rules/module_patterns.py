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
pattern_strings = {}

# structure learning algorithms. 
# May be good to add all since they might be input for other algs.
for alg in config["resources"]["structure_learning_algorithms"].keys():
    pattern_strings[alg] = alg+"/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"][alg])

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
# check if the evaluation is active.
for mcmc_eval in ["mcmc_traj_plots", "mcmc_autocorr_plots", "mcmc_heatmaps"]:
    # check if in json config file.
    for bmark_setup in config["benchmark_setup"]:
        if mcmc_eval in bmark_setup["evaluation"]:
            pattern_strings[mcmc_eval] = mcmc_eval + "/" + dict_to_path(bmark_setup["evaluation"][mcmc_eval])
            # mcmc_traj_plots is needed for all
            
            mcmc_traj_plot_template = [{
                "id": None,
                "burn_in": None,
                "thinning": None,
                "functional": None
            }]

            pattern_strings["mcmc_traj_plots"] = "mcmc_traj_plots/" + dict_to_path(mcmc_traj_plot_template)

# Estimation parameters of mcmc algorithms
pattern_strings["mcmc_est"] = "mcmc_params/"\
                            "mcmc_estimator={mcmc_estimator}/"\
                            "threshold={threshold}/"\
                            "burnin_frac={burnin_frac}"
