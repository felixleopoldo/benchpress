import json
from jsonschema import validate
import snakemake.utils
import sys, getopt


args = sys.argv

configfilename="config.json"
i=0
for arg in args:
    if arg=="--configfile":
        configfilename = args[i+1]
        break
    i+=1


configfile: 
        configfilename

snakemake.utils.validate(config, 'schema/config.schema.json')

# Check that algorithm exists

available_conf_ids = []
for alg, alg_conf_avail in config["resources"]["structure_learning_algorithms"].items():
    for alg_conf in alg_conf_avail:
        available_conf_ids.append(alg_conf["id"])   

for alg_conf_id in config["benchmark_setup"]["algorithm_ids"]:
    if alg_conf_id not in available_conf_ids:
        raise Exception(alg_conf_id + " not available")

for alg_conf in config["resources"]["structure_learning_algorithms"]["order_mcmc"]:
    if alg_conf["startspace"] not in set(available_conf_ids) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["order_mcmc"]}:
        raise Exception(alg_conf["startspace"] + " not available startspace for order_mcmc."\
                        "The available are: "+str(list(set(available_conf_ids) - {c["id"] for c in config["resources"]["structure_learning_algorithms"]["order_mcmc"]})))

def validate_data_setup(config, dict):
    # Check that adjmat exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["graph"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])

    if not ((dict["graph_id"] in available_conf_ids) or Path("files/adjmat/myadjmats/"+dict["graph_id"]).is_file()):
        
        raise Exception(dict["graph_id"] + 
                        " is not an available graph id. "
                        "The available graph id´s are: " + str(available_conf_ids))

    
#    if not Path("files/adjmat/myadjmats/"+dict["graph_id"]).is_file():
#        raise Exception(dict["graph"] + 
#                        " is not an available graph id. "
#                        "The available graph id´s are: " + str(available_conf_ids))
    
    # Check that parameters exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["parameters"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])   

    
    if dict["data_id"] not in [dataconf["id"] for dataconf in config["resources"]["data"]["fixed_data"]] and dict["parameters_id"] not in available_conf_ids:
        raise Exception(dict["parameters_id"] + 
                        " is not an available parameter id. "
                        "The available paremeter id´s are: " + str(available_conf_ids))

    # Check that data exists
    available_conf_ids = []
    for alg, alg_conf_avail in config["resources"]["data"].items():
        for alg_conf in alg_conf_avail:
            available_conf_ids.append(alg_conf["id"])   

    if dict["data_id"] not in available_conf_ids:
        raise Exception(dict["data_id"] + 
                        " is not an available data id. "
                        "The available data id´s are: " + str(available_conf_ids))
    # Check that graph, parameters, and data are properly combined.

for data_setup in config["benchmark_setup"]["data"]:
    validate_data_setup(config, data_setup)

include: "rules/pattern_strings.smk"
include: "rules/algorithm_strings.smk"

def adjmat_estimate_path_mcmc(algorithm):
    ret = "{output_dir}/adjmat_estimate/"\
                        "adjmat=/{adjmat}/"\
                        "bn=/{bn}/"\
                        "data=/{data}/"\
                        "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/" \
                        "seed={replicate}/" \
                        "adjmat.csv"
    return ret

def time_path(algorithm):
    ret = "{output_dir}/time/"\
                    "adjmat=/{adjmat}/"\
                    "bn=/{bn}/"\
                    "data=/{data}/"\
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"
    return ret

def result_path_mcmc(algorithm):
    res = "{output_dir}/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/"\
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\   
            "seed={replicate}/" \
            "legend={plot_legend}/" \        
            "result.csv"
    return res

def data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/bn=/{bn}/data=/{data}/seed={replicate}.csv"

def adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv",

def get_seed_range(seed_range):
    if seed_range == None:
        return [1]
    else:
        return range(seed_range[0], seed_range[1]+1)

