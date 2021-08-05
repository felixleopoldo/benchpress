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
pattern_strings["gt13_multipair"] = "gt13_multipair/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gt13_multipair"])
pattern_strings["gg99_singlepair"] = "gg99_singlepair/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gg99_singlepair"])
pattern_strings["notears"] = "notears/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["notears"])
pattern_strings["rblip"] = "blip/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["rblip"])
pattern_strings["pcalg_pc"] = "pcalg/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["pcalg_pc"])
pattern_strings["bnlearn_mmhc"] = "mmhc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_mmhc"])
pattern_strings["bnlearn_interiamb"] = "bnlearn_interiamb/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_interiamb"])
pattern_strings["bnlearn_gs"] = "gs/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_gs"])
pattern_strings["bnlearn_tabu"] = "tabu/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_tabu"])
pattern_strings["bnlearn_hc"] = "hc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bnlearn_hc"])
pattern_strings["gobnilp"] = "gobnilp/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gobnilp"])
pattern_strings["bidag_itsearch"] = "itsearch/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bidag_itsearch"])
pattern_strings["bidag_order_mcmc"] = "order_mcmc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"])
pattern_strings["trilearn_pgibbs"] = "trilearn/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["trilearn_pgibbs"])
pattern_strings["tetrad_fges"] = "tetrad_fges/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_fges"])
pattern_strings["tetrad_fci"] = "tetrad_fci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_fci"])
pattern_strings["tetrad_gfci"] = "tetrad_gfci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_gfci"])
pattern_strings["tetrad_rfci"] = "tetrad_rfci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tetrad_rfci"])
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
pattern_strings["pcalg_randdag"] = "pcalg_randdag/" + dict_to_path(config["resources"]["graph"]["pcalg_randdag"])
pattern_strings["trilearn_cta"] = "cta/" + dict_to_path(config["resources"]["graph"]["trilearn_cta"])
pattern_strings["bandmat"] = "bandmat/" + dict_to_path(config["resources"]["graph"]["bandmat"])
pattern_strings["rand_bandmat"] = "rand_bandmat/" + dict_to_path(config["resources"]["graph"]["rand_bandmat"])
pattern_strings["bdgraph_graphsim"] = "bdgraph_graphsim/" + dict_to_path(config["resources"]["graph"]["bdgraph_graphsim"])

# parameters sampling
pattern_strings["sem_params"] = "sem_params/" + dict_to_path(config["resources"]["parameters"]["sem_params"])
pattern_strings["bin_bn"] = "bin_bn/" + dict_to_path(config["resources"]["parameters"]["bin_bn"])
pattern_strings["trilearn_hyper-dir"] = "trilearn_hyper-dir/" + dict_to_path(config["resources"]["parameters"]["trilearn_hyper-dir"])
pattern_strings["trilearn_intra-class"] = "intra-class/" + dict_to_path(config["resources"]["parameters"]["trilearn_intra-class"])
pattern_strings["trilearn_g_inv_wishart"] = "trilearn_g_inv_wishart/" + dict_to_path(config["resources"]["parameters"]["trilearn_g_inv_wishart"])
pattern_strings["bdgraph_rgwish"] = "bdgraph_rgwish/" + dict_to_path(config["resources"]["parameters"]["bdgraph_rgwish"])

# Evaluation strings. These have not exactly the same logic as the above, but it works.
pattern_strings["mcmc_traj_plots"] = "mcmc_traj_plots/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"])
pattern_strings["mcmc_autocorr_plots"] = "mcmc_autocorr_plots/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_autocorr_plots"])
pattern_strings["mcmc_heatmaps"] = "mcmc_heatmaps/" + dict_to_path(config["benchmark_setup"]["evaluation"]["mcmc_heatmaps"])