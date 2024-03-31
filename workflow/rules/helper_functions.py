def get_seed_range(seed_range):
    if seed_range == None:
        return [1]
    else:
        return range(seed_range[0], seed_range[1]+1)


def active_algorithm_files(wildcards):
    with open(configfilename) as json_file:
        conf = json.load(json_file)

    algs = active_algorithms()
    alg_filenames = ["results/output/benchmarks/"+conf["benchmark_setup"]
                     ["evaluation"]["benchmarks"]["filename_prefix"] + alg + ".csv" for alg in algs]
    return alg_filenames


def active_algorithms(eval_method="benchmarks"):
    with open(configfilename) as json_file:
        conf = json.load(json_file)

    algs = []

    if (eval_method == "mcmc_traj_plots") or (eval_method == "mcmc_autocorr_plots") or (eval_method == "mcmc_heatmaps"):
        benchmarks_alg_ids = [benchmarks_dict["id"] for benchmarks_dict in config["benchmark_setup"]
                              ["evaluation"][eval_method] if benchmarks_dict["active"] == True]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():
            for alg_conf_id in benchmarks_alg_ids:
                # print(alg_conf_id)
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(alg)
    elif eval_method == "benchmarks":
        benchmarks_alg_ids = config["benchmark_setup"]["evaluation"]["benchmarks"]["ids"]
        for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():
            for alg_conf_id in benchmarks_alg_ids:
                if alg_conf_id in [ac["id"] for ac in alg_conf_list]:
                    algs.append(alg)
    else:
        benchmarks_alg_ids = [
            benchmarks_dict for benchmarks_dict in config["benchmark_setup"]["evaluation"][eval_method]]
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
    for key, val in config["benchmark_setup"]["evaluation"].items():
        # Check if boolean or list or object wirh nonempty ids field.
        # TODO: this was OrderedDict, so might have to impose order somewhere.
        if isinstance(val, dict) and val["ids"] != []:
            rules.append("results/output/"+key+"/"+key+".done")
        if isinstance(val, bool) and val is True:
            rules.append("results/output/"+key+"/"+key+".done")
        if isinstance(val, list) and val != []:
            if key == "mcmc_traj_plots" or key == "mcmc_heatmaps" or key == "mcmc_autocorr_plots":
                for item in val:
                    if ("active" not in item) or item["active"] == True:
                        rules.append("results/output/"+key+"/"+key+".done")
                        break
            else:
                rules.append("results/output/"+key+"/"+key+".done")
    return rules


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


