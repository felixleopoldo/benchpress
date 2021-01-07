import json
from jsonschema import validate
import snakemake.utils
import sys, getopt
from pathlib import Path

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

include: "rules/validate.smk"
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
            "id={id}/" \        
            "result.csv"


def result_path_mcmc(algorithm):
    res = "{output_dir}/result/"\
            "algorithm=/" + pattern_strings[algorithm] + "/" + pattern_strings["mcmc_est"] + "/"\
            "adjmat=/{adjmat}/"\
            "bn=/{bn}/"\
            "data=/{data}/"\   
            "seed={replicate}/" \
            "id={id}/" \             
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

def join_string_sampled_model(algorithm, mode="result"):
    """ This is the main string for a benchmark.

    TOOD: Should contain evaluation=/{eval_param}
    where eval_param is e.g. SHD/ or TPR/graphtype=skeleton FPR/graphtype=cpdag.
    Create rule for roc
    """
    roc_alg_ids = [roc_dict["algorithm_id"] for roc_dict in config["benchmark_setup"]["evaluation"]["ROC"]]
    
    ret = [[[expand("{output_dir}/"+mode+"/"\        
            "algorithm=/{alg_string}/"
            "adjmat=/{adjmat_string}/"
            "bn=/{param_string}/"
            "data=/{data_string}/"
            "id={id}/" \        
            + mode + ".csv",
            output_dir=config["benchmark_setup"]["output_dir"],
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in roc_alg_ids],
    
    # # Every algorithm should have this as output, where the parameters are added to the csv.
    # # A general rule should handle output e.g. SHD or TP, FP...
    # ret = [[[expand("{output_dir}/"
    #         "evaluation=/{evaluation_string}"\
    #         "algorithm=/{alg_string}/"
    #         "adjmat=/{adjmat_string}/"
    #         "bn=/{param_string}/"
    #         "data=/{data_string}/"
    #         + eval_method + ".csv",
    #         output_dir=config["benchmark_setup"]["output_dir"],
    #         alg_string=json_string[alg_conf["id"]],
    #         plot_legend=alg_conf["plot_legend"],
    #         evaluation_string=get_eval_string(eval_method),
    #         adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
    #         param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
    #         data_string=gen_data_string_from_conf(sim_setup["data_id"], seed))
    #         for seed in get_seed_range(sim_setup["seed_range"])]
    #         for sim_setup in config["benchmark_setup"]["data"]]
    #         for alg_conf in config["resources"]["structure_learning_algorithms"][algorithm] if alg_conf["id"] in config["benchmark_setup"]["algorithm_ids"]],
    return ret

def join_summaries_shell(algorithm):
    return "cat {input.res[0]} > {output} && " \
            "i=0;" \
            "for file in {input.res} ;"\
            "do "\  
            "   if [ $i -gt 0 ] ; " \
            "      then " \
            "      Rscript scripts/join_csv_files.R --filename1 {output} --filename2 $file ; "  \
            "   fi ;" \
            "   ((i=i+1)) ;"\
            "done ; " \
            " sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

#    "Rscript scripts/join_csv_files.R --filename {output} --files {input.res} "  \
#            " && sed --in-place 's/\/seed=[0-9]\+//g' {output}" # removes the /seed={seed} :-)

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
    #with open(configfilename) as json_file:
    #    conf = json.load(json_file)
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
        return  "myadjmats/" + filename_no_ext # this could be hepar2.csv e.g.

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
    #with open(configfilename) as json_file:
    #    conf = json.load(json_file)

    if gen_method_id in [c["id"] for c in config["resources"]["parameters"]["generateBinaryBN"]]:        
        curconf = next(item for item in config["resources"]["parameters"]["generateBinaryBN"] if item["id"] == gen_method_id)
        return expand("generateBinaryBN" + \
                        "/min={min}" + \
                        "/max={max}" + \
                        "/seed={seed}",
                        min=curconf["min"], 
                        max=curconf["max"],
                        seed=seed)

    elif Path("files/bn/bn.fit_networks/"+gen_method_id).is_file():
        return  "bn.fit_networks/" + gen_method_id # this could be hepar2.rds e.g.

    elif gen_method_id == "notears":
        curconf = next(item for item in config["resources"]["parameters"]["notears_parameters_sampling"] if item["id"] == gen_method_id)
        return expand("notears/" \
                      "edge_coefficient_range_from={edge_coefficient_range_from}/"\
                      "edge_coefficient_range_to={edge_coefficient_range_to}/"\
                      "mean={mean}/" + \
                      "variance={variance}/" + \
                      "seed={seed}",
                        edge_coefficient_range_from=curconf["edge_coefficient_range_from"],
                        edge_coefficient_range_to=curconf["edge_coefficient_range_to"],
                        mean = curconf["mean"],
                        variance = curconf["variance"],
                        seed=seed)

    elif gen_method_id is None:
        return None

def gen_data_string_from_conf(data_id, seed):

    if Path("files/data/mydatasets/"+data_id).is_file():
        return "fixed" + \
            "/filename="+data_id + \
            "/n="+str(None) + \ 
            "/seed="+str(seed) # TODO: this may cause som error with seed somewhere

    elif data_id in [c["id"] for c in config["resources"]["data"]["standard_sampling"]]:
        # Find the data entry from the resources
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
                        "/seed={seed}", 
                        n = data["sample_sizes"],
                        seed = seed)

def active_algorithm_files(wildcards):
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    algs = active_algorithms()
    alg_filenames = [conf["benchmark_setup"]["output_dir"] + "/" + alg + ".csv" for alg in algs]
    
    return alg_filenames

def active_algorithms():
    with open(configfilename) as json_file:
        conf = json.load(json_file)
    algs = []
    roc_alg_ids = [roc_dict["algorithm_id"] for roc_dict in config["benchmark_setup"]["evaluation"]["ROC"]]
    for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():     
        for alg_conf_id in roc_alg_ids:        
            if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append( alg )
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

include: "rules/sample_adjmat.smk"
include: "rules/sample_parameters.smk"
include: "rules/sample_data.smk"
include: "rules/algorithm_rules.smk"
include: "rules/evaluation.smk"
    
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