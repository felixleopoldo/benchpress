# Check that algorithm exists

# Available algorithm ids
available_conf_ids = []
for alg, alg_conf_avail in config["resources"]["structure_learning_algorithms"].items():
    for alg_conf in alg_conf_avail:
        available_conf_ids.append(alg_conf["id"])   

# Check that all ids in the ROC section actually exist.
for rocitem in config["benchmark_setup"]["evaluation"]["ROC"]:
    if rocitem["algorithm_id"] not in available_conf_ids:
        raise Exception(rocitem["algorithm_id"] + " not available.\nThe available id's are:\n{ids}".format(ids=sorted(available_conf_ids)))

# Check that the startspace fr order mcmc exist.
for alg_conf in config["resources"]["structure_learning_algorithms"]["order_mcmc"]:
    if alg_conf["startspace_algorithm"] not in set(available_conf_ids) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["order_mcmc"]}:
        raise Exception(alg_conf["startspace_algorithm"] + " not available startspace for order_mcmc.\n"\
                        "The available are:\n"+str(sorted(list(set(available_conf_ids) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["order_mcmc"]}))))

def validate_data_setup(config, dict):
    # Check that adjmat exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["graph"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += os.listdir( "results/adjmat/myadjmats")


    if not dict["graph_id"] in available_conf_ids:
        raise Exception(dict["graph_id"] + 
                        " is not an available graph id.\n"
                        "The available graph id´s are:\n" + str(sorted(available_conf_ids)))
  

    available_data_files = os.listdir("results/data/mydatasets")
    # Check that parameters exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["parameters"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += os.listdir("results/bn/bn.fit_networks")

    
    if dict["data_id"] not in available_data_files and dict["parameters_id"] not in available_conf_ids:
        raise Exception(dict["parameters_id"] + 
                        " is not an available parameter id.\n"
                        "The available paremeter id´s are:\n" + str(sorted(available_conf_ids)))

    # Check that data exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["data"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += available_data_files

    if dict["data_id"] not in available_conf_ids:
        raise Exception(dict["data_id"] + 
                        " is not an available data id.\n"
                        "The available data id´s are:\n" + str(sorted(available_conf_ids)))
    # Check that graph, parameters, and data are properly combined.

for data_setup in config["benchmark_setup"]["data"]:
    validate_data_setup(config, data_setup)