# def adjmat_plots(algorithm, mode="result"):
#     ret = [[[expand(config["benchmark_setup"]["output_dir"] + "/adjmat_plots/"\
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
#             for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["algorithm_ids"]],
#     return ret

def join_string_sampled_model(algorithm, mode="result"):
    ret = [[[expand("{output_dir}/"+mode+"/"\        
            "algorithm=/{alg_string}/"
            "adjmat=/{adjmat_string}/"
            "bn=/{param_string}/"
            "data=/{data_string}/"
            "legend={plot_legend}/" 
            + mode + ".csv",
            output_dir=config["benchmark_setup"]["output_dir"],
            alg_string=json_string[alg_conf["id"]],
            plot_legend=alg_conf["plot_legend"],
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["algorithm_ids"]],
    return ret

def join_string_sampled_model_mcmc(algorithm, mode="result"):
    ret = [[[expand("{output_dir}/"+mode+"/"\        
                        "algorithm=/{algorithm_string}/" 
                        "adjmat=/{adjmat_string}/"
                        "bn=/{param_string}/"
                        "data=/{data_string}/"                       
                        "legend={plot_legend}/" # /output_parameters=/legend={plot_legend}/
                        +mode+".csv",
            output_dir=config["benchmark_setup"]["output_dir"],
            threshold=alg_conf["threshold"], # only for mcmc
            burnin=alg_conf["burnin"], # only for mcmc
            plot_legend=alg_conf["plot_legend"], 
            algorithm_string=json_string[alg_conf["id"]],
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed)
            )
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["algorithm_ids"]]
    return ret

def join_summaries_shell(algorithm):
    return "Rscript scripts/join_csv_files.R --algorithm "+algorithm+" --filename {output} --files {input.res} "  \
            " && sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

def join_summaries_output(algorithm):
    return "{output_dir}/"+algorithm+".csv"

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
    from pathlib import Path
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    # find the adjmat_gen_method from adjmat_gen_id
    # Maybe fill up a dict as for structure learning algortihms
    # Then we would loose the seed.
    
    if adjmat_id in [c["id"] for c in config["resources"]["graph"]["generateDAGMaxParents"]]:
        adjmat_dict = next(item for item in config["resources"]["graph"]["generateDAGMaxParents"] if item["id"] == adjmat_id)
        return expand("generateDAGMaxParents" + \
            "/p={p}" + \
            "/avpar={av_parents}" + \
            "/seed={seed}",
            av_parents=adjmat_dict["av_parents"], 
            p=adjmat_dict["dims"],
            seed=seed)

    elif Path("files/adjmat/myadjmats/"+adjmat_id).is_file():
        filename_no_ext = os.path.splitext(os.path.basename(adjmat_id))[0]
        return  "myadjmats/" + filename_no_ext # this could be hepar2 e.g.

    #elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["fixed_adjmats"]]:
    #    adjmat_dict = next(item for item in config["resources"]["graph"]["fixed_adjmats"] if item["id"] == adjmat_id)
    #    # This means the id is the conf, and it takes everything in a folder?
    #    filename_no_ext = os.path.splitext(os.path.basename(adjmat_dict["filename"]))[0]
    #    return  "myadjmats/" + filename_no_ext # this could be hepar2 e.g.

    # Check if file exists instead... maybe in a spefified folder.. No take the same folder..
    elif adjmat_id in [c["id"] for c in config["resources"]["graph"]["bn.fit_adjmats"]]:
        # This means the id is the conf, and it takes everything in a folder?
        return  "bn.fit_adjmats/" + adjmat_id # this could be hepar2 e.g.

    elif adjmat_id == "notears":
        adjmat_dict = next(item for item in config["resources"]["graph"]["notears"] if item["id"] == adjmat_id)
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
    with open(configfilename) as json_file:
        conf = json.load(json_file)

    if gen_method_id in [c["id"] for c in config["resources"]["parameters"]["generateBinaryBN"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["generateBinaryBN"] if item["id"] == gen_method_id)
        return expand("generateBinaryBN" + \
                        "/min={min}" + \
                        "/max={max}" + \
                        "/seed={seed}",
                        min=curconf["min"], 
                        max=curconf["max"],
                        seed=seed)

    elif gen_method_id in [c["id"] for c in config["resources"]["parameters"]["bn.fit_networks"]]:
        return "bn.fit_networks/"+gen_method_id

    elif gen_method_id == "notears":
        curconf = next(item for item in config["resources"]["parameters"]["notears"] if item["id"] == gen_method_id)
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
    if data_id in [c["id"] for c in config["resources"]["data"]["fixed_data"]]:
        data = next(item for item in config["resources"]["data"]["fixed_data"] if item["id"] == data_id)        
        return "fixed" + \
                "/name="+data["filename"] + \
                "/n="+str(data["samples"]) + \ 
                "/seed="+str(seed) # TODO: this may cause som error with seed somewhere

    elif data_id in [c["id"] for c in config["resources"]["data"]["standard_sampling"]]:
        data = next(item for item in config["resources"]["data"]["standard_sampling"] if item["id"] == data_id)
        return expand("standard_sampling" +\
                        "/n={n}" + \
                        "/seed={seed}", 
                        n = data["sample_sizes"],
                        seed = seed)

    elif data_id in [c["id"] for c in config["resources"]["data"]["notears_linear_gaussian_sampling"]]:
        data = next(item for item in config["resources"]["data"]["notears_linear_gaussian_sampling"] if item["id"] == data_id)
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
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    algs = []

    for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
        for alg_conf_id in config["benchmark_setup"]["algorithm_ids"]:
            if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(conf["benchmark_setup"]["output_dir"] + "/" + alg + ".csv")
    return algs

def alg_output_adjmat_path(algorithm):
    return "{output_dir}/adjmat_estimate/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "adjmat.csv"

def alg_output_adjvecs_path(algorithm):
    return "{output_dir}/adjvecs/{data}/"\
                "algorithm=/"  + pattern_strings[algorithm] + "/"  + \
                "seed={replicate}/" \
                "adjvecs.json"

def alg_output_time_path(algorithm):
    return "{output_dir}/time/{data}/"\
                "algorithm=/" + pattern_strings[algorithm] + "/" +\
                "seed={replicate}/" \
                "time.txt"

def alg_input_data():
    return "{output_dir}/data/{data}/seed={replicate}.csv"

include: "rules/algorithm_shell_commands.smk"

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
    return "{output_dir}/data/adjmat=/{adjmat}/bn=/{bn}/data=/{data}/seed={replicate}.csv"

def summarise_alg_input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv"

def summarise_alg_input_adjmat_est_path(algorithm):
    return "{output_dir}/adjmat_estimate/"\
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "seed={replicate}/" \
            "adjmat.csv",

def summarise_alg_input_time_path(algorithm):
    return "{output_dir}/time/"\
                    "adjmat=/{adjmat}/"\
                    "bn=/{bn}/"\
                    "data=/{data}/" \ 
                    "algorithm=/" + pattern_strings[algorithm] + "/" + \
                    "seed={replicate}/" \
                    "time.txt"

def summarise_alg_output_res_path(algorithm):
    return "{output_dir}/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + \
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\
            "seed={replicate}/" \
            "legend={plot_legend}/" \        
            "result.csv"

include: "rules/algorithm_summary_shell_command.smk"
# TODO: All filenames should be generated from the config file.

singularity:
    "docker://onceltuca/benchmark:1.0.7"

rule heatmap_from_adjmat_trajectory:
    input:
        adjvecs = "{output_dir}/adjvecs/{something}/seed={seed}/adjvecs.json"
    output:
        heatmap = "{output_dir}/heatmap_estimate/{something}/burnin={burnin}/seed={seed}/heatmap.csv" 
    message:
        "Estimating heatmap from graph trajectory"
    shell:
        "Rscript scripts/run_estimate_heatmap_from_traj.R " \
        "--adjvectraj {input.adjvecs} " \
        "--filename {output.heatmap} " \
        "--tosymmetric 0"

rule size_autocorrelation_from_trajectory:
   input:
       adjvecs = "{output_dir}/adjvecs/{something}/adjvecs.json" 
   output:
       autocorr = "{output_dir}/autocorr_estimate/{something}/burnin={burnin}/autocorr.csv" 

rule adjmat_from_heatmap:
    input:
        heatmap="{output_dir}/heatmap_estimate/"\ 
                "{something}/"\
                "burnin={burnin}/"\
                "{somethingelse}/" \
                "heatmap.csv"
    output:
        adjmat_est="{output_dir}/adjmat_estimate/"\
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
        "{output_dir}/bn/bn.fit_networks/{name}"
    output:
        "{output_dir}/adjmat/bn.fit_adjmats/{name}.csv"
    shell:
        "mkdir -p {wildcards.output_dir}" + "/adjmat/bn.fit_adjmats/ " \
        "&& Rscript scripts/bnlearn_bn_to_adjmat.R " 
        "--filename_graph {output} "
        "--filename_bn {input}"

rule bnlearn_networks:
    output:
        "{output_dir}/bn/bn.fit_networks/{bn}"
    #shell:
    #    "mkdir -p {wildcards.output_dir}" + "/bn/bn.fit_networks/ " \
    #    "&& wget https://www.bnlearn.com/bnrepository/{wildcards.bn}/{wildcards.bn}.rds "
    #    "--output-document {output}"

rule sample_adjmat:
    output:        
        adjmat = "{output_dir}/adjmat/generateDAGMaxParents/p={p}/avpar={avparents}/seed={replicate}.csv"
    shell:
        "Rscript scripts/sample_dags.R " \
        "--filename {output.adjmat} " \ 
        "--nodes {wildcards.p} " \
        "--parents {wildcards.avparents} " \
        "--seed {wildcards.replicate}"

rule sample_adjmat_notears:
    output:        
        adjmat = "{output_dir}/adjmat/" \
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

include: "rules/algorithm_rules.smk"

rule roc_data:
    input:
        conf=configfilename,
        snake="Snakefile",
        algs=active_algorithm_files # It should maybe be stated there which kind of roc to be considered..
    output:
        csv=config["benchmark_setup"]["output_dir"] + "/ROC_data.csv"
    shell:
        "Rscript scripts/combine_ROC_data.R --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} " \

rule roc:
    input:
        configfilename,
        "Snakefile",
        csv=config["benchmark_setup"]["output_dir"] + "/ROC_data.csv" 
    output:
        eps=config["benchmark_setup"]["output_dir"] + "/ROC.eps"
    shell:
        "Rscript scripts/plot_ROC.R --input_filename {input.csv} --output_filename {output.eps}"

rule roc_essential_graph:
    input:
        configfilename,
        "Snakefile",
        csv=config["benchmark_setup"]["output_dir"] + "/ROC_data.csv" 
    output:
        eps=config["benchmark_setup"]["output_dir"] + "/ROC_essential_graph.eps"
    shell:
        "Rscript scripts/plot_ROC.R --input_filename {input.csv} --output_filename {output.eps}"

# rule adjmat_plot:
#     input:
#         configfilename,
#         itsearch=adjmat_plots("itsearch"),
        #gobnilp=adjmat_plots("gobnilp", seed)
#    output:
#        config["benchmark_setup"]["output_dir"] + "/adjmat_plots",
#        plots="{output_dir}/adjmat_plots/itsearch_map.eps", #"adjmat_plots/gobnilp_seed={seed}/gobnilp.eps", "fges_seed.eps"
        # For the output, all the parameters are not that important
        # If there is a true graph, plot it
#    shell:
#        "cp {input.gobnilp} adjmat_plots/gobnilp_seed={seed}/gobnilp.eps"\
#        " && cp {input.itsearch} adjmat_plots/itsearch_seed={seed}/itsearch.eps"\

    