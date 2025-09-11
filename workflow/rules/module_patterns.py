# This file essentially defines the pattern strings for all algorithms, 
# 
# 
# TODO: It would be if good one could have different patterns for the same algorithm, 
# so that one could omit some paramters e.g.
#

# The pattern strings are generated from the json config file.
pattern_strings = {}

def get_algorithm_patterns(config):
    """Generate pattern strings for structure learning algorithms"""
    patterns = {}
    for alg in config["resources"]["structure_learning_algorithms"].keys():
        patterns[alg] = alg+"/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"][alg])
    return patterns

def get_graph_patterns(config):
    """Generate pattern strings for graph modules"""
    patterns = {}
    for module in config["resources"]["graph"]:
        patterns[module] = module + "/" + dict_to_path(config["resources"]["graph"][module])
    return patterns

def get_parameter_patterns(config):
    """Generate pattern strings for parameter modules"""
    patterns = {}
    for module in config["resources"]["parameters"]:
        patterns[module] = module + "/" + dict_to_path(config["resources"]["parameters"][module])
    return patterns

def get_data_patterns(config):
    """Generate pattern strings for data modules"""
    patterns = {}
    for module in config["resources"]["data"]:
        patterns[module] = module + "/" + dict_to_path(config["resources"]["data"][module])
    return patterns

def get_mcmc_eval_patterns(config):
    """Generate pattern strings for MCMC evaluation methods"""
    patterns = {}
    for mcmc_eval in ["mcmc_traj_plots", "mcmc_autocorr_plots", "mcmc_heatmaps"]:
        for bmark_setup in config["benchmark_setup"]:
            if mcmc_eval in bmark_setup["evaluation"]:
                patterns[mcmc_eval] = mcmc_eval + "/" + dict_to_path(bmark_setup["evaluation"][mcmc_eval])
    return patterns

def get_mcmc_est_pattern():
    """Generate pattern string for MCMC estimation parameters"""
    return "mcmc_params/"\
           "mcmc_estimator={mcmc_estimator}/"\
           "threshold={threshold}/"\
           "burnin_frac={burnin_frac}"

# Initialize empty pattern strings dict
pattern_strings = {}

# Build up pattern strings by calling each function
# May be good to add all since they might be input for other algs.
pattern_strings.update(get_algorithm_patterns(config))
pattern_strings.update(get_graph_patterns(config))
pattern_strings.update(get_parameter_patterns(config))
pattern_strings.update(get_data_patterns(config))
pattern_strings.update(get_mcmc_eval_patterns(config))
pattern_strings["mcmc_est"] = get_mcmc_est_pattern()
