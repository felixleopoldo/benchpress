# This file pricudes a dict where the paths for all algorithms are generated based on the
# algorithm pattern strings and the values in the config file.
#
# MCMC methods are special since the the estimation parameters should not mix with the 
# parameters that define the run.
#
# Order MCMC is special in the sense that it can define a startspace by means 
# of the id of some algorithm. Thus the id has to be exptracted into a path string first.

def idtopath(mylist, json_string):
    if isinstance(mylist, list):
        return [json_string[startalg][0] for startalg in mylist]
    else:
        return json_string[str(mylist)]

json_string = {}

# Generate strings from the config file.
for alg in config["resources"]["structure_learning_algorithms"]:
    # Some algorihtm takes input graphs. These are treated separately.
    has_input_algs = ["bidag_order_mcmc", "bidag_partition_mcmc"] 
    if alg not in has_input_algs:
        json_string.update({val["id"]: expand(pattern_strings[alg], **val)
                        for val in config["resources"]["structure_learning_algorithms"][alg]})


# These are special and have to be the last one since they take input strings as start space.
# The start space path has to be gnerated first.
if "bidag_order_mcmc" in pattern_strings:
    order_mcmc_list = config["resources"]["structure_learning_algorithms"]["bidag_order_mcmc"]
    for items in order_mcmc_list:    
        items["startspace_algorithm"] = idtopath(items["startspace_algorithm"], json_string)

    json_string.update({val["id"]: expand(pattern_strings["bidag_order_mcmc"]+"/"+pattern_strings["mcmc_est"], **val,) 
                        for val in order_mcmc_list } )



if "bidag_partition_mcmc" in pattern_strings:
    bidag_partition_mcmc_list = config["resources"]["structure_learning_algorithms"]["bidag_partition_mcmc"]
    # The path to the startspace algorithm is extended here
    for items in bidag_partition_mcmc_list:    
        items["startspace_algorithm"] = idtopath(items["startspace_algorithm"], json_string)

    json_string.update({val["id"]: expand(pattern_strings["bidag_partition_mcmc"], **val,) 
                        for val in bidag_partition_mcmc_list } )


# parallelDG has MCMC estimator

for alg in mcmc_modules:
    if alg in pattern_strings:
        json_string.update({val["id"]: expand(pattern_strings[alg]+"/"+pattern_strings["mcmc_est"], **val)
                            for val in config["resources"]["structure_learning_algorithms"][alg]})

# Since we dont want the mcmc_est when we call the trajectory directly.
json_string_mcmc_noest = {}
if "bidag_order_mcmc" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["bidag_order_mcmc"], **val,) 
                        for val in order_mcmc_list } )
if "bidag_partition_mcmc" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["bidag_partition_mcmc"], **val,) 
                        for val in bidag_partition_mcmc_list } )
if "trilearn_pgibbs" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]:  expand(pattern_strings["trilearn_pgibbs"], **val)
                        for val in config["resources"]["structure_learning_algorithms"]["trilearn_pgibbs"]})
if "parallelDG" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]:  expand(pattern_strings["parallelDG"], **val)
                        for val in config["resources"]["structure_learning_algorithms"]["parallelDG"]})
if "gt13_multipair" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["gt13_multipair"], **val)
                        for val in config["resources"]["structure_learning_algorithms"]["gt13_multipair"]})
if "gg99_singlepair" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["gg99_singlepair"], **val)
                        for val in config["resources"]["structure_learning_algorithms"]["gg99_singlepair"]})
if "bdgraph" in pattern_strings:
    json_string_mcmc_noest.update({val["id"]: expand(pattern_strings["bdgraph"], **val)
                        for val in config["resources"]["structure_learning_algorithms"]["bdgraph"]})


# Evaluation strings
def gen_evaluation_string_from_conf(method, alg_id):
    # This essentially converts a dict in (from an evaluation method conf) to a path string following a pattern 
    # specified in pattern_strings.
    eval_dict = next(item for item in config["benchmark_setup"]["evaluation"][method] if item["id"] == alg_id)
    return expand(pattern_strings[method], **eval_dict)


