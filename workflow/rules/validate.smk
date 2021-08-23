# Some validation of the values privoded in the JSON file.
# TODO: This should be extended to avoid errors.

# Check that algorithm exists

# Available algorithm ids
available_conf_ids = []
for alg, alg_conf_avail in config["resources"]["structure_learning_algorithms"].items():
    for alg_conf in alg_conf_avail:
        available_conf_ids.append(alg_conf["id"])   

# Check that all ids in the roc section actually exist.
for rocitem in config["benchmark_setup"]["evaluation"]["roc"]["ids"]:
    if rocitem not in available_conf_ids:
        raise Exception(rocitem + " not available.\nThe available id's are:\n{ids}".format(ids=sorted(available_conf_ids)))

# Check that the startspace for order mcmc exist.
#for alg_conf in config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]:
#    if alg_conf["startspace_algorithm"] not in set(available_conf_ids + [None]) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]}:
#        raise Exception(alg_conf["startspace_algorithm"] + " not available startspace for order_mcmc.\n"\
#                        "The available are:\n"+str(sorted(list(set(available_conf_ids) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]}))))

def validate_data_setup(config, dict):
    # Check that adjmat exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["graph"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += os.listdir("resources/adjmat/myadjmats")

    if config["benchmark_setup"]["evaluation"]["roc"]["ids"] != []:
        if dict["graph_id"] is None:
            raise Exception("ROC evaluation requires graph_id.\n"
                            "The available graph id´s are:\n" + str(sorted(available_conf_ids)))

        if not dict["graph_id"] in available_conf_ids:
            raise Exception(dict["graph_id"] + 
                            " is not an available graph id.\n"
                            "The available graph id´s are:\n" + str(sorted(available_conf_ids)))

    available_data_files = os.listdir("resources/data/mydatasets")

    # Check that data exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["data"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += available_data_files

    if dict["data_id"] not in available_conf_ids:
        raise Exception(str(dict["data_id"]) + 
                        " is not an available data id.\n"
                        "The available data id´s are:\n" + str(sorted(available_conf_ids)))
    # Check that graph, parameters, and data are properly combined.


    # Check that parameters exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["parameters"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += os.listdir("resources/parameters/myparams/bn.fit_networks")
    available_conf_ids += os.listdir("resources/parameters/myparams/sem_params")

    if dict["data_id"] not in available_data_files and dict["parameters_id"] not in available_conf_ids:
        raise Exception(str(dict["parameters_id"])+ 
                        " is not an available parameter id.\n"
                        "The available paremeter id´s are:\n" + str(sorted(available_conf_ids)))


for data_setup in config["benchmark_setup"]["data"]:
    validate_data_setup(config, data_setup)
