import json
from jsonschema import validate
import snakemake.utils

configfile: 
    "config.json"


#print(type(config))
snakemake.utils.validate(config, 'schema/config.schema.json')

#with open('config.json') as json_file:
#    conf = json.load(json_file)

# Validate config.json file against the schema


#with open('schema/config.schema.json') as json_file:
#    schema = json.load(json_file)

#validate(instance=conf, schema=schema)

# Check that algorithm exists

available_conf_ids = []
for alg, alg_conf_avail in config["structure_learning_algorithms"].items():
    for alg_conf in alg_conf_avail:
        available_conf_ids.append(alg_conf["id"])   

for alg_conf_id in config["benchmark_setup"]["structure_learning_algorithms"]:
    if alg_conf_id not in available_conf_ids:
        raise Exception(alg_conf_id + " not available")

for alg_conf in config["structure_learning_algorithms"]["order_mcmc"]:
    if alg_conf["startspace"] not in set(available_conf_ids) - {c["id"] for c in config["structure_learning_algorithms"]["order_mcmc"]}:
        raise Exception(alg_conf["startspace"] + " not available startspace for order_mcmc."\
                        "The available are: "+str(list(set(available_conf_ids) - {c["id"] for c in config["structure_learning_algorithms"]["order_mcmc"]})))

def validate_data_setup(config, dict):
    # Check that adjmat exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["graph_sampling_algorithms"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])   

    if dict["graph"] not in available_conf_ids:
        raise Exception(dict["graph"] + 
                        " is not an available graph id. "
                        "The available graph id´s are: " + str(available_conf_ids))
    
    # Check that parameters exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["parameters_sampling_algorithms"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])   

    
    if dict["data"] not in [dataconf["id"] for dataconf in config["data_sampling_algorithms"]["fixed_data"]] and dict["parameters"] not in available_conf_ids:
        raise Exception(dict["parameters"] + 
                        " is not an available parameter id. "
                        "The available paremeter id´s are: " + str(available_conf_ids))

    # Check that data exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["data_sampling_algorithms"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])   

    if dict["data"] not in available_conf_ids:
        raise Exception(dict["data"] + 
                        " is not an available data id. "
                        "The available data id´s are: " + str(available_conf_ids))
    # Check that graph, parameters, and data are properly combined.

for data_setup in config["benchmark_setup"]["data"]:
    validate_data_setup(config, data_setup)

pattern_strings = {}
pattern_strings["greenthomas"] = "greenthomas/alg_params=/" \
                "n_samples={n_samples}/" \
                "randomits={randomits}/" \
                "penalty={penalty}"

pattern_strings["notears"] = "notears/alg_params=/" \
                "min_rate_of_progress={min_rate_of_progress}/" \
                "penalty_growth_rate={penalty_growth_rate}/" \
                "optimation_accuracy={optimation_accuracy}/" \
                "loss={loss}/" \
                "loss_grad={loss_grad}"

pattern_strings["blip"] = "blip/alg_params=/" \
                "time={max_time}/" \
                "scorer.method={scorermethod}/" \
                "solver.method={solvermethod}/" \
                "indeg={indeg}/" \        
                "cores={cores}/" \
                "allocated={allocated}/" \
                "scorefunction={scorefunction}/" \
                "alpha={alpha}/" \
                "verbose={verbose}"

pattern_strings["pcalg"] = "pcalg/alg_params=/"\
               "alpha={alpha}"

pattern_strings["mmhc"] = "mmhc/alg_params=/"\
               "alpha={alpha}"

pattern_strings["h2pc"] = "h2pc/alg_params=/"\
               "alpha={alpha}"

pattern_strings["interiamb"] = "interiamb/alg_params=/"\
               "alpha={alpha}"

pattern_strings["gs"] = "gs/alg_params=/"\
               "alpha={alpha}"

pattern_strings["tabu"] = "tabu/alg_params=/"\
               "score={score}/"\
               "iss={iss}/"\
               "iss.mu={issmu}/"\
               "l={l}/"\
               "k={k}/"\
               "prior={prior}/"\
               "beta={beta}"\

pattern_strings["hc"] = "hc/alg_params=/"\
               "perturb={perturb}/"\
               "restart={restart}/"\
               "score={score}/"\
               "iss={iss}/"\
               "iss.mu={issmu}/"\
               "l={l}/"\
               "k={k}/"\
               "prior={prior}/"\
               "beta={beta}"\

pattern_strings["gobnilp"] = "gobnilp/alg_params=/"\
                 "palim={palim}/" \
                 "alpha={alpha}/"\
                 "prune={prune}"

pattern_strings["itsearch"] = "itsearch/alg_params=/"\
                    "scoretype={scoretype}/"\
                    "chi={chi}/" \
                    "edgepf={edgepf}/" \
                    "am={am}/" \
                    "aw={aw}/" \
                    "map={MAP}/"\
                    "plus1it={plus1it}/"\
                    "posterior={posterior}"

pattern_strings["order_mcmc"] = "order_mcmc/alg_params=/"\
                    "scoretype={scoretype}/"\
                    "chi={chi}/" \
                    "edgepf={edgepf}/" \
                    "am={am}/" \
                    "aw={aw}/" \
                    "startspace_algorithm=/{startspace_algorithm}"

pattern_strings["mcmc_est"] = "estimation_method/"\
                  "threshold={threshold}/"\
                  "burnin={burnin}"

pattern_strings["trilearn_loglin"] = "trilearn_loglin/alg_params=/"\
                  "alpha={alpha}/"\
                  "beta={beta}/"\
                  "radii={radii}/"\
                  "pseudo_obs={pseudo_obs}/"\
                  "M={M}/"\
                  "N={N}" 

pattern_strings["fges"] = "fges/alg_params=/"\
               "score={score}/" \
               "data-type={datatype}/"\
               "faithfulnessAssumed={faithfulnessAssumed}"

pattern_strings["fci"] = "fci/alg_params=/"\
               "test={test}/" \
               "alpha={alpha}/" \
               "data-type={datatype}"

pattern_strings["gfci"] = "gfci/alg_params=/"\
               "test={test}/" \
               "alpha={alpha}/" \
               "score={score}/" \
               "data-type={datatype}"

pattern_strings["rfci"] = "rfci/alg_params=/"\
               "test={test}/" \
               "alpha={alpha}/" \
               "data-type={datatype}"

pattern_strings["evaluation"] = "evaluation/" \
                   "score_type={score_type}/" \
                   "chi={chi}/" \
                   "edgepf={edgepf}" 

json_string = {}

json_string = {val["id"]: expand(pattern_strings["greenthomas"], 
#                                        score_type="bdecat",
#                                           chi=conf["evaluation"]["score"]["bdecatpar"]["chi"],
#                                           edgepf=conf["evaluation"]["score"]["bdecatpar"]["edgepf"],
                                           n_samples=val["n_samples"],
                                           randomits=val["randomits"],
                                           penalty=val["penalty"])
                    for val in config["structure_learning_algorithms"]["greenthomas"]}

json_string.update({val["id"]: expand(pattern_strings["itsearch"], 
                                            scoretype=val["optional"]["scoretype"],
                                            chi=val["optional"]["chi"],
                                           edgepf=val["optional"]["edgepf"],
                                           am=val["optional"]["am"],
                                           aw=val["optional"]["aw"],
                                           MAP=val["optional"]["MAP"],
                                           plus1it=val["optional"]["plus1it"],
                                           posterior=val["optional"]["posterior"]) 
                    for val in config["structure_learning_algorithms"]["itsearch"]})

json_string.update({val["id"]: expand(pattern_strings["fges"], 
                                           faithfulnessAssumed=val["faithfulnessAssumed"],
                                           datatype=val["data-type"],
                                           score=val["score"]) 
                    for val in config["structure_learning_algorithms"]["fges"]})

json_string.update({val["id"]: expand(pattern_strings["notears"], 
                                           min_rate_of_progress=val["min_rate_of_progress"],
                                           penalty_growth_rate=val["penalty_growth_rate"],
                                           optimation_accuracy=val["optimation_accuracy"],
                                           loss=val["loss"],
                                           loss_grad=val["loss_grad"]
                                           ) 
                    for val in config["structure_learning_algorithms"]["notears"]})


json_string.update({val["id"]: expand(pattern_strings["fci"], 
                                           alpha=val["alpha"],
                                           datatype=val["data-type"],
                                           test=val["test"]) 
                    for val in config["structure_learning_algorithms"]["fci"]})

