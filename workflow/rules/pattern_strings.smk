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

# structure learning algorithms
if "gt13_multipair" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["gt13_multipair"] = "gt13_multipair/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gt13_multipair"])
if "gg99_singlepair" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["gg99_singlepair"] = "gg99_singlepair/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gg99_singlepair"])
if "notears" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["notears"] = "notears/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["notears"])
if "rblip_asobs" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["rblip_asobs"] = "rblip_asobs/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["rblip_asobs"])
if "pcalg_pc" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["pcalg_pc"] = "pcalg_pc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["pcalg_pc"])
if "guidice_dualpc" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["guidice_dualpc"] = "guidice_dualpc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["guidice_dualpc"])
if "bnlearn_mmhc" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bnlearn_mmhc"] = "bnlearn_mmhc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_mmhc"])
if "bnlearn_interiamb" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bnlearn_interiamb"] = "bnlearn_interiamb/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_interiamb"])
if "bnlearn_gs" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bnlearn_gs"] = "bnlearn_gs/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_gs"])
if "bnlearn_tabu" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bnlearn_tabu"] = "bnlearn_tabu/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_tabu"])
if "bnlearn_hc" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bnlearn_hc"] = "bnlearn_hc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_hc"])
if "gobnilp" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["gobnilp"] = "gobnilp/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gobnilp"])
if "bidag_itsearch" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bidag_itsearch"] = "bidag_itsearch/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bidag_itsearch"])
if "bidag_order_mcmc" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["bidag_order_mcmc"] = "bidag_order_mcmc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"])
if "trilearn_pgibbs" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["trilearn_pgibbs"] = "trilearn_pgibbs/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["trilearn_pgibbs"])
if "tetrad_fges" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["tetrad_fges"] = "tetrad_fges/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_fges"])
if "tetrad_fci" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["tetrad_fci"] = "tetrad_fci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_fci"])
if "tetrad_gfci" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["tetrad_gfci"] = "tetrad_gfci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_gfci"])
if "tetrad_rfci" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["tetrad_rfci"] = "tetrad_rfci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_rfci"])
if "sklearn_glasso" in config["resources"]["structure_learning_algorithms"]:
    pattern_strings["sklearn_glasso"] = "sklearn_glasso/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["sklearn_glasso"])

pattern_strings["mcmc_est"] = "estimation_method/"\
                            "threshold={threshold}/"\
                            "burnin={burnin}"

pattern_strings["evaluation"] = "evaluation/" \
                   "score_type={score_type}/" \
                   "chi={chi}/" \
                   "edgepf={edgepf}" 

# graph sampling
#pattern_strings["DAGavparents"] = "DAGavparents/" + dict_to_path(config["resources"]["graph"]["DAGavparents"])
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