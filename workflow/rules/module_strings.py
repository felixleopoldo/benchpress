
"""
    This file procudes a dict where the paths for all algorithms are generated based on the
    algorithm pattern strings and the values in the config file.
    MCMC methods are special since the the estimation parameters should not mix with the 
    parameters that define the run.
    Order MCMC is special in the sense that it can define a startspace by means 
    of the id of some algorithm. Thus the id has to be exptracted into a path string first.
"""
from pathlib import Path
from typing import Optional, List, Union, Tuple


def input_algorithm(wildcards):
    """This algorithm can be use as input field in n algorithm rule to pass the output
    graph of another algorithm as input. The requirement is that the algorithm JSON object
    has a fiels called input_algorithm which is set to the id of anothe algorithm object.

    Args:
        wildcards (dict): This is set by snakemake and contains the wildcards of the rule.

    Returns:
        str | None: Return ht epath of the input algorithm graph or [] if no input algorithm is set.
    """

    if wildcards.input_algorithm_id == "None":
        return []
    else:
        return "{output_dir}/adjmat_estimate/{data}/"\
            "algorithm=/" + wildcards["input_algorithm_id"] + "/" +\
            "seed={seed}/" \
            "adjmat.csv"

def idtopath(mylist, json_string):
    """This is to generate paths from input_algorithm ids in the json_strings dict.

    Args:
        mylist (_type_): _description_
        json_string (_type_): _description_

    Returns:
        _type_: _description_
    """

    if mylist is None:
        return "None"
    if isinstance(mylist, list):
        # Assuming the paths of the input algorithms are already generated.
        # what is 0?
        return [json_string[input_algorithm][0] for input_algorithm in mylist]
    else:
        return json_string[str(mylist)]


json_string = {}
json_string_mcmc_noest = {}

# List the algorithms that take input algorithms.
has_input_algs = []
# BUG: should check for each object in the list.
for algname, objlist in config["resources"]["structure_learning_algorithms"].items():
    if "input_algorithm_id" in objlist[0]:
        has_input_algs.append(algname)

# First generate path strings for those without input graphs.
# Then we can use them as input algs. This also means that an input algorithm
# cant take another input algorithm as input, for now.

for alg in config["resources"]["structure_learning_algorithms"]:
    if (alg not in has_input_algs):# and (alg not in mcmc_modules):  # not the mcmc_modules yet
        if alg in mcmc_modules:
            
            json_string.update({val["id"]: expand(pattern_strings[alg]+"/"+pattern_strings["mcmc_est"], **val)
                                for val in config["resources"]["structure_learning_algorithms"][alg]})

            json_string_mcmc_noest.update({val["id"]: expand(pattern_strings[alg], **val)
                                        for val in config["resources"]["structure_learning_algorithms"][alg]})
        else:        
            json_string.update({val["id"]: expand(pattern_strings[alg], **val)
                                for val in config["resources"]["structure_learning_algorithms"][alg]})

# Those without input graphs
for alg, alg_objects in config["resources"]["structure_learning_algorithms"].items():
    if (alg in has_input_algs): #and (alg not in mcmc_modules):  # not the mcmc_modules yet
        # NOTE
        # Here we manipulate the json object before we generate the path string.
        # More speceifcally we expande the id of the input algorithm to a path string.
        # Its ugly but works for now.. Iw we change the name we would also have to  remove it from the pattern string.
        for items in alg_objects:
            items["input_algorithm_id"] = idtopath(
                items["input_algorithm_id"], json_string)
            
        if alg in mcmc_modules:
           
            json_string.update({val["id"]: expand(pattern_strings[alg]+"/"+pattern_strings["mcmc_est"], **val)
                                for val in config["resources"]["structure_learning_algorithms"][alg]})

            json_string_mcmc_noest.update({val["id"]: expand(pattern_strings[alg], **val)
                                        for val in config["resources"]["structure_learning_algorithms"][alg]})
           
        else:
            json_string.update({val["id"]: expand(pattern_strings[alg], **val)
                                for val in config["resources"]["structure_learning_algorithms"][alg]})


# Evaluation strings

def gen_evaluation_string_from_conf(method, alg_id):
    # This essentially converts a dict in (from an evaluation method conf) to a path string following a pattern
    # specified in pattern_strings.
    eval_dict = next(
        item for item in config["benchmark_setup"]["evaluation"][method] if item["id"] == alg_id)
    return expand(pattern_strings[method], **eval_dict)

# Graph strings


def gen_adjmat_string_from_conf(adjmat_id, seed):
    # find the adjmat_gen_method from adjmat_gen_id

    for module in config["resources"]["graph"]:
        if adjmat_id in [c["id"] for c in config["resources"]["graph"][module]]:
            adjmat_dict = next(
                item for item in config["resources"]["graph"][module] if item["id"] == adjmat_id)
            return expand(pattern_strings[module] + "/seed={seed}", **adjmat_dict, seed=seed)

    if adjmat_id is not None and Path("resources/adjmat/myadjmats/"+adjmat_id).is_file():
        filename_no_ext = os.path.splitext(os.path.basename(adjmat_id))[0]
        return "myadjmats/" + filename_no_ext  # this could be hepar2.csv e.g.

    elif adjmat_id is None:
        print("No adjmat string found")
        return None

# Parameter strings
def gen_parameter_string_from_conf(gen_method_id, seed):

    for module in config["resources"]["parameters"]:
        if gen_method_id in [c["id"] for c in config["resources"]["parameters"][module]]:
            curconf = next(
                item for item in config["resources"]["parameters"][module] if item["id"] == gen_method_id)
            return expand(pattern_strings[module] + "/seed={seed}", **curconf, seed=seed)

    if Path("resources/parameters/myparams/bn.fit_networks/"+str(gen_method_id)).is_file():
        # gen_method_id could be hepar2.rds e.g.
        return "bn.fit_networks/" + gen_method_id

    elif Path("resources/parameters/myparams/sem_params/"+str(gen_method_id)).is_file():
        # gen_method_id could be hepar2.rds e.g.
        return "sem_params/" + gen_method_id

    elif gen_method_id is None:
        print("No parameter string found")
        return None


# Data strings
def gen_data_string_from_conf(data_id, seed, seed_in_path=True):

    if Path("resources/data/mydatasets/"+data_id).is_file():
        num_lines = sum(1 for line in open(
            "resources/data/mydatasets/"+data_id)) - 1
        
        data_string = ("fixed" + 
                "/filename="+data_id + 
                "/n="+str(num_lines) +
                "/seed="+str(seed))
        print(data_string)
        return data_string

    elif Path("resources/data/mydatasets/"+data_id).exists():
        paths = Path("resources/data/mydatasets/").glob(data_id+'/*.csv')
        files = [x.name for x in paths if x.is_file()]

        return ["fixed" +
                "/filename="+data_id + "/" + f +
                "/n="+str(None) +
                "/seed="+str(seed) for f in files]
    else:
        for module in config["resources"]["data"]:
            if data_id in [c["id"] for c in config["resources"]["data"][module]]:

                # Find the data entry from the resources
                data = next(
                    item for item in config["resources"]["data"][module] if item["id"] == data_id)
                if seed_in_path:  # seed_in_path is a HACK..
                    return expand(pattern_strings[module] + "/standardized={standardized}" +  # standardized has to come last, see standardize rule
                                  "/seed={seed}",
                                  seed=seed,
                                  **data)
                else:
                    return expand(pattern_strings[module]+"/standardized={standardized}",
                                  **data)

