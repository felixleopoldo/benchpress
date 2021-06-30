def idtopath(mylist, json_string):
    if isinstance(mylist, list):
        return [json_string[startalg][0] for startalg in mylist]
    else:
        return json_string[str(mylist)]

json_string = {}

json_string = {val["id"]: expand(pattern_strings["gt13_multipair"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gt13_multipair"]}

json_string.update({val["id"]: expand(pattern_strings["gg99_singlepair"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gg99_singlepair"]})

json_string.update({val["id"]: expand(pattern_strings["gg99_singlepair_fortran"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gg99_singlepair_fortran"]})

json_string.update({val["id"]: expand(pattern_strings["bidag_itsearch"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["bidag_itsearch"]})

json_string.update({val["id"]: expand(pattern_strings["tetrad_fges"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["tetrad_fges"]})

json_string.update({val["id"]: expand(pattern_strings["notears"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["notears"]})

json_string.update({val["id"]: expand(pattern_strings["tetrad_fci"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["tetrad_fci"]})

json_string.update({val["id"]: expand(pattern_strings["tetrad_gfci"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["tetrad_gfci"]})

json_string.update({val["id"]: expand(pattern_strings["tetrad_rfci"], **val) 
                    for val in config["resources"]["structure_learning_algorithms"]["tetrad_rfci"]})

json_string.update({val["id"]: expand(pattern_strings["pcalg_pc"], **val)  
                    for val in config["resources"]["structure_learning_algorithms"]["pcalg_pc"]})

json_string.update({val["id"]: expand(pattern_strings["bnlearn_mmhc"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["bnlearn_mmhc"]} )

json_string.update({val["id"]: expand(pattern_strings["bnlearn_interiamb"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["bnlearn_interiamb"]} )

json_string.update({val["id"]: expand(pattern_strings["bnlearn_gs"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["bnlearn_gs"]} )

json_string.update({val["id"]: expand(pattern_strings["gobnilp"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gobnilp"]})

json_string.update({val["id"]:  expand(pattern_strings["bnlearn_tabu"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["bnlearn_tabu"]})

json_string.update({val["id"]:  expand(pattern_strings["bnlearn_hc"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["bnlearn_hc"]})

json_string.update({val["id"]:  expand(pattern_strings["sklearn_glasso"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["sklearn_glasso"]})

json_string.update({val["id"]:  expand(pattern_strings["trilearn_pgibbs"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["trilearn_pgibbs"]})

json_string.update({val["id"]: expand(pattern_strings["rblip"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["rblip"]})

# Order mcmc is special and has to be the last one since it takes input strings as start space...\
# Also, the start space path has to be extracted first.
order_mcmc_list = config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]
for items in order_mcmc_list:    
    items["startspace_algorithm"] = idtopath(items["startspace_algorithm"], json_string)

json_string.update({val["id"]: expand(pattern_strings["bidag_order_mcmc"]+"/"+pattern_strings["mcmc_est"], **val,) 
                    for val in order_mcmc_list } )

# Another dict for the non mcmc chains? 
# Since we dont want the  mcmc_est when we call the trajectory directly.
json_string_mcmc_noest = {}

json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["bidag_order_mcmc"], **val,) 
                    for val in order_mcmc_list } )

json_string_mcmc_noest.update({val["id"]:  expand(pattern_strings["trilearn_pgibbs"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["trilearn_pgibbs"]})

json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["gt13_multipair"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gt13_multipair"]})

json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["gg99_singlepair"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gg99_singlepair"]})

json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["gg99_singlepair_fortran"], **val)
                    for val in config["resources"]["structure_learning_algorithms"]["gg99_singlepair_fortran"]})
#print(json_string_mcmc_noest)
#print(json_string)