json_string.update({val["id"]: expand(pattern_strings["gfci"], 
                                           alpha=val["alpha"],
                                           score=val["score"],
                                           datatype=val["data-type"],
                                           test=val["test"]) 
                    for val in config["structure_learning_algorithms"]["gfci"]})

json_string.update({val["id"]: expand(pattern_strings["rfci"], 
                                           alpha=val["alpha"],
                                           datatype=val["data-type"],
                                           test=val["test"]) 
                    for val in config["structure_learning_algorithms"]["rfci"]})

json_string.update({val["id"]: expand(pattern_strings["pcalg"], 
                                           alpha=val["alpha"])  
                    for val in config["structure_learning_algorithms"]["pcalg"]})

json_string.update({val["id"]: expand(pattern_strings["mmhc"], 
                                           alpha=val["restrict.args"]["alpha"])  
                    for val in config["structure_learning_algorithms"]["mmhc"]} )

json_string.update({val["id"]: expand(pattern_strings["h2pc"], 
                                           alpha=val["restrict.args"]["alpha"])  
                    for val in config["structure_learning_algorithms"]["h2pc"]} )

json_string.update({val["id"]: expand(pattern_strings["interiamb"], 
                                           alpha=val["alpha"])  
                    for val in config["structure_learning_algorithms"]["interiamb"]} )

json_string.update({val["id"]: expand(pattern_strings["gs"], 
                                           alpha=val["alpha"])  
                    for val in config["structure_learning_algorithms"]["gs"]} )

json_string.update({val["id"]: expand(pattern_strings["gobnilp"],
                                                palim=val["palim"],
                                                alpha=val["alpha"],
                                                prune=val["prune"]
                                                )
                for val in config["structure_learning_algorithms"]["gobnilp"]})

json_string.update({val["id"]:  expand(pattern_strings["tabu"], 
                                                    score=val["score"],
                                                    iss=val["iss"],
                                                    issmu=val["iss.mu"],
                                                    l=val["l"],
                                                    k=val["k"],
                                                    prior=val["prior"],
                                                    beta=val["beta"]
                                                    )
                for val in config["structure_learning_algorithms"]["tabu"]})

json_string.update({val["id"]:  expand(pattern_strings["hc"], 
                                                    perturb=val["perturb"],
                                                    restart=val["restart"],
                                                    score=val["score"],
                                                    iss=val["iss"],
                                                    issmu=val["iss.mu"],
                                                    l=val["l"],
                                                    k=val["k"],
                                                    prior=val["prior"],
                                                    beta=val["beta"]
                                                    )
                for val in config["structure_learning_algorithms"]["hc"]})

json_string.update({val["id"]: expand(pattern_strings["trilearn_loglin"] +"/"+pattern_strings["mcmc_est"], 
                    alpha=val["alpha"],
                    beta=val["beta"],
                    N=val["N"],
                    M=val["M"],
                    pseudo_obs=val["pseudo_obs"],
                    radii=val["radii"],
                    threshold=val["threshold"],
                    burnin=val["burnin"],
                    )
               for val in config["structure_learning_algorithms"]["trilearn_loglin"]})

json_string.update({val["id"]: expand(pattern_strings["blip"], 
                                            max_time=val["time"],
                                            solvermethod=val["solver.method"],
                                            scorermethod=val["scorer.method"],
                                            indeg=val["indeg"],
                                            cores=val["cores"],
                                            allocated=val["allocated"],
                                            scorefunction=val["scorefunction"],
                                            alpha=val["alpha"],
                                            verbose=val["verbose"]
                                            )
                for val in config["structure_learning_algorithms"]["blip"]})

# This has to be the last one since it takes input strings as start space...
json_string.update({val["id"]: expand(pattern_strings["order_mcmc"]+"/"+pattern_strings["mcmc_est"], 
                                            scoretype=val["scoretype"],
                                            chi=val["chi"],
                                            edgepf=val["edgepf"],
                                            am=val["am"],
                                            aw=val["aw"],
                                            startspace_algorithm=json_string[val["startspace"]],
                                            threshold=val["threshold"],
                                            burnin=val["burnin"],)  
                    for val in config["structure_learning_algorithms"]["order_mcmc"] } )


def adjmat_estimate_path_mcmc(algorithm):
    ret = config["output_dir"]+"/adjmat_estimate/"\
                        "adjmat=/{adjmat}/"\
                        "bn=/{bn}/"\
                        "data=/{data}/"\
                        "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/" \
                        "seed={replicate}/" \
                        "adjmat.csv"
    return ret

def time_path(algorithm):
    ret = config["output_dir"]+"/time/"\
                    "adjmat=/{adjmat}/"\
                    "bn=/{bn}/"\
                    "data=/{data}/"\
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"
    return ret

def result_path_mcmc(algorithm):
    res = config["output_dir"]+"/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/"\
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\   
            "seed={replicate}/" \
            "legend={plot_legend}/" \        
            "result.csv"
    return res

def data_path():
    return config["output_dir"]+"/data/adjmat=/{adjmat}/bn=/{bn}/data=/{data}/seed={replicate}.csv"

def adjmat_true_path():
    return config["output_dir"]+"/adjmat/{adjmat}.csv",

def get_seed_range(seed_range):
    if seed_range == None:
        return [1]
    else:
        return range(seed_range[0], seed_range[1]+1)

# def adjmat_plots(algorithm, mode="result"):
#     ret = [[[expand(config["output_dir"] + "/adjmat_plots/"\
#             "adjmat=/{adjmat_string}/"
#             "bn=/{param_string}/"
#             "data=/{data_string}/"
#             "algorithm=/{alg_string}/"
#             "adjmat.eps",
#             alg_string=json_string[alg_conf["id"]],
#             #plot_legend=alg_conf["plot_legend"],
#             #seed=seed,
#             adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph"], seed), 
#             param_string=gen_parameter_string_from_conf(sim_setup["parameters"], seed),
#             data_string=gen_data_string_from_conf(sim_setup["data"], seed))
#             for seed in get_seed_range(sim_setup["seed_range"])]
#             for sim_setup in config["benchmark_setup"]["data"]]
#             for alg_conf in config["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["structure_learning_algorithms"]],
#     return ret

