# Some validation of the values privoded in the JSON file.
# TODO: This should be extended to avoid errors.

# Check that algorithm exists

# Available algorithm ids
from typing import Optional, List, Union, Tuple
available_conf_ids = []
for alg, alg_conf_avail in config["resources"]["structure_learning_algorithms"].items():
    for alg_conf in alg_conf_avail:
        available_conf_ids.append(alg_conf["id"])

# Check that all ids in the benchmarks section actually exist.
for bmark_setup in config["benchmark_setup"]:
    if "benchmarks" in bmark_setup["evaluation"]:
        for benchmarksitem in bmark_setup["evaluation"]["benchmarks"]["ids"]:
            if benchmarksitem not in available_conf_ids:
                raise Exception(
                    benchmarksitem + " not available.\nThe available id's are:\n{ids}".format(ids=sorted(available_conf_ids)))


# Check that the startspace for order mcmc exist.
# for alg_conf in config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]:
#     if alg_conf["input_algorithm_id"] not in set(available_conf_ids + [None]) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]}:
#         raise Exception(alg_conf["input_algorithm_id"] + " not available startspace for order_mcmc.\n"\
#                         "The available are:\n"+str(sorted(list(set(available_conf_ids) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]}))))


def validate_data_setup(config, data_setup, bmark_setup):
    # Check that adjmat exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["graph"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += os.listdir("resources/adjmat/myadjmats")

    # Benchmarks requires a true graph
    if "benchmarks" in bmark_setup["evaluation"]:
        if bmark_setup["evaluation"]["benchmarks"]["ids"] != []:
            if data_setup["graph_id"] is None:
                raise Exception("ROC evaluation requires graph_id.\n"
                                "The available graph id´s are:\n" + str(sorted(available_conf_ids)))

            if not data_setup["graph_id"] in available_conf_ids:
                raise Exception(data_setup["graph_id"] +
                                " is not an available graph id.\n"
                                "The available graph id´s are:\n" + str(sorted(available_conf_ids)))

    if "graph_true_stats" in bmark_setup["evaluation"]:
        if bmark_setup["evaluation"]["graph_true_stats"] == True:
            if data_setup["graph_id"] is None:
                raise Exception("graph_true_stats requires graph_id.\n"
                                "The available graph id´s are:\n" + str(sorted(available_conf_ids)))

            if not data_setup["graph_id"] in available_conf_ids:
                raise Exception(data_setup["graph_id"] +
                                " is not an available graph id.\n"
                                "The available graph id´s are:\n" + str(sorted(available_conf_ids)))

    available_data_files = os.listdir("resources/data/mydatasets")

    # Check that data exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["data"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += available_data_files

    if data_setup["data_id"] not in available_conf_ids:
        raise Exception(str(data_setup["data_id"]) +
                        " is not an available data id.\n"
                        "The available data id´s are:\n" + str(sorted(available_conf_ids)))
    # Check that graph, parameters, and data are properly combined.

    # Check that parameters exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["parameters"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])
    available_conf_ids += os.listdir(
        "resources/parameters/myparams/bn.fit_networks")
    available_conf_ids += os.listdir(
        "resources/parameters/myparams/sem_params")

    if data_setup["data_id"] not in available_data_files and data_setup["parameters_id"] not in available_conf_ids:
        raise Exception(str(data_setup["parameters_id"]) +
                        " is not an available parameter id.\n"
                        "The available paremeter id´s are:\n" + str(sorted(available_conf_ids)))

# validate the data_setup
for bmark_setup in config["benchmark_setup"]:
    #print("Benchmark setup")
    #print(bmark_setup)
    for data_setup in bmark_setup["data"]:
        #print(data_setup)        
        validate_data_setup(config, data_setup, bmark_setup)


def validate_graph_estimation(config, bmark_setup):
    """
    If diffplots or graphvizcompare is true, we check if a true graph
    is provided.    
    """
        
    # First check if the graph_estimation is active
    if "graph_estimation" in bmark_setup["evaluation"]:
        
        # Check that all ids in the graph_estimation actually exist.
        for benchmarksitem in bmark_setup["evaluation"]["graph_estimation"]["ids"]:
            if benchmarksitem not in available_conf_ids:
                raise Exception(
                    benchmarksitem + " not available.\nThe available id's are:\n{ids}".format(ids=sorted(available_conf_ids)))                
        
        graph_estimation = bmark_setup["evaluation"]["graph_estimation"]
        if graph_estimation["diffplots"] or graph_estimation["graphvizcompare"]:
            # Loop over data setups in benchmark_setup and check if graph_id is provided everywhere
            for data_setup in bmark_setup["data"]:
                if data_setup["graph_id"] is None:
                    raise Exception("graph_estimation: The options diffplots and graphvizcompare requires graph_id. \n"
                                    "graph_estimation: Either provide a graph_id in the data setup or set diffplots and graphvizcompare to false.")


def valid_path(run_id: Optional[str]) -> bool:
    """ Returns the path to the estimated graph of each id"""

    if not run_id:
        return False

    alg, run_config = idtoalg(run_id)
    if not alg:
        return False

    if not is_single_output_run(run_config):
        return False

    return True

def idtoalg(run_id: str) -> Optional[Tuple[str, dict]]:
    """ Returns the algorithm name that the id belongs to, otherwise None """
    for key, alg in config["resources"]["structure_learning_algorithms"].items():
        for obj in alg:
            if obj["id"] == run_id:
                return key, obj
    return None, None


def is_single_output_run(run_config: dict) -> bool:
    """ checks if the run is a single output run, i.e., no parameters is with a list lager > 1"""

    for key, item in run_config.items():
        if isinstance(item, list):
            if len(item) > 1:
                return False

    return True


def validate_algorithms():
    """ Random validation tests for config"""
    # Testing if input_graph_id has an actual run.
    for module, module_obj_list in config["resources"]["structure_learning_algorithms"].items():
        for module_obj in module_obj_list:
            if 'input_algorithm_id' in module_obj:
                                
                if isinstance(module_obj['input_algorithm_id'], list):
                    for input_graph in module_obj['input_algorithm_id']:                        
                        path = valid_path(input_graph)                                                
                        if not path:
                            raise Exception(
                                f"In algorithm {module}, 'input_algorithm_id' {input_graph} is not available in the config file, or the associated config has parameters with multiple values!")
                else:
                    if module_obj['input_algorithm_id'] == None:
                        continue
                    path = valid_path(module_obj['input_algorithm_id'])
                    if not path:
                        raise Exception(
                            f"In algorithm {module}, 'input_algorithm_id' {module_obj['input_algorithm_id']} is not available in the config file, or the associated config has parameters with multiple values!")


validate_algorithms()

for bmark_setup in config["benchmark_setup"]:
    validate_graph_estimation(config, bmark_setup)