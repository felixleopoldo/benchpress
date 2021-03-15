def dict_to_path(d):
    c = d[0].copy() # take the first element in the list. BUG
    c.pop("id") # remove id from the string as only the parameters should identify the computation.
    if "burnin" in c:
        c.pop("burnin")
    if "threshold" in c:        
        c.pop("threshold")
    sep = "/"
    ret = sep.join([key+"={"+key+"}" for key,val in c.items()])
    return ret

pattern_strings = {}

# structure learning algorithms
pattern_strings["greenthomas"] = "greenthomas/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["greenthomas"])

pattern_strings["gg_singlepair"] = "gg_singlepair/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gg_singlepair"])

pattern_strings["notears"] = "notears/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["notears"])

pattern_strings["blip"] = "blip/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["blip"])

pattern_strings["pcalg"] = "pcalg/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["pcalg"])

pattern_strings["mmhc"] = "mmhc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["mmhc"])

pattern_strings["interiamb"] = "interiamb/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["interiamb"])

pattern_strings["gs"] = "gs/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gs"])

pattern_strings["tabu"] = "tabu/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["tabu"])

pattern_strings["hc"] = "hc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["hc"])

pattern_strings["gobnilp"] = "gobnilp/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gobnilp"])

pattern_strings["itsearch"] = "itsearch/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["itsearch"])

pattern_strings["order_mcmc"] = "order_mcmc/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["order_mcmc"])

pattern_strings["trilearn_loglin"] = "trilearn_loglin/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["trilearn_loglin"])

pattern_strings["fges"] = "fges/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["fges"])

pattern_strings["fci"] = "fci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["fci"])

pattern_strings["gfci"] = "gfci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["gfci"])

pattern_strings["rfci"] = "rfci/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"]["rfci"])

pattern_strings["mcmc_est"] = "estimation_method/"\
                            "threshold={threshold}/"\
                            "burnin={burnin}"

pattern_strings["evaluation"] = "evaluation/" \
                   "score_type={score_type}/" \
                   "chi={chi}/" \
                   "edgepf={edgepf}" 

# graph sampling
pattern_strings["DAGavparents"] = "DAGavparents/" + dict_to_path(config["resources"]["graph"]["DAGavparents"])
pattern_strings["generateDAGMaxParents"] = "generateDAGMaxParents/" + dict_to_path(config["resources"]["graph"]["generateDAGMaxParents"])
pattern_strings["cta"] = "cta/" + dict_to_path(config["resources"]["graph"]["cta"])
pattern_strings["bandmat"] = "bandmat/" + dict_to_path(config["resources"]["graph"]["bandmat"])
pattern_strings["rand_bandmat"] = "rand_bandmat/" + dict_to_path(config["resources"]["graph"]["rand_bandmat"])
#pattern_strings["notears_dag"] = "notears/" + dict_to_path(config["resources"]["graph"]["notears"])

# parameters sampling
pattern_strings["pcalg_sem_params"] = "pcalg_sem_params/" + dict_to_path(config["resources"]["parameters"]["pcalg_sem_params"])
pattern_strings["generateBinaryBN"] = "generateBinaryBN/" + dict_to_path(config["resources"]["parameters"]["generateBinaryBN"])
pattern_strings["hyper-dir"] = "hyper-dir/" + dict_to_path(config["resources"]["parameters"]["hyper-dir"])
#pattern_strings["notears_parameters_sampling"] = "notears/" + dict_to_path(config["resources"]["parameters"]["notears_parameters_sampling"])