def join_string_sampled_model(algorithm, mode="result"):
    ret = [[[expand(config["output_dir"] + "/"+mode+"/"\        
            "algorithm=/{alg_string}/"
            "adjmat=/{adjmat_string}/"
            "bn=/{param_string}/"
            "data=/{data_string}/"
            "legend={plot_legend}/" 
            + mode + ".csv",
            alg_string=json_string[alg_conf["id"]],
            plot_legend=alg_conf["plot_legend"],
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data"], seed))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["structure_learning_algorithms"]],
    return ret

def join_string_sampled_model_mcmc(algorithm, mode="result"):
    ret = [[[expand(config["output_dir"] + "/"+mode+"/"\        
                        "algorithm=/{algorithm_string}/" 
                        "adjmat=/{adjmat_string}/"
                        "bn=/{param_string}/"
                        "data=/{data_string}/"                       
                        "legend={plot_legend}/" # /output_parameters=/legend={plot_legend}/
                        +mode+".csv",
            threshold=alg_conf["threshold"], # only for mcmc
            burnin=alg_conf["burnin"], # only for mcmc
            plot_legend=alg_conf["plot_legend"], 
            algorithm_string=json_string[alg_conf["id"]],
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data"], seed)
            )
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["structure_learning_algorithms"]]
    return ret

def join_summaries_shell(algorithm):
    return "Rscript scripts/join_csv_files.R --algorithm "+algorithm+" --filename {output} --files {input.res} "  \
            " && sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

def join_summaries_output(algorithm):
    return config["output_dir"] + "/"+algorithm+".csv"

def gen_model_strings_from_conf(models, seed, setup):
    """
    Generate the graphs and paremeters simulatnepusly since we do not want 
    every combiantion of graphs and paramters.
    Maybe this should be part of the setup? -No, this part belongs to the method step, 
    not the model/data simulation step.
    There are 3 steps.
    1. Specify the models.
    2. Generate data sets from the models.
    3. Run a nunmber of structure learningn algortithms on th dataset.
    """
    pass

def gen_adjmat_string_from_conf(adjmat_id, seed):
    with open('config.json') as json_file:
        conf = json.load(json_file)
    # find the adjmat_gen_method from adjmat_gen_id
    # Maybe fill up a dict as for structure learning algortihms
    # Then we would loose the seed.
    
    if adjmat_id in [c["id"] for c in config["graph_sampling_algorithms"]["generateDAGMaxParents"]]:
        adjmat_dict = next(item for item in config["graph_sampling_algorithms"]["generateDAGMaxParents"] if item["id"] == adjmat_id)
        return expand("generateDAGMaxParents" + \
            "/p={p}" + \
            "/avpar={av_parents}" + \
            "/seed={seed}",
            av_parents=adjmat_dict["av_parents"], 
            p=adjmat_dict["dims"],
            seed=seed)

    elif adjmat_id in [c["id"] for c in config["graph_sampling_algorithms"]["fixed_adjmats"]]:
        adjmat_dict = next(item for item in config["graph_sampling_algorithms"]["fixed_adjmats"] if item["id"] == adjmat_id)
        # This means the id is the conf, and it takes everything in a folder?
        filename_no_ext = os.path.splitext(os.path.basename(adjmat_dict["filename"]))[0]
        return  "myadjmats/" + filename_no_ext # this could be hepar2 e.g.

    elif adjmat_id in [c["id"] for c in config["graph_sampling_algorithms"]["bn.fit_adjmats"]]:
        # This means the id is the conf, and it takes everything in a folder?
        return  "bn.fit_adjmats/" + adjmat_id # this could be hepar2 e.g.

    elif adjmat_id == "notears":
        adjmat_dict = next(item for item in config["graph_sampling_algorithms"]["notears"] if item["id"] == adjmat_id)
        return expand("notears/" \
                        "num_nodes={num_nodes}/" \
                        "num_edges={num_edges}/"\
                        "seed={seed}",
                        num_nodes=adjmat_dict["num_nodes"],
                        num_edges=adjmat_dict["num_edges"],
                        seed=seed)
                        
    elif adjmat_id is None:
        return None

def gen_parameter_string_from_conf(gen_method_id, seed):
    with open('config.json') as json_file:
        conf = json.load(json_file)

    if gen_method_id in [c["id"] for c in config["parameters_sampling_algorithms"]["generateBinaryBN"]]:        
        curconf = next(item for item in config["parameters_sampling_algorithms"]["generateBinaryBN"] if item["id"] == gen_method_id)
        return expand("generateBinaryBN" + \
                        "/min={min}" + \
                        "/max={max}" + \
                        "/seed={seed}",
                        min=curconf["min"], 
                        max=curconf["max"],
                        seed=seed)

    elif gen_method_id in [c["id"] for c in config["parameters_sampling_algorithms"]["bn.fit_networks"]]:
        return "bn.fit_networks/"+gen_method_id

    elif gen_method_id == "notears":
        curconf = next(item for item in config["parameters_sampling_algorithms"]["notears"] if item["id"] == gen_method_id)
        return expand("notears/" \
                      "edge_coefficient_range_from={edge_coefficient_range_from}/"\
                      "edge_coefficient_range_to={edge_coefficient_range_to}/"\
                      "seed={seed}",
                        edge_coefficient_range_from=curconf["edge_coefficient_range_from"],
                        edge_coefficient_range_to=curconf["edge_coefficient_range_to"],
                        seed=seed)

    elif gen_method_id is None:
        return None

def gen_data_string_from_conf(data_id, seed):
    if data_id in [c["id"] for c in config["data_sampling_algorithms"]["fixed_data"]]:
        data = next(item for item in config["data_sampling_algorithms"]["fixed_data"] if item["id"] == data_id)        
        return "fixed" + \
                "/name="+data["filename"] + \
                "/n="+str(data["samples"]) + \ 
                "/seed="+str(seed) # TODO: this may cause som error with seed somewhere

    elif data_id in [c["id"] for c in config["data_sampling_algorithms"]["standard_sampling"]]:
        data = next(item for item in config["data_sampling_algorithms"]["standard_sampling"] if item["id"] == data_id)
        return expand("standard_sampling" +\
                        "/n={n}" + \
                        "/seed={seed}", 
                        n = data["sample_sizes"],
                        seed = seed)

    elif data_id in [c["id"] for c in config["data_sampling_algorithms"]["notears_linear_gaussian_sampling"]]:
        data = next(item for item in config["data_sampling_algorithms"]["notears_linear_gaussian_sampling"] if item["id"] == data_id)
        return expand("notears_linear_gaussian_sampling" +\
                        "/n={n}" + \
                        "/mean={mean}" + \
                        "/variance={variance}" + \
                        "/seed={seed}", 
                        n = data["sample_sizes"],
                        mean = data["mean"],
                        variance = data["variance"],
                        seed = seed)

def active_algorithm_files(wildcards):
    with open('config.json') as json_file:
        conf = json.load(json_file)
    algs = []

    for alg, alg_conf_list in config["structure_learning_algorithms"].items():     
        for alg_conf_id in config["benchmark_setup"]["structure_learning_algorithms"]:
            if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(conf["output_dir"] + "/" + alg + ".csv")
    return algs

def alg_output_adjmat_path(algorithm):
    return config["output_dir"]+"/adjmat_estimate/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "adjmat.csv"

def alg_output_adjvecs_path(algorithm):
    return config["output_dir"]+"/adjvecs/{data}/"\
                "algorithm=/"  + pattern_strings[algorithm] + "/"  + \
                "seed={replicate}/" \
                "adjvecs.json"

def alg_output_time_path(algorithm):
    return config["output_dir"] + "/time/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "time.txt"

def alg_input_data():
    return config["output_dir"]+"/data/{data}/seed={replicate}.csv"

def alg_shell(algorithm):
    if algorithm == "greenthomas":
        #"&& /usr/bin/time -f \"%e\" -o {output.time} " \  
        return "tail -n +3 {input.data} > {input.data}.noheader " \    
            "&& cd scripts/thomasgreen && java EstimateMultinomialGM -v 0 " \
            "-s 0 "\
            "-n {wildcards.n_samples} "\
            "-r {wildcards.randomits} "\
            "-p {wildcards.penalty} < ../{input.data}.noheader > ../{output.adjmat}.adjlist " \
            "&& python scripts/adjlist_to_adjmat.py ../{output.adjmat}.adjlist ../{output.adjmat} " \
            "&& rm ../{output.adjmat}.adjlist ../{input.data}.noheader "\
            "&& echo 1 > ../{output.time}"

    elif algorithm == "notears":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "python scripts/notears/run_notears.py " \
            "--data_filename {input.data} " \
            "--min_rate_of_progress {wildcards.min_rate_of_progress} " \
            "--penalty_growth_rate {wildcards.penalty_growth_rate} " \
            "--optimation_accuracy {wildcards.optimation_accuracy} " \
            "--loss {wildcards.loss} " \
            "--loss_grad {wildcards.loss_grad} " \
            "--filename {output.adjmat} " \     
            "--seed {wildcards.replicate}"        

    elif algorithm == "tabu":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "Rscript scripts/run_tabu.R " \
            "--filename_data {input.data} " \
            "--output_dir {config[output_dir]} " \
            "--score {wildcards.score} " \
            "--iss {wildcards.iss} " \
            "--iss.mu {wildcards.issmu} " \
            "--l {wildcards.l} " \
            "--k {wildcards.k} " \
            "--prior {wildcards.prior} " \
            "--beta {wildcards.beta} " \
            "--filename {output.adjmat} " 

    if algorithm == "hc":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
            "Rscript scripts/run_hc.R " \
            "--filename_data {input.data} " \
            "--output_dir {config[output_dir]} " \
            "--perturb {wildcards.perturb} " \
            "--restart {wildcards.restart} " \
            "--score {wildcards.score} " \
            "--iss {wildcards.iss} " \
            "--iss.mu {wildcards.issmu} " \
            "--l {wildcards.l} " \
            "--k {wildcards.k} " \
            "--prior {wildcards.prior} " \
            "--beta {wildcards.beta} " \
            "--filename {output.adjmat} " 

    elif algorithm == "blip":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_blip.R " \
                "--filename_data {input.data} " \
                "--output_dir {config[output_dir]} " \
                "--time {wildcards.max_time} " \
                "--scorer.method {wildcards.scorermethod} " \
                "--solver.method {wildcards.solvermethod} " \
                "--indeg {wildcards.indeg} " \  
                "--cores {wildcards.cores} " \
                "--allocated {wildcards.allocated} " \
                "--scorefunction {wildcards.scorefunction} " \
                "--alpha {wildcards.alpha} " \
                "--verbose {wildcards.verbose} " \
                "--filename {output.adjmat} " 
                
    elif algorithm == "itsearch":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_iterative_search.R "\
                "--filename_data {input.data} "\
                "--filename {output.adjmat} " \
                "--output_dir {config[output_dir]} "\
                "--seed {wildcards.replicate} "\
                "--map {wildcards.MAP} "\
                "--scoretype {wildcards.scoretype} " \
                "--chi {wildcards.chi} " \
                "--edgepf {wildcards.edgepf} " \
                "--am {wildcards.am} " \
                "--aw {wildcards.aw} " \
                "--plus1it {wildcards.plus1it} " \
                "--posterior {wildcards.posterior} " \
                "--title itsearch"

    elif algorithm == "pcalg":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_pcalg.R " \
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {config[output_dir]} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "mmhc":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_mmhc.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {config[output_dir]} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "h2pc":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_h2pc.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {config[output_dir]} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "interiamb":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_inter-iamb.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {config[output_dir]} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "gs":
        return  "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_gs.R "\
                "--filename_data {input.data} "\
                "--alpha {wildcards.alpha} "\
                "--output_dir {config[output_dir]} "\
                "--seed {wildcards.replicate} "\
                "--filename {output.adjmat} "

    elif algorithm == "gobnilp":
        return "touch {output.adjmat}.gobnilp.set && " \   
                "echo 'gobnilp/outputfile/adjacencymatrix = \"{output.adjmat}.bn.mat\" ' > {output.adjmat}.gobnilp.set &&" \
                "echo 'gobnilp/outputfile/scoreandtime = \"{output.adjmat}.score_and_time.txt\" ' >> {output.adjmat}.gobnilp.set &&" \
                "echo 'gobnilp/scoring/palim = {wildcards.palim} ' >> {output.adjmat}.gobnilp.set && " \     
                "echo 'gobnilp/scoring/alpha = {wildcards.alpha} ' >> {output.adjmat}.gobnilp.set && " \
                "echo 'gobnilp/scoring/prune = {wildcards.prune} ' >> {output.adjmat}.gobnilp.set && " \     
                "/myappdir/gobnilp163/bin/gobnilp -f=dat -g={output.adjmat}.gobnilp.set {input.data} " \
                " && cat {output.adjmat}.bn.mat > {output.adjmat} " \
                " && cat {output.adjmat}.score_and_time.txt > {output.time} " \ 
                " && rm {output.adjmat}.bn.mat " \
                " && rm {output.adjmat}.score_and_time.txt " \
                " && rm {output.adjmat}.gobnilp.set"

    elif algorithm ==  "fges":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar scripts/tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm fges "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--score {wildcards.score} "\
                "--json-graph "\
                "--structurePrior 1 "\
                "--prefix {output.adjmat} " \
                '&& Rscript scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'

    elif algorithm ==  "fci":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm fci "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--test {wildcards.test} "\
                "--alpha {wildcards.alpha} "\
                "--json-graph "\                
                "--prefix {output.adjmat} " \
                '&& Rscript scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'
                
    elif algorithm ==  "gfci":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm gfci "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--test {wildcards.test} "\
                "--alpha {wildcards.alpha} "\
                "--score {wildcards.score} "\
                "--structurePrior 1 "\
                "--json-graph "\                
                "--prefix {output.adjmat} " \
                '&& Rscript scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'

    elif algorithm ==  "rfci":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "java -jar causal-cmd-1.1.3-jar-with-dependencies.jar " \
                "--algorithm rfci "\
                "--data-type {wildcards.datatype} "\
                "--dataset {input.data} "\
                "--delimiter space " \
                "--test {wildcards.test} "\
                "--alpha {wildcards.alpha} "\
                "--json-graph "\                
                "--prefix {output.adjmat} " \
                '&& Rscript scripts/tetrad_graph_to_adjmat.R ' \
                '--jsongraph {output.adjmat}_graph.json ' \
                '--filename {output.adjmat} ' \
                '&& ' \
                'rm {output.adjmat}_graph.json ' \
                '&& ' \
                'rm {output.adjmat}.txt'

    elif algorithm == "order_mcmc":
        return "/usr/bin/time -f \"%e\" -o {output.time} " \  
                "Rscript scripts/run_order_mcmc.R " \
                "--filename {output.adjvecs} " \
                "--filename_data {input.data} " \
                "--filename_startspace {input.startspace} " \   
                "--scoretype {wildcards.scoretype} " \
                "--chi {wildcards.chi} " \
                "--edgepf {wildcards.edgepf} " \
                "--aw {wildcards.aw} " \
                "--am {wildcards.am} " \
                "--output_dir {config[output_dir]} " \
                "--seed {wildcards.replicate} "

    elif algorithm == "trilearn_loglin":
        return "cp {input} {input}.tmp.csv " \
                "&& sed --in-place 's/\ /,/g' {input.data}.tmp.csv " \
                "&& pgibbs_loglinear_sample -N {wildcards.N} -M {wildcards.M} -f {input.data}.tmp.csv -o . -F {output.adjvecs} " \
                "&& rm {input.data}.tmp.csv " \
                "&& echo '1' > {output.time} "

def docker_image(algorithm):
    if algorithm == "trilearn_loglin":
        return "docker://onceltuca/trilearn:1.1"
    elif algorithm == "gobnilp":
        return "docker://onceltuca/gobnilp:1.6.3"
    elif algorithm == "greenthomas":
        return "docker://onceltuca/thomasgreen:1.0"
    elif algorithm == "notears":
        return "docker://onceltuca/jmoss20notears:1.4"

def summarise_alg_input_data_path():
    return config["output_dir"]+"/data/adjmat=/{adjmat}/bn=/{bn}/data=/{data}/seed={replicate}.csv"

def summarise_alg_input_adjmat_true_path():
    return config["output_dir"]+"/adjmat/{adjmat}.csv"

def summarise_alg_input_adjmat_est_path(algorithm):
    return config["output_dir"]+"/adjmat_estimate/"\
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "seed={replicate}/" \
            "adjmat.csv",

def summarise_alg_input_time_path(algorithm):
    return config["output_dir"]+"/time/"\
                    "adjmat=/{adjmat}/"\
                    "bn=/{bn}/"\
                    "data=/{data}/" \ 
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"

def summarise_alg_output_res_path(algorithm):
    return config["output_dir"]+"/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\
            "seed={replicate}/" \
            "legend={plot_legend}/" \        
            "result.csv"

def summarise_alg_shell(algorithm):
    if algorithm == "greenthomas":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python scripts/add_column.py --filename {output} --colname algorithm       --colval greenthomas " \
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname n_samples       --colval {wildcards.n_samples} " \
                " && python scripts/add_column.py --filename {output} --colname randomits       --colval {wildcards.randomits} " \
                " && python scripts/add_column.py --filename {output} --colname penalty         --colval {wildcards.penalty} " \                
                " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend          --colval {wildcards.plot_legend} " 

    elif algorithm == "tabu":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python scripts/add_column.py --filename {output} --colname algorithm       --colval tabu " \
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python scripts/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python scripts/add_column.py --filename {output} --colname iss.mu          --colval {wildcards.issmu} " \
                " && python scripts/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python scripts/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python scripts/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python scripts/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python scripts/add_column.py --filename {output} --colname start           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python scripts/add_column.py --filename {output} --colname tabu            --colval 10 " \
                " && python scripts/add_column.py --filename {output} --colname max.tabu        --colval tabu " \
                " && python scripts/add_column.py --filename {output} --colname max.iter        --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend          --colval {wildcards.plot_legend} " 

    elif algorithm == "notears":
        return         "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--range_header_data 1 " \ 
        "--filename {output.res} " \ 
        " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python scripts/add_column.py --filename {output} --colname algorithm       --colval notears " \
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python scripts/add_column.py --filename {output} --colname min_rate_of_progress        --colval {wildcards.min_rate_of_progress} " \
        " && python scripts/add_column.py --filename {output} --colname penalty_growth_rate        --colval {wildcards.penalty_growth_rate} " \
        " && python scripts/add_column.py --filename {output} --colname optimation_accuracy         --colval {wildcards.optimation_accuracy} " \
        " && python scripts/add_column.py --filename {output} --colname loss                        --colval {wildcards.loss} " \ 
        " && python scripts/add_column.py --filename {output} --colname loss_grad           --colval {wildcards.loss_grad} " \
        " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python scripts/add_column.py --filename {output} --colname legend          --colval {wildcards.plot_legend} " 

    if algorithm == "hc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output.res} " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
                " && python scripts/add_column.py --filename {output} --colname algorithm       --colval hc " \
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname score           --colval {wildcards.score} " \
                " && python scripts/add_column.py --filename {output} --colname iss             --colval {wildcards.iss} " \
                " && python scripts/add_column.py --filename {output} --colname iss.mu          --colval {wildcards.issmu} " \
                " && python scripts/add_column.py --filename {output} --colname l               --colval {wildcards.l} " \
                " && python scripts/add_column.py --filename {output} --colname k               --colval {wildcards.k} " \
                " && python scripts/add_column.py --filename {output} --colname prior           --colval {wildcards.prior} " \
                " && python scripts/add_column.py --filename {output} --colname beta            --colval {wildcards.beta} " \
                " && python scripts/add_column.py --filename {output} --colname start           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist       --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug           --colval false " \ 
                " && python scripts/add_column.py --filename {output} --colname perturb         --colval {wildcards.perturb} " \
                " && python scripts/add_column.py --filename {output} --colname restart         --colval {wildcards.restart} " \
                " && python scripts/add_column.py --filename {output} --colname max.iter        --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname maxp            --colval Inf " \
                " && python scripts/add_column.py --filename {output} --colname optimized       --colval true " \
                " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend          --colval {wildcards.plot_legend} " 

    elif algorithm == "blip":
        return "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--range_header_data 1 " \ 
        "--filename {output.res} " \ 
        " && python scripts/add_column.py --filename {output} --colname replicate       --colval {wildcards.replicate} " \
        " && python scripts/add_column.py --filename {output} --colname algorithm       --colval blip " \
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python scripts/add_column.py --filename {output} --colname max_time        --colval {wildcards.max_time} " \
        " && python scripts/add_column.py --filename {output} --colname scorer.method   --colval {wildcards.scorermethod} " \
        " && python scripts/add_column.py --filename {output} --colname solver.method   --colval {wildcards.solvermethod} " \
        " && python scripts/add_column.py --filename {output} --colname indeg           --colval {wildcards.indeg} " \ 
        " && python scripts/add_column.py --filename {output} --colname cores           --colval {wildcards.cores} " \
        " && python scripts/add_column.py --filename {output} --colname allocated       --colval {wildcards.allocated} " \
        " && python scripts/add_column.py --filename {output} --colname scorefunction   --colval {wildcards.scorefunction} " \
        " && python scripts/add_column.py --filename {output} --colname alpha           --colval {wildcards.alpha} " \
        " && python scripts/add_column.py --filename {output} --colname verbose         --colval {wildcards.verbose} " \
        " && python scripts/add_column.py --filename {output} --colname time            --colval `cat {input.time}` " \
        " && python scripts/add_column.py --filename {output} --colname legend          --colval {wildcards.plot_legend} " 

    elif algorithm == "itsearch":
        return "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--filename {output} " \ 
        "--range_header_data 1 " \ 
        " && python scripts/add_column.py --filename {output} --colname replicate     --colval {wildcards.replicate} "\
        " && python scripts/add_column.py --filename {output} --colname algorithm     --colval itsearch "\
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
        " && python scripts/add_column.py --filename {output} --colname plus1it       --colval {wildcards.plus1it} " \
        " && python scripts/add_column.py --filename {output} --colname moveprobs     --colval null " \
        " && python scripts/add_column.py --filename {output} --colname MAP           --colval {wildcards.MAP} " \            
        " && python scripts/add_column.py --filename {output} --colname posterior     --colval {wildcards.posterior} " \
        " && python scripts/add_column.py --filename {output} --colname iterations    --colval null " \
        " && python scripts/add_column.py --filename {output} --colname stepsave      --colval null " \
        " && python scripts/add_column.py --filename {output} --colname softlimit     --colval 9 " \ 
        " && python scripts/add_column.py --filename {output} --colname hardlimit     --colval 12 " \ 
        " && python scripts/add_column.py --filename {output} --colname alpha         --colval 0.05 " \ 
        " && python scripts/add_column.py --filename {output} --colname gamma         --colval 1  " \ 
        " && python scripts/add_column.py --filename {output} --colname startspace    --colval null " \ 
        " && python scripts/add_column.py --filename {output} --colname blacklist     --colval null " \ 
        " && python scripts/add_column.py --filename {output} --colname verbose       --colval true " \
        " && python scripts/add_column.py --filename {output} --colname chainout      --colval true " \
        " && python scripts/add_column.py --filename {output} --colname scoreout      --colval true " \
        " && python scripts/add_column.py --filename {output} --colname cpdag         --colval false " \
        " && python scripts/add_column.py --filename {output} --colname mergetype     --colval skeleton " \
        " && python scripts/add_column.py --filename {output} --colname addspace      --colval null " \
        " && python scripts/add_column.py --filename {output} --colname scoretable    --colval null " \
        " && python scripts/add_column.py --filename {output} --colname startorder    --colval null " \
        " && python scripts/add_column.py --filename {output} --colname accum         --colval false " \
        " && python scripts/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
        " && python scripts/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
        " && python scripts/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
        " && python scripts/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
        " && python scripts/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
        " && python scripts/add_column.py --filename {output} --colname time         --colval `cat {input.time}` "  \
        " && python scripts/add_column.py --filename {output} --colname legend        --colval {wildcards.plot_legend} "  

    elif algorithm == "pcalg":
        return "Rscript scripts/run_summarise.R " \
        "--adjmat_true {input.adjmat_true} " \
        "--adjmat_est {input.adjmat_est} " \
        "--filename_data {input.data} " \
        "--filename {output} " \ 
        "--range_header_data 1 " \ 
        " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
        " && python scripts/add_column.py --filename {output} --colname algorithm   --colval pcalg "\
        " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
        " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
        " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
        " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
        " && python scripts/add_column.py --filename {output} --colname fixedGaps   --colval null " \
        " && python scripts/add_column.py --filename {output} --colname fixedEdges  --colval null " \
        " && python scripts/add_column.py --filename {output} --colname NAdelete    --colval true " \
        " && python scripts/add_column.py --filename {output} --colname m.max       --colval inf " \
        " && python scripts/add_column.py --filename {output} --colname conservative --colval false " \
        " && python scripts/add_column.py --filename {output} --colname maj.rule     --colval false " \
        " && python scripts/add_column.py --filename {output} --colname solve.confl  --colval false " \
        " && python scripts/add_column.py --filename {output} --colname numCores     --colval 1 " \
        " && python scripts/add_column.py --filename {output} --colname verbose      --colval false " \
        " && python scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` "  \
        " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} " 

    elif algorithm == "mmhc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval mmhc "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname maximize.args   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  

    elif algorithm == "h2pc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval h2pc "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname whitelist   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname maximize.args   --colval null " \
                " && python scripts/add_column.py --filename {output} --colname time          --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  

    elif algorithm == "interiamb":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm        --colval interiamb "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname test             --colval null " \
                " && python scripts/add_column.py --filename {output} --colname B                --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug            --colval false " \
                " && python scripts/add_column.py --filename {output} --colname max.sx           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname undirected       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend           --colval {wildcards.plot_legend} " 
                
    elif algorithm == "gs":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate        --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm        --colval gs "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn               --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data             --colval {wildcards.data} "  \       
                " && python scripts/add_column.py --filename {output} --colname alpha            --colval {wildcards.alpha} " \
                " && python scripts/add_column.py --filename {output} --colname cluster          --colval null " \
                " && python scripts/add_column.py --filename {output} --colname whitelist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname blacklist        --colval null " \
                " && python scripts/add_column.py --filename {output} --colname test             --colval null " \
                " && python scripts/add_column.py --filename {output} --colname B                --colval null " \
                " && python scripts/add_column.py --filename {output} --colname debug            --colval false " \
                " && python scripts/add_column.py --filename {output} --colname max.sx           --colval null " \
                " && python scripts/add_column.py --filename {output} --colname undirected       --colval false " \
                " && python scripts/add_column.py --filename {output} --colname time             --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend           --colval {wildcards.plot_legend} " 

    elif algorithm == "fges":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval fges "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname faithfulnessAssumed       --colval {wildcards.faithfulnessAssumed} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  

    elif algorithm == "fci":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval fci "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  

    elif algorithm == "gfci":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval gfci "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname score       --colval {wildcards.score} "\
                " && python scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  \

    elif algorithm == "rfci":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval rfci "\
                " && python scripts/add_column.py --filename {output} --colname adjmat           --colval {wildcards.adjmat} " \
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} " \
                " && python scripts/add_column.py --filename {output} --colname data           --colval {wildcards.data} " \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname test       --colval {wildcards.test} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  
    
    elif algorithm=="gobnilp":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--filename {output.res} " \ 
                "--range_header_data 1 " \ 
                "--adjmat_header 0 " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval gobnilp "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python scripts/add_column.py --filename {output} --colname palim       --colval {wildcards.palim} "\
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname prune       --colval {wildcards.prune} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time} | grep -Eo '[0-9]\.[0-9]*$'` " \
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  

    elif algorithm == "trilearn_loglin":
        return "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output} " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval trilearn_loglin "\
                " && python scripts/add_column.py --filename {output} --colname adjmat      --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn          --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data        --colval {wildcards.data} "  \
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname beta        --colval {wildcards.beta} "\
                " && python scripts/add_column.py --filename {output} --colname radii       --colval {wildcards.radii} "\
                " && python scripts/add_column.py --filename {output} --colname N           --colval {wildcards.N} "\
                " && python scripts/add_column.py --filename {output} --colname M           --colval {wildcards.M} "\
                " && python scripts/add_column.py --filename {output} --colname pseudo_obs  --colval {wildcards.pseudo_obs} "\
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval {wildcards.alpha} "\
                " && python scripts/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  

    elif algorithm == "order_mcmc":
        return  "Rscript scripts/run_summarise.R " \
                "--adjmat_true {input.adjmat_true} " \
                "--adjmat_est {input.adjmat_est} " \
                "--filename_data {input.data} " \
                "--range_header_data 1 " \ 
                "--filename {output} " \ 
                " && python scripts/add_column.py --filename {output} --colname replicate   --colval {wildcards.replicate} "\
                " && python scripts/add_column.py --filename {output} --colname algorithm   --colval orderMCMC "\
                " && python scripts/add_column.py --filename {output} --colname adjmat          --colval {wildcards.adjmat} "  \       
                " && python scripts/add_column.py --filename {output} --colname bn              --colval {wildcards.bn} "  \       
                " && python scripts/add_column.py --filename {output} --colname data            --colval {wildcards.data} "  \
                " && python scripts/add_column.py --filename {output} --colname scoretype    --colval {wildcards.scoretype} " \
                " && python scripts/add_column.py --filename {output} --colname chi          --colval {wildcards.chi} " \
                " && python scripts/add_column.py --filename {output} --colname edgepf       --colval {wildcards.edgepf} " \
                " && python scripts/add_column.py --filename {output} --colname am           --colval {wildcards.am} " \
                " && python scripts/add_column.py --filename {output} --colname aw           --colval {wildcards.aw} " \
                " && python scripts/add_column.py --filename {output} --colname map         --colval null "\
                " && python scripts/add_column.py --filename {output} --colname blacklist   --colval null "\
                " && python scripts/add_column.py --filename {output} --colname startorder  --colval null "\
                " && python scripts/add_column.py --filename {output} --colname scoretable  --colval null "\
                " && python scripts/add_column.py --filename {output} --colname moveprobs   --colval null "\
                " && python scripts/add_column.py --filename {output} --colname iterations  --colval null "\
                " && python scripts/add_column.py --filename {output} --colname stepwise    --colval null "\
                " && python scripts/add_column.py --filename {output} --colname alpha       --colval 0.05 "\
                " && python scripts/add_column.py --filename {output} --colname cpdag       --colval false "\   
                " && python scripts/add_column.py --filename {output} --colname gamma       --colval 1 "\
                " && python scripts/add_column.py --filename {output} --colname hardlimit   --colval 15 "\      
                " && python scripts/add_column.py --filename {output} --colname chainout    --colval true "\   
                " && python scripts/add_column.py --filename {output} --colname scoreout    --colval false "\   
                " && python scripts/add_column.py --filename {output} --colname verbose     --colval false "\
                " && python scripts/add_column.py --filename {output} --colname threshold   --colval {wildcards.threshold} "\
                " && python scripts/add_column.py --filename {output} --colname startspace   --colval {wildcards.startspace_algorithm} "\
                " && python scripts/add_column.py --filename {output} --colname time        --colval `cat {input.time}` " \ 
                " && python scripts/add_column.py --filename {output} --colname legend      --colval {wildcards.plot_legend} "  



#replicates = range(int(config["data"]["replicates"]["start"]), 
#                    int(config["data"]["replicates"]["end"]+1))

# TODO: All filenames should be generated from the config file.

singularity:
    "docker://onceltuca/benchmark:1.0.7"

rule heatmap_from_adjmat_trajectory:
    input:
        adjvecs = config["output_dir"]+"/adjvecs/{something}/seed={seed}/adjvecs.json"
    output:
        heatmap = config["output_dir"]+"/heatmap_estimate/{something}/burnin={burnin}/seed={seed}/heatmap.csv" 
    message:
        "Estimating heatmap from graph trajectory"
    shell:
        "Rscript scripts/run_estimate_heatmap_from_traj.R " \
        "--adjvectraj {input.adjvecs} " \
        "--filename {output.heatmap} " \
        "--tosymmetric 0"

rule size_autocorrelation_from_trajectory:
   input:
       adjvecs = config["output_dir"]+"/adjvecs/{something}/adjvecs.json" 
   output:
       autocorr = config["output_dir"]+"/autocorr_estimate/{something}/burnin={burnin}/autocorr.csv" 

rule adjmat_from_heatmap:
    input:
        heatmap=config["output_dir"]+"/heatmap_estimate/"\ 
                "{something}/"\
                "burnin={burnin}/"\
                "{somethingelse}/" \
                "heatmap.csv"
    output:
        adjmat_est=config["output_dir"]+"/adjmat_estimate/"\
                    "{something}/" + pattern_strings["mcmc_est"] + "/{somethingelse}/"\
                    "adjmat.csv"
    message:
        "Estimating adjmat from heatmap"
    shell:
        "Rscript scripts/run_threshold_heatmap.R " \
        "--heatmap {input.heatmap} " \
        "--filename {output.adjmat_est} " \
        "--threshold {wildcards.threshold}"

rule plot_matrix:
    input:
        adjmat = "{output_dir}/adjmat_estimate/{something}/adjmat.csv"
    output:
        plot = "{output_dir}/adjmat_plots/{something}/adjmat.eps"
    singularity:
        docker_image("trilearn")
    shell:
        "python scripts/plot_heatmap.py -o {output.plot} -f {input.adjmat}"

rule bnlearn_adjmat:
    input:
        config["output_dir"] + "/bn/bn.fit_networks/{name}"
    output:
        config["output_dir"] + "/adjmat/bn.fit_adjmats/{name}.csv"
    shell:
        "mkdir -p {config[output_dir]}" + "/adjmat/bn.fit_adjmats/ " \
        "&& Rscript scripts/bnlearn_bn_to_adjmat.R " 
        "--filename_graph {output} "
        "--filename_bn {input}"

rule bnlearn_networks:
    output:
        config["output_dir"] + "/bn/bn.fit_networks/{bn}"
    #shell:
    #    "mkdir -p {config[output_dir]}" + "/bn/bn.fit_networks/ " \
    #    "&& wget https://www.bnlearn.com/bnrepository/{wildcards.bn}/{wildcards.bn}.rds "
    #    "--output-document {output}"

rule sample_adjmat:
    output:        
        adjmat = config["output_dir"] + "/adjmat/generateDAGMaxParents/p={p}/avpar={avparents}/seed={replicate}.csv"
    shell:
        "Rscript scripts/sample_dags.R " \
        "--filename {output.adjmat} " \ 
        "--nodes {wildcards.p} " \
        "--parents {wildcards.avparents} " \
        "--seed {wildcards.replicate}"

rule sample_adjmat_notears:
    output:        
        adjmat = config["output_dir"] + "/adjmat/" \
                "notears/" \
                "num_nodes={num_nodes}/" \
                "num_edges={num_edges}/"\
                "seed={seed}.csv"
    singularity:
        docker_image("notears")
    shell:
        "python scripts/notears/generate_random_dag.py " \
        "--num_nodes {wildcards.num_nodes} " \
        "--num_edges {wildcards.num_edges} " \
        "--filename {output.adjmat} " \
        "--seed {wildcards.seed}"

rule sample_linear_gaussian_parameters_notears:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:        
        bn = "{output_dir}/bn/" \
            "notears/" \
            "edge_coefficient_range_from={edge_coefficient_range_from}/"\
            "edge_coefficient_range_to={edge_coefficient_range_to}/"\
            "seed={seed}/" \
            "adjmat=/{adjmat}.csv"
    singularity:
        docker_image("notears")
    shell:
        "python scripts/notears/generate_random_dag_parameters.py " \
        "--edge_coefficient_range_from {wildcards.edge_coefficient_range_from} " \
        "--edge_coefficient_range_to {wildcards.edge_coefficient_range_to} " \
        "--filename {output.bn} " \
        "--dag_filename {input.adjmat} " \
        "--seed {wildcards.seed}"

rule sample_notears_linear_gaussian_data:
    input:
        bn="{output_dir}/bn/notears/{bn}/adjmat=/{adjmat}.csv"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/notears/{bn}"\
             "/data=/notears_linear_gaussian_sampling" \
             "/n={n}" \
             "/mean={mean}" \
             "/variance={variance}" \
             "/seed={replicate}.csv"
    singularity:
        docker_image("notears")
    shell:
        "python scripts/notears/simulate_from_dag_lg.py " \
        "--filename {output.data} " \
        "--weighted_adjmat_filename {input.bn} " \
        "--mean {wildcards.mean} " \
        "--variance {wildcards.variance} " \
        "--n_samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

rule sample_binary_bn:
    input:
        adjmat = "{output_dir}/adjmat/{adjmat}.csv" 
    output:
        bn = "{output_dir}/bn/generateBinaryBN/min={min}/max={max}/seed={seed}/adjmat=/{adjmat}.rds"
    shell:
        "Rscript scripts/sample_bayesian_network_for_dag.R " \
        "--filename_dag {input.adjmat} " \
        "--filename {output} "  \
        "--min {wildcards.min} " \
        "--max {wildcards.max} " \
        "--seed {wildcards.seed} "

rule sample_bindata:
    input:
        bn="{output_dir}/bn/generateBinaryBN/{bn}/adjmat=/{adjmat}.rds"
    output:
        data="{output_dir}/data" \
             "/adjmat=/{adjmat}"\
             "/bn=/generateBinaryBN/{bn}"\
             "/data=/standard_sampling/n={n}/seed={replicate}.csv"
    shell:
        "Rscript scripts/sample_data_with_range_header.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

rule copy_fixed_data:
    input:
        "{output_dir}/data/mydatasets/{filename}" # this ensures that the file exists and is copied again if changed.
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/bn=/None/data=/fixed/name={filename}/n={n}/seed={replicate}.csv"
    shell:\
        "mkdir -p {wildcards.output_dir}/data/adjmat=/{wildcards.adjmat}/bn=/None/data=/fixed/name={wildcards.filename}/n={wildcards.n} && "\
        "cp {input} {output.data}"

rule sample_bnfit_data:
    input:        
        bn="{output_dir}/bn/bn.fit_networks/{bn}"        
    output:
        data="{output_dir}/data/adjmat=/{adjmat}/bn=/bn.fit_networks/{bn}/data=/standard_sampling/n={n}/seed={replicate}.csv"
    shell:
        "Rscript scripts/sample_from_bnlearn_bn.R " \
        "--filename {output.data} " \
        "--filename_bn {input.bn} " \
        "--samples {wildcards.n} " \
        "--seed {wildcards.replicate}"

rule greenthomas:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("greenthomas"),
        time = alg_output_time_path("greenthomas")
    singularity:
        docker_image("greenthomas")
    message:
        "Executing greenthomas algorithm on the following files: {input}."
    shell:
        alg_shell("greenthomas")

rule summarise_greenthomas:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("greenthomas"),
        time = summarise_alg_input_time_path("greenthomas")
    output:
        res = summarise_alg_output_res_path("greenthomas")
    message:
        "Summarising greenthomas results based on the files: {input}."
    shell:
        summarise_alg_shell("greenthomas")
       
rule join_summaries_greenthomas:
    input:
        conf="config.json",
        res=join_string_sampled_model("greenthomas")
    output:
        join_summaries_output("greenthomas")
    shell:
        join_summaries_shell("greenthomas")

rule tabu:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("tabu"),
        time = alg_output_time_path("tabu")
    message:
        "Executing tabu algorithm on the following files: {input}."
    shell:
        alg_shell("tabu")

rule summarise_tabu:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("tabu"),
        time = summarise_alg_input_time_path("tabu")
    output:
        res = summarise_alg_output_res_path("tabu")
    message:
        "Summarising tabu results based on the files: {input}."
    shell:
        summarise_alg_shell("tabu")
       
rule join_summaries_tabu:
    input:
        conf="config.json",
        res=join_string_sampled_model("tabu")
    output:
        join_summaries_output("tabu")
    shell:
        join_summaries_shell("tabu")

rule notears:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("notears"),
        time = alg_output_time_path("notears")
    singularity:
        docker_image("notears")
    message:
        "Executing notears algorithm on the following files: {input}."
    shell:
        alg_shell("notears")

rule summarise_notears:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("notears"),
        time = summarise_alg_input_time_path("notears")
    output:
        res = summarise_alg_output_res_path("notears")
    message:
        "Summarising notears results based on the files: {input}."
    shell:
        summarise_alg_shell("notears")
       
rule join_summaries_notears:
    input:
        conf="config.json",
        res=join_string_sampled_model("notears")
    output:
        join_summaries_output("notears")
    shell:
        join_summaries_shell("notears")

rule h2pc:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("h2pc"),
        time = alg_output_time_path("h2pc")
    message:
        "Executing h2pc algorithm on the following files: {input}."
    shell:
        alg_shell("h2pc")

rule summarise_h2pc:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("h2pc"),
        time = summarise_alg_input_time_path("h2pc")
    output:
        res = summarise_alg_output_res_path("h2pc")
    message:
        "Summarising h2pc results based on the files: {input}."
    shell:
        summarise_alg_shell("h2pc")
       
rule join_summaries_h2pc:
    input:
        conf="config.json",
        res=join_string_sampled_model("h2pc")
    output:
        join_summaries_output("h2pc")
    shell:
        join_summaries_shell("h2pc")

rule hc:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("hc"),
        time = alg_output_time_path("hc")
    message:
        "Executing hc algorithm on the following files: {input}."
    shell:
        alg_shell("hc")

rule summarise_hc:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("hc"),
        time = summarise_alg_input_time_path("hc")
    output:
        res = summarise_alg_output_res_path("hc")
    message:
        "Summarising hc results based on the files: {input}."
    shell:
        summarise_alg_shell("hc")
       
rule join_summaries_hc:
    input:
        conf="config.json",
        res=join_string_sampled_model("hc")
    output:
        join_summaries_output("hc")
    shell:
        join_summaries_shell("hc")

rule interiamb:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("interiamb"),
        time = alg_output_time_path("interiamb")
    message:
        "Executing interiamb algorithm on the following files: {input}."
    shell:
        alg_shell("interiamb")

rule summarise_interiamb:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("interiamb"),
        time = summarise_alg_input_time_path("interiamb")
    output:
        res = summarise_alg_output_res_path("interiamb")
    message:
        "Summarising interiamb results based on the files: {input}."
    shell:
        summarise_alg_shell("interiamb")
       
rule join_summaries_interiamb:
    input:
        conf="config.json",
        res=join_string_sampled_model("interiamb")
    output:
        join_summaries_output("interiamb")
    shell:
        join_summaries_shell("interiamb")

rule gs:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gs"),
        time = alg_output_time_path("gs")
    message:
        "Executing gs algorithm on the following files: {input}."
    shell:
        alg_shell("gs")

rule summarise_gs:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gs"),
        time = summarise_alg_input_time_path("gs")
    output:
        res = summarise_alg_output_res_path("gs")
    message:
        "Summarising gs results based on the files: {input}."
    shell:
        summarise_alg_shell("gs")
       
rule join_summaries_gs:
    input:
        conf="config.json",
        res=join_string_sampled_model("gs")
    output:
        join_summaries_output("gs")
    shell:
        join_summaries_shell("gs")

rule blip:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("blip"),
        time = alg_output_time_path("blip")
    message:
        "Executing blip algorithm on the following files: {input}."
    shell:        
        alg_shell("blip")

rule summarise_blip:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("blip"),
        time = summarise_alg_input_time_path("blip")
    output:
        res = summarise_alg_output_res_path("blip")
    message:
        "Summarising blip results based on the files: {input}."
    shell:
        summarise_alg_shell("blip")

rule join_summaries_blip:
    input:
        conf="config.json",
        res=join_string_sampled_model("blip")
    output:
        join_summaries_output("blip")
    shell:
        join_summaries_shell("blip")

rule itsearch:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("itsearch"),
        time = alg_output_time_path("itsearch")
    message:
        "Executing iterative search algorithm with wildcards {wildcards} on the following data: {input}"
    shell:
        alg_shell("itsearch")

rule summarise_itsearch:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("itsearch"),
        time = summarise_alg_input_time_path("itsearch")
    output:
        res = summarise_alg_output_res_path("itsearch")
    message:
        "Summarising iterative search algorithm with wildcards: {wildcards} on the following files: {input}"
    shell:
        summarise_alg_shell("itsearch")

rule join_summaries_itsearch:
    input:
        conf="config.json",
        res=join_string_sampled_model("itsearch")
    output:
        join_summaries_output("itsearch")
    shell:
        join_summaries_shell("itsearch")

rule pcalg:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("pcalg"),
        time = alg_output_time_path("pcalg")
    message:
        "Executing order PC algorithm on the following files: {input}."
    shell:
       alg_shell("pcalg")

rule summarise_pcalg:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("pcalg"),
        time = summarise_alg_input_time_path("pcalg")
    output:
        res = summarise_alg_output_res_path("pcalg")
    message:
        "Summarising pc algorithm based on the following files: {input}."
    shell:
        summarise_alg_shell("pcalg")

rule join_summaries_pcalg:
    input:
        conf="config.json",
        res=join_string_sampled_model("pcalg")
    output:
        join_summaries_output("pcalg")
    shell:
        join_summaries_shell("pcalg")

rule mmhc:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("mmhc"),
        time = alg_output_time_path("mmhc")
    message:
        "Executing the mmhc algorithm on the following files: {input}."
    shell:
        alg_shell("mmhc")

rule summarise_mmhc:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("mmhc"),
        time = summarise_alg_input_time_path("mmhc")
    output:
        res = summarise_alg_output_res_path("mmhc")
    shell:
       summarise_alg_shell("mmhc")

rule join_summaries_mmhc:
    input:
        conf="config.json",
        res=join_string_sampled_model("mmhc")
    output:
        join_summaries_output("mmhc")  
    shell:
        join_summaries_shell("mmhc")

rule gobnilp:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gobnilp"),
        time = alg_output_time_path("gobnilp")
    singularity:
        docker_image("gobnilp")        
    shell: 
        alg_shell("gobnilp")

rule summarise_gobnilp:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gobnilp"),
        time = summarise_alg_input_time_path("gobnilp")
    output:
        res = summarise_alg_output_res_path("gobnilp")
    shell:
        summarise_alg_shell("gobnilp")

rule join_summaries_gobnilp:
    input:
        conf="config.json",
        res=join_string_sampled_model("gobnilp")
    output:
        join_summaries_output("gobnilp")
    shell:
        join_summaries_shell("gobnilp")
rule fges:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("fges"),
        time = alg_output_time_path("fges")
    message:
        "Executing fges algorithm on the following files: {input}."
    shell:
        alg_shell("fges")

rule summarise_fges:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("fges"),
        time = summarise_alg_input_time_path("fges")
    output:
        res = summarise_alg_output_res_path("fges")
    message:
        "Summarising fges results based on the files: {input}."
    shell:
        summarise_alg_shell("fges")

rule join_summaries_fges:
    input:
        conf="config.json",
        res=join_string_sampled_model("fges")
    output:
        join_summaries_output("fges")
    shell:
        join_summaries_shell("fges")

rule fci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("fci"),
        time = alg_output_time_path("fci")
    message:
        "Executing fci algorithm on the following files: {input}."
    shell:
        alg_shell("fci")

rule summarise_fci:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("fci"),
        time = summarise_alg_input_time_path("fci")
    output:
        res = summarise_alg_output_res_path("fci")
    message:
        "Summarising fci results based on the files: {input}."
    shell:
        summarise_alg_shell("fci")

rule join_summaries_fci:
    input: # This could be a funciton since no pattern mathing is going on here
        conf="config.json",
        res=join_string_sampled_model("fci")
    output:
        join_summaries_output("fci")
    shell:
        join_summaries_shell("fci")
rule gfci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gfci"),
        time = alg_output_time_path("gfci")
    message:
        "Executing gfci algorithm on the following files: {input}."
    shell:
        alg_shell("gfci")

rule summarise_gfci:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gfci"),
        time = summarise_alg_input_time_path("gfci")
    output:
        res = summarise_alg_output_res_path("gfci")
    message:
        "Summarising gfci results based on the files: {input}."
    shell:
        summarise_alg_shell("gfci")

rule join_summaries_gfci:
    input: # This could be a funciton since no pattern mathing is going on here
        conf="config.json",
        res=join_string_sampled_model("gfci")
    output:
        join_summaries_output("gfci")
    shell:
        join_summaries_shell("gfci")
rule rfci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("rfci"),
        time = alg_output_time_path("rfci")
    message:
        "Executing rfci algorithm on the following files: {input}."
    shell:
        alg_shell("rfci")

rule summarise_rfci:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("rfci"),
        time = summarise_alg_input_time_path("rfci")
    output:
        res = summarise_alg_output_res_path("rfci")
    message:
        "Summarising rfci results based on the files: {input}."
    shell:
        summarise_alg_shell("rfci")

rule join_summaries_rfci:
    input: # This could be a funciton since no pattern mathing is going on here
        conf="config.json",
        res=join_string_sampled_model("rfci")
    output:
        join_summaries_output("rfci")
    shell:
        join_summaries_shell("rfci")


rule order_mcmc:
    input:
        data = alg_input_data(),
        startspace = config["output_dir"]+"/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv"
    output:
        adjvecs = alg_output_adjvecs_path("order_mcmc"),
        time = alg_output_time_path("order_mcmc")
    message:
        "Executing order mcmc algorithm with startspace on the following files: {input}.\n Output: {output}"
    shell: 
       alg_shell("order_mcmc")

rule summarise_order_mcmc:
    input:
        data = data_path(),
        adjmat_true = adjmat_true_path(),
        adjmat_est = adjmat_estimate_path_mcmc("order_mcmc"),
        time = time_path("order_mcmc")
    output:
        res = result_path_mcmc("order_mcmc")
    message:
        "Summarizing order mcmc algorithm with startspace on the following files: {input}."
    shell: 
        summarise_alg_shell("order_mcmc")

rule join_summaries_order_mcmc:
    input: 
        conf="config.json",
        res=join_string_sampled_model_mcmc("order_mcmc")
    output:
        join_summaries_output("order_mcmc")
    shell:
        join_summaries_shell("order_mcmc")

rule trilearn_loglin:
    input:
        data=alg_input_data()
    output:
        adjvecs = alg_output_adjvecs_path("trilearn_loglin"),
        time = alg_output_time_path("trilearn_loglin")
    message:
        "Executing trilearn algorithm on the following files: {input}, output: {output}. wildcards {wildcards}"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        alg_shell("trilearn_loglin")

rule summarise_trilearn_loglin:
    input:
        data = data_path(),
        adjmat_true = adjmat_true_path(),
        adjmat_est = adjmat_estimate_path_mcmc("trilearn_loglin"),
        time = time_path("trilearn_loglin")
    output:
        res = result_path_mcmc("trilearn_loglin")
    message:
        "Summarizing trilearn algorithm with startspace on the following files: {input}, output: {output}."
    shell: 
        summarise_alg_shell("trilearn_loglin")

rule join_summaries_trilearn_loglin:
    input: 
        conf="config.json",
        res=join_string_sampled_model_mcmc("trilearn_loglin")
    output:
        join_summaries_output("trilearn_loglin")
    message:
        "Input: {input}"
    shell:
        join_summaries_shell("trilearn_loglin")

rule roc:
    input:
        "config.json",
        "Snakefile",
        active_algorithm_files
    output:
        config["output_dir"] + "/ROC.eps", \
        config["output_dir"] + "/ROC_data.csv" 
    shell:
        "Rscript scripts/combine_ROC_data.R " \
        "&& Rscript scripts/plot_ROC.R"

# rule adjmat_plot:
#     input:
#         "config.json",
#         itsearch=adjmat_plots("itsearch"),
        #gobnilp=adjmat_plots("gobnilp", seed)
#    output:
#        config["output_dir"] + "/adjmat_plots",
#        plots=config["output_dir"]+"/adjmat_plots/itsearch_map.eps", #"adjmat_plots/gobnilp_seed={seed}/gobnilp.eps", "fges_seed.eps"
        # For the output, all the parameters are not that important
        # If there is a true graph, plot it
#    shell:
#        "cp {input.gobnilp} adjmat_plots/gobnilp_seed={seed}/gobnilp.eps"\
#        " && cp {input.itsearch} adjmat_plots/itsearch_seed={seed}/itsearch.eps"\

    