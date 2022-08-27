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
    if "burnin" in c: 
        c.pop("burnin")
    if "threshold" in c:      
        c.pop("threshold")
    if "active" in c:
        c.pop("active")
    sep = "/"
    ret = sep.join([key+"={"+key+"}" for key,val in c.items()])
    return ret

pattern_strings = {}
# structure learning algorithms. 
# The pattern strings are generated from the json config file.
for alg in config["resources"]["structure_learning_algorithms"].keys():
    pattern_strings[alg] = alg+"/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"][alg])

pattern_strings["mcmc_est"] = "estimation_method/"\
                            "threshold={threshold}/"\
                            "burnin={burnin}"

# graph sampling
if "pcalg_randdag" in config["resources"]["graph"]:
    pattern_strings["pcalg_randdag"] = "pcalg_randdag/" + dict_to_path(config["resources"]["graph"]["pcalg_randdag"])
if "trilearn_cta" in config["resources"]["graph"]:
    pattern_strings["trilearn_cta"] = "cta/" + dict_to_path(config["resources"]["graph"]["trilearn_cta"])
if "bandmat" in config["resources"]["graph"]:
    pattern_strings["bandmat"] = "bandmat/" + dict_to_path(config["resources"]["graph"]["bandmat"])
if "rand_bandmat" in config["resources"]["graph"]:
    pattern_strings["rand_bandmat"] = "rand_bandmat/" + dict_to_path(config["resources"]["graph"]["rand_bandmat"])
if "bdgraph_graphsim" in config["resources"]["graph"]:
    pattern_strings["bdgraph_graphsim"] = "bdgraph_graphsim/" + dict_to_path(config["resources"]["graph"]["bdgraph_graphsim"])

# parameters sampling
if "sem_params" in config["resources"]["parameters"]:
    pattern_strings["sem_params"] = "sem_params/" + dict_to_path(config["resources"]["parameters"]["sem_params"])
if "bin_bn" in config["resources"]["parameters"]:
    pattern_strings["bin_bn"] = "bin_bn/" + dict_to_path(config["resources"]["parameters"]["bin_bn"])
if "trilearn_hyper-dir" in config["resources"]["parameters"]:
    pattern_strings["trilearn_hyper-dir"] = "trilearn_hyper-dir/" + dict_to_path(config["resources"]["parameters"]["trilearn_hyper-dir"])
if "trilearn_intra-class" in config["resources"]["parameters"]:
    pattern_strings["trilearn_intra-class"] = "intra-class/" + dict_to_path(config["resources"]["parameters"]["trilearn_intra-class"])
if "trilearn_g_inv_wishart" in config["resources"]["parameters"]:
    pattern_strings["trilearn_g_inv_wishart"] = "trilearn_g_inv_wishart/" + dict_to_path(config["resources"]["parameters"]["trilearn_g_inv_wishart"])
if "bdgraph_rgwish" in config["resources"]["parameters"]:
    pattern_strings["bdgraph_rgwish"] = "bdgraph_rgwish/" + dict_to_path(config["resources"]["parameters"]["bdgraph_rgwish"])

# Evaluation strings. These have not exactly the same logic as the above, but it works.
pattern_strings["mcmc_traj_plots"] = "mcmc_traj_plots/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"])
pattern_strings["mcmc_autocorr_plots"] = "mcmc_autocorr_plots/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_autocorr_plots"])
pattern_strings["mcmc_heatmaps"] = "mcmc_heatmaps/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_heatmaps"])