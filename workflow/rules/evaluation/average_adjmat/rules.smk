# This module computes average adjacency matrices over seeds.
# It shows the probability of estimating each edge across different
# random seeds (which affect parameters and data generation).

# Conversion rule for estimated graphs (skeleton, cpdag, pattern)
rule average_adjmat_convert_graph:
    input:
        filename="{output_dir}/adjmat_estimate/"
            "adjmat=/{adjmat}/"
            "parameters=/{parameters}/"
            "data=/{data}/"
            "algorithm=/{alg_string}/"
            "seed={seed}/"
            "adjmat.csv"
    output:
        filename="{output_dir}/adjmat_estimate/"
            "graph_type={graph_type}/"
            "adjmat=/{adjmat}/"
            "parameters=/{parameters}/"
            "data=/{data}/"
            "algorithm=/{alg_string}/"
            "seed={seed}/"
            "adjmat.csv"
    params:
        output_graph_type="{graph_type}"
    wildcard_constraints:
        graph_type="(cpdag|pattern|skeleton)"
    script:
        "../graph_estimation/convert_graph.R"

# Conversion rule for true graphs
rule average_adjmat_convert_true_graph:
    input:
        filename="{output_dir}/adjmat/{adjmat}.csv"
    output:
        filename="{output_dir}/adjmat/graph_type={graph_type}/{adjmat}.csv"
    params:
        output_graph_type="{graph_type}"
    wildcard_constraints:
        graph_type="(cpdag|pattern|skeleton)"
    script:
        "../graph_estimation/convert_graph.R"


def collect_adjmats_over_seeds_single_param(sim_setup, alg_string, graph_type="original"):
    """Collect all estimated adjmat paths across seeds for a single parameter combination."""
    paths = []
    for seed in get_seed_range(sim_setup["seed_range"]):
        adjmat = gen_adjmat_string_from_conf(sim_setup["graph_id"], seed)
        parameters = gen_parameter_string_from_conf(sim_setup["parameters_id"], seed)
        data = gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False)
        
        # These functions return lists from expand(), get first element
        if isinstance(adjmat, list):
            adjmat = adjmat[0]
        if isinstance(parameters, list):
            parameters = parameters[0]
        if isinstance(data, list):
            data = data[0]
        
        if graph_type == "original":
            path = (f"results/adjmat_estimate/"
                    f"adjmat=/{adjmat}/"
                    f"parameters=/{parameters}/"
                    f"data=/{data}/"
                    f"algorithm=/{alg_string}/"
                    f"seed={seed}/"
                    f"adjmat.csv")
        else:
            path = (f"results/adjmat_estimate/"
                    f"graph_type={graph_type}/"
                    f"adjmat=/{adjmat}/"
                    f"parameters=/{parameters}/"
                    f"data=/{data}/"
                    f"algorithm=/{alg_string}/"
                    f"seed={seed}/"
                    f"adjmat.csv")
        paths.append(path)
    return paths


def get_first_adjmat_string(sim_setup):
    """Get the adjmat string for the first seed (used for fixed graphs)."""
    first_seed = get_seed_range(sim_setup["seed_range"])[0]
    result = gen_adjmat_string_from_conf(sim_setup["graph_id"], first_seed)
    if isinstance(result, list):
        return result[0]
    return result


for bmark_setup in config["benchmark_setup"]:
    if "average_adjmat" not in bmark_setup["evaluation"]:
        continue
    if bmark_setup["evaluation"]["average_adjmat"] is None:
        continue
    if len(bmark_setup["evaluation"]["average_adjmat"].get("ids", [])) == 0:
        continue

    bmark_setup_title = bmark_setup["title"]
    graph_type = bmark_setup["evaluation"]["average_adjmat"].get("graph_type", "original")

    for alg in active_algorithms(bmark_setup, eval_method="average_adjmat"):
        for alg_conf in config["resources"]["structure_learning_algorithms"][alg]:
            if alg_conf["id"] not in bmark_setup["evaluation"]["average_adjmat"]["ids"]:
                continue

            for sim_setup in bmark_setup["data"]:
                first_seed = get_seed_range(sim_setup["seed_range"])[0]
                adjmat_string = get_first_adjmat_string(sim_setup)
                
                parameters_string = gen_parameter_string_from_conf(sim_setup["parameters_id"], first_seed)
                if isinstance(parameters_string, list):
                    parameters_string = parameters_string[0]
                
                data_string = gen_data_string_from_conf(sim_setup["data_id"], first_seed, seed_in_path=False)
                if isinstance(data_string, list):
                    data_string = data_string[0]
                
                alg_strings = json_string[alg_conf["id"]]
                
                sim_id = f"graph_id={sim_setup['graph_id']}_parameters_id={sim_setup['parameters_id']}_data_id={sim_setup['data_id']}"
                output_dir = f"results/output/{bmark_setup_title}/average_adjmat/{sim_id}/graph_type={graph_type}/{alg}"

                if graph_type == "original":
                    true_adjmat_path = f"results/adjmat/{adjmat_string}.csv"
                else:
                    true_adjmat_path = f"results/adjmat/graph_type={graph_type}/{adjmat_string}.csv"

                rule:
                    name:
                        f"average_adjmat_{bmark_setup_title}_{sim_setup['graph_id']}_{alg_conf['id']}_{graph_type}"
                    input:
                        conf=configfilename,
                        adjmats=[
                            collect_adjmats_over_seeds_single_param(sim_setup, alg_str, graph_type)
                            for alg_str in alg_strings
                        ],
                        true_adjmat=true_adjmat_path
                    output:
                        done=touch(f"{output_dir}/{alg_conf['id']}.done")
                    params:
                        adjmat_string=adjmat_string,
                        parameters_string=parameters_string,
                        data_string=data_string,
                        alg_strings=alg_strings,
                        alg_id=alg_conf["id"],
                        alg_module=alg,
                        graph_type=graph_type,
                        output_dir=output_dir,
                        n_seeds=len(get_seed_range(sim_setup["seed_range"]))
                    container:
                        docker_image("pydatascience")
                    script:
                        "average_adjmat.py"
