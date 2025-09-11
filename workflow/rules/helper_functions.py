import json
from pathlib import Path
import pprint as pp

def edge_constraints_tetrad(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-tetrad"


def edge_constraints_bidag(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-bidag"

def edge_constraints_gobnilp(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-gobnilp"

def edge_constraints_bnlearn(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-bnlearn"

def edge_constraints_pcalg(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-pcalg"

def edge_constraints_mvpc(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-mvpc"

def edge_constraints_bips_tpc(wildcards):
    if wildcards.edgeConstraints == "None":
        return []
    else:
        return f"resources/constraints/data=/"+alg_input_data()+f"/{wildcards.edgeConstraints}-bips_tpc"

def get_seed_range(seed_range):
    if seed_range == None:
        return [1]
    else:
        return range(seed_range[0], seed_range[1]+1)

def get_algorithm_patterns(config):
    """Generate pattern strings for structure learning algorithms"""
    patterns = {}
    for alg in config["resources"]["structure_learning_algorithms"].keys():
        patterns[alg] = alg+"/alg_params=/"+dict_to_path(config["resources"]["structure_learning_algorithms"][alg])
    return patterns

def get_graph_patterns(config):
    """Generate pattern strings for graph modules"""
    patterns = {}
    for module in config["resources"]["graph"]:
        patterns[module] = module + "/" + dict_to_path(config["resources"]["graph"][module])
    return patterns

def get_parameter_patterns(config):
    """Generate pattern strings for parameter modules"""
    patterns = {}
    for module in config["resources"]["parameters"]:
        patterns[module] = module + "/" + dict_to_path(config["resources"]["parameters"][module])
    return patterns

def get_data_patterns(config):
    """Generate pattern strings for data modules"""
    patterns = {}
    for module in config["resources"]["data"]:
        patterns[module] = module + "/" + dict_to_path(config["resources"]["data"][module])
    return patterns

def get_mcmc_eval_patterns(config):
    """Generate pattern strings for MCMC evaluation methods"""
    patterns = {}
    for mcmc_eval in ["mcmc_traj_plots", "mcmc_autocorr_plots", "mcmc_heatmaps"]:
        for bmark_setup in config["benchmark_setup"]:
            if mcmc_eval in bmark_setup["evaluation"]:
                patterns[mcmc_eval] = mcmc_eval + "/" + dict_to_path(bmark_setup["evaluation"][mcmc_eval])
    return patterns

def get_mcmc_est_pattern():
    """Generate pattern string for MCMC estimation parameters"""
    return "mcmc_params/"\
           "mcmc_estimator={mcmc_estimator}/"\
           "threshold={threshold}/"\
           "burnin_frac={burnin_frac}"

def dict_to_path(d):
    """
    This function takes the first element in a JSON object and creates a
    pattern string based on the keys. 
    """
    
    # If the dictionary is empty, return an empty string.
    if len(d) == 0:
        return ""

    c = d[0].copy() # take the first element in the list. BUG
    c.pop("id") # remove id from the string as only the parameters should identify the computation.
    if "burnin_frac" in c: 
        c.pop("burnin_frac")
    if "threshold" in c:      
        c.pop("threshold")
    if "mcmc_estimator" in c:      
        c.pop("mcmc_estimator")
    if "active" in c:
        c.pop("active")
    if "standardized" in c:
        c.pop("standardized")
    
    sep = "/"
    # HACK: Should put standardized first if it exists.. 
    tmp = [key+"={"+key+"}" for key, val in c.items()]
    ret = sep.join(tmp)
    return ret


def active_algorithm_files(bmark_setup):
    with open(configfilename) as json_file:
        conf = json.load(json_file)

    algs = active_algorithms(bmark_setup)
    alg_filenames = ["results/output/"+bmark_setup["title"]+"/benchmarks/"+bmark_setup
                     ["evaluation"]["benchmarks"]["filename_prefix"] + alg + ".csv" for alg in algs]

    return alg_filenames


def active_algorithms(bmark_setup, eval_method="benchmarks"):

    algs = []

    if (eval_method == "mcmc_traj_plots") or (eval_method == "mcmc_autocorr_plots") or (eval_method == "mcmc_heatmaps"):
        benchmarks_alg_ids = [benchmarks_dict["id"] for benchmarks_dict in bmark_setup
                              ["evaluation"][eval_method] if benchmarks_dict["active"] == True]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():
            for alg_conf_id in benchmarks_alg_ids:
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(alg)

    elif (eval_method == "benchmarks") or (eval_method == "graph_estimation"):
        benchmarks_alg_ids = bmark_setup["evaluation"][eval_method]["ids"]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():
            for alg_conf_id in benchmarks_alg_ids:
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(alg)

    else:
        benchmarks_alg_ids = [
            benchmarks_dict for benchmarks_dict in bmark_setup["evaluation"][eval_method]]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():
            for alg_conf_id in benchmarks_alg_ids:
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(alg)

    return list(set(algs))


def get_active_rules(wildcards):
    """
    This function returns empty "trigger files" for the type of evaluations
    that are used. Yes, this is ugly. Should maybe have a directory output instead.
    """
    rules = []
    for bmark_setup in config["benchmark_setup"]:
        evaluation = bmark_setup["evaluation"]
        bmark_setup_title = bmark_setup["title"]

        # graph_estimation
        if "graph_estimation" in evaluation and evaluation["graph_estimation"]["ids"] != []:
            # Create a done key.done file for each graph_type.
            graph_types = evaluation["graph_estimation"]["convert_to"] if evaluation["graph_estimation"]["convert_to"] != None else ["original"]
            graph_types += ["original"]

            # Go through all active features and create a .done file for each.
            for feature, isactive in evaluation["graph_estimation"].items():

                # These are not features, so skip
                if feature in ["ids", "convert_to"]:
                    continue

                if isactive == True:
                    for sim_setup in bmark_setup["data"]:
                        seed_range=get_seed_range(sim_setup["seed_range"])                                                
                        for seed in seed_range:                    
                            dataset = str("graph_id=" + str(sim_setup["graph_id"]) + "_parameters_id=" + str(sim_setup["parameters_id"]) + "_data_id=" + str(sim_setup["data_id"]) + "_seed=" + str(seed))
                            for alg in active_algorithms(bmark_setup, eval_method="graph_estimation"):
                                for graph_type in graph_types:
                                    rules.append("results/output/"+bmark_setup_title+"/graph_estimation/"+dataset+"/graph_type="+graph_type+"/"+feature+"/"+alg+".done")

        # mcmc_traj_plots
        if "mcmc_traj_plots" in evaluation and len(evaluation["mcmc_traj_plots"]) > 0:
            for item in evaluation["mcmc_traj_plots"]:
                # If at least one is active, create a done file.
                if ("active" not in item) or item["active"] == True:
                    rules.append("results/output/"+bmark_setup_title+"/mcmc_traj_plots/mcmc_traj_plots.done")
                    break

        # mcmc_heatmaps
        if "mcmc_heatmaps" in evaluation and len(evaluation["mcmc_heatmaps"]) > 0:
            for item in evaluation["mcmc_heatmaps"]:
                # If at least one is active, create a done file.
                if ("active" not in item) or item["active"] == True:
                    rules.append("results/output/"+bmark_setup_title+"/mcmc_heatmaps/mcmc_heatmaps.done")
                    break

        # mcmc_autocorr_plots
        if "mcmc_autocorr_plots" in evaluation and len(evaluation["mcmc_autocorr_plots"]) > 0:
            for item in evaluation["mcmc_autocorr_plots"]:
                # If at least one is active, create a done file.
                if ("active" not in item) or item["active"] == True:
                    rules.append("results/output/"+bmark_setup_title+"/mcmc_autocorr_plots/mcmc_autocorr_plots.done")
                    break

        # graph_true_plots
        if "graph_true_plots" in evaluation and evaluation["graph_true_plots"] == True:
            rules.append("results/output/"+bmark_setup_title+"/graph_true_plots/graph_true_plots.done")

        if "graph_true_stats" in evaluation and evaluation["graph_true_stats"] == True:
            rules.append("results/output/"+bmark_setup_title+"/graph_true_stats/graph_true_stats.done")

        # graph_plots
        if "graph_plots" in evaluation and len(evaluation["graph_plots"]) > 0:
            rules.append("results/output/"+bmark_setup_title+"/graph_plots/graph_plots.done")

        # ggally_ggpairs
        if "ggally_ggpairs" in evaluation and evaluation["ggally_ggpairs"] == True:
            rules.append("results/output/"+bmark_setup_title+"/ggally_ggpairs/ggally_ggpairs.done")

        # benchmarks
        if "benchmarks" in evaluation and len(evaluation["benchmarks"]["ids"]) > 0:
            rules.append("results/output/"+bmark_setup_title
                        +"/benchmarks/benchmarks.done")

    return rules


def get_mcmc_modules(alg_module_path="workflow/rules/structure_learning_algorithms/"):
    """
    This function returns the list of MCMC modules.
    """
    mcmc_modules = []
    for p in Path(alg_module_path).iterdir():
        if p.name.startswith("."): # Skip hidden files
            continue
        with open(p/"info.json") as json_file:
            info = json.load(json_file)
            if "graphtraj" in info["outputs"]:
                mcmc_modules.append(p.name)
    return mcmc_modules


def check_system_requirements():
    import subprocess
    from snakemake.utils import min_version
    # To update Snakemake using Mamba run
    # mamba update -c conda-forge -c bioconda snakemake

    min_version("7.30.1")

    # Check that Apptainer or Singularity >=3.2 is installed.
    (apptainer_ecode, apptainer_outp) = subprocess.getstatusoutput(
        "apptainer --version")
    (ecode, outp) = subprocess.getstatusoutput("singularity --version")
    # Check if either singularity of apptainera is installed
    if ecode != 0 and apptainer_ecode != 0:
        raise Exception("Benchpress requires Singularity >= 3.2 or Apptainer.")

    # If Singularity and not apptainer is installer, check the version of Singularity.
    if ecode == 0 and apptainer_ecode != 0:
        # This is usually on the format: singularity version x.y.z
        # Get the version number as a string as the last word
        version_string = outp.split()[-1]
        v1 = version_string.split(".")[0]  # major version
        v2 = version_string.split(".")[1]  # minor version
        smkver = float(v1 + "." + v2)  # Make it a number for comparison
        if smkver < 3.2:
            raise Exception(
                "You have " + outp + ". Benchpress requires Singularity >= 3.2."
            )


