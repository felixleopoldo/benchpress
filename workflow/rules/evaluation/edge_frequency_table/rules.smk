# This module computes, for one or more user-specified edges, the proportion
# of seeds where each algorithm configuration recovered the edge — tabulated
# as: rows = sim_setups, columns = alg_conf IDs, one table per edge.


def _eft_collect_adjmats_over_seeds_single_param(sim_setup, alg_string, graph_type="original"):
    """Collect all estimated adjmat paths across seeds for a single parameter combination."""
    paths = []
    for seed in get_seed_range(sim_setup["seed_range"]):
        adjmat = gen_adjmat_string_from_conf(sim_setup["graph_id"], seed)
        parameters = gen_parameter_string_from_conf(sim_setup["parameters_id"], seed)
        data = gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False)

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


for bmark_setup in config["benchmark_setup"]:
    if "edge_frequency_table" not in bmark_setup["evaluation"]:
        continue
    eval_conf = bmark_setup["evaluation"]["edge_frequency_table"]
    if eval_conf is None:
        continue
    ids = eval_conf.get("ids", [])
    if len(ids) == 0:
        continue
    edges = eval_conf.get("edges", [])
    if len(edges) == 0:
        continue

    bmark_setup_title = bmark_setup["title"]
    graph_type = eval_conf.get("graph_type", "original")

    for edge in edges:
        edge_str = f"{edge[0]}_{edge[1]}"
        output_dir = (f"results/output/{bmark_setup_title}/"
                      f"edge_frequency_table/graph_type={graph_type}/{edge_str}")

        adjmat_files = []
        blocks = []
        sim_setup_labels = []
        true_adjmat_paths = []

        for sim_setup in bmark_setup["data"]:
            sim_id = (f"graph_id={sim_setup['graph_id']}_"
                      f"parameters_id={sim_setup['parameters_id']}_"
                      f"data_id={sim_setup['data_id']}")
            sim_setup_labels.append(sim_id)

            # True adjmat for this sim_setup (use first seed for fixed graphs)
            first_seed = get_seed_range(sim_setup["seed_range"])[0]
            adjmat_string = gen_adjmat_string_from_conf(sim_setup["graph_id"], first_seed)
            if isinstance(adjmat_string, list):
                adjmat_string = adjmat_string[0]
            if graph_type == "original":
                true_adjmat_paths.append(f"results/adjmat/{adjmat_string}.csv")
            else:
                true_adjmat_paths.append(
                    f"results/adjmat/graph_type={graph_type}/{adjmat_string}.csv")

            # Collect adjmat files in ids order (preserves column order in table)
            for alg_conf_id in ids:
                cell_files = []
                found = False
                for alg, alg_conf_list in config["resources"]["structure_learning_algorithms"].items():
                    if found:
                        break
                    for alg_conf in alg_conf_list:
                        if alg_conf["id"] == alg_conf_id:
                            for alg_str in json_string[alg_conf_id]:
                                cell_files += _eft_collect_adjmats_over_seeds_single_param(
                                    sim_setup, alg_str, graph_type)
                            found = True
                            break
                adjmat_files += cell_files
                blocks.append(len(cell_files))

        rule:
            name:
                f"edge_frequency_table_{bmark_setup_title}_{edge_str}_{graph_type}"
            input:
                adjmats=adjmat_files,
                true_adjmats=true_adjmat_paths
            output:
                done=touch(f"{output_dir}/table.done")
            params:
                edge=edge,
                alg_conf_ids=ids,
                sim_setup_labels=sim_setup_labels,
                n_sim_setups=len(bmark_setup["data"]),
                blocks=blocks,
                graph_type=graph_type,
                output_dir=output_dir,
                annot=eval_conf.get("annot", True),
                annot_fontsize=eval_conf.get("annot_fontsize", 6),
                show_title=eval_conf.get("show_title", True),
                show_cbar=eval_conf.get("show_cbar", True),
                figsize=eval_conf.get("figsize", None),
                format=eval_conf.get("format", "png")
            container:
                docker_image("pydatascience")
            script:
                "edge_frequency_table.py"