# Graph strings
def gen_adjmat_string_from_conf(adjmat_id, seed):
    # find the adjmat_gen_method from adjmat_gen_id
    
    for module in config["resources"]["graph"]:
        if adjmat_id in [c["id"] for c in config["resources"]["graph"][module]]:
            adjmat_dict = next(item for item in config["resources"]["graph"][module] if item["id"] == adjmat_id)
            return expand(pattern_strings[module] + "/seed={seed}", **adjmat_dict, seed=seed)

    if adjmat_id is not None and Path("resources/adjmat/myadjmats/"+adjmat_id).is_file():
        filename_no_ext = os.path.splitext(os.path.basename(adjmat_id))[0]
        return  "myadjmats/" + filename_no_ext # this could be hepar2.csv e.g.

    elif adjmat_id is None:
        return None

# Parameter strings

def gen_parameter_string_from_conf(gen_method_id, seed):
    
    for module in config["resources"]["parameters"]:
        if gen_method_id in [c["id"] for c in config["resources"]["parameters"][module]]:        
            curconf = next(item for item in config["resources"]["parameters"][module] if item["id"] == gen_method_id)
            return expand(pattern_strings[module] + "/seed={seed}", **curconf, seed=seed)

    if Path("resources/parameters/myparams/bn.fit_networks/"+str(gen_method_id)).is_file():
        return  "bn.fit_networks/" + gen_method_id # gen_method_id could be hepar2.rds e.g.

    elif Path("resources/parameters/myparams/sem_params/"+str(gen_method_id)).is_file():
        return  "sem_params/" + gen_method_id # gen_method_id could be hepar2.rds e.g.

    elif gen_method_id is None:
        return None


# Data strings
def gen_data_string_from_conf(data_id, seed,seed_in_path=True):
    
    if Path("resources/data/mydatasets/"+data_id).is_file():
        num_lines = sum(1 for line in open("resources/data/mydatasets/"+data_id)) - 1
        return "fixed" + \
            "/filename="+data_id + \
            "/n="+str(num_lines) + \
            "/seed="+str(seed) 

    elif Path("resources/data/mydatasets/"+data_id).exists():        
        paths = Path("resources/data/mydatasets/").glob(data_id+'/*.csv')
        files = [x.name for x in paths if x.is_file()]

        return ["fixed" + \
                "/filename="+data_id + "/"+ f + \
                "/n="+str(None) + \
                "/seed="+str(seed) for f in files]

    elif data_id in [c["id"] for c in config["resources"]["data"]["iid"]]:
        # Find the data entry from the resources
        data = next(item for item in config["resources"]["data"]["iid"] if item["id"] == data_id)
        if seed_in_path: # seed_in_path is a hack..
            return expand("iid" +\
                            "/standardized={standardized}" + \
                            "/n={n}" + \
                            "/seed={seed}", 
                            n = data["sample_sizes"],
                            standardized = data["standardized"],
                            seed = seed)
        else:
            return expand("iid" +\
                        "/standardized={standardized}" + \
                            "/n={n}",
                            standardized = data["standardized"],
                            n = data["sample_sizes"])

    elif data_id in [c["id"] for c in config["resources"]["data"]["gcastle_iidsim"]]:
        # Find the data entry from the resources
        data = next(item for item in config["resources"]["data"]["gcastle_iidsim"] if item["id"] == data_id)
        if seed_in_path:
            return expand("gcastle_iidsim" +\
                            "/standardized={standardized}/" + \ 
                            "method={method}/" + \
                            "sem_type={sem_type}/" + \
                            "noise_scale={noise_scale}/" + \
                            "n={n}" + \
                            "/seed={seed}", 
                            method = data["method"],
                            sem_type = data["sem_type"],
                            noise_scale = data["noise_scale"],
                            n = data["n"],
                            standardized = data["standardized"],
                            seed = seed)
        else:
            return expand("gcastle_iidsim" +\
                            "/standardized={standardized}/" + \ 
                            "method={method}/" + \
                            "sem_type={sem_type}/" + \
                            "noise_scale={noise_scale}/" + \
                            "n={n}",
                            method = data["method"],
                            sem_type = data["sem_type"],
                            noise_scale = data["noise_scale"],
                            standardized = data["standardized"],
                            n = data["n"])
