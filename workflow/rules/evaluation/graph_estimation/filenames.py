
# This is defined in thebenchmarks module and temporarliy 
# redefined here.
# Should probably be defined at a global level.
def input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv"

# TODO: This has a bad format for e.g. true graphs.
def eval_module_feature_pattern(module,
                                feature, 
                                param_string="", 
                                graph_type="{graph_type}",
                                filename="{filename}",
                                ext="{ext}"
                                ):
    if param_string != "":
        param_string = param_string + "/"

    str = (
        "{output_dir}/"
        "evaluation/"+module+"/graph_type="+graph_type+"/" + feature + "/" + param_string + 
        "adjmat=/{adjmat}/"
        "parameters=/{parameters}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        + filename + "." + ext
    )
    return str

# TODO: This has a bad format for e.g. true graphs. Its not that general.
def eval_module_conf_to_feature_files(
    filename, 
    ext, 
    eval_module, 
    module_feature, 
    feature_argstring,
    graph_type
):
    evaluation_string = module_feature
    if feature_argstring != "":
        evaluation_string += "/" + feature_argstring
    # TODO: Should be a dict based on data setup
    ret = [
        [
            [
                [
                    expand(
                        eval_module_feature_pattern(eval_module, module_feature, param_string=feature_argstring),
                        output_dir="results",
                        alg_string=json_string[alg_conf["id"]],
                        **alg_conf,
                        seed=seed,
                        filename=filename,
                        graph_type=graph_type,
                        ext=ext,
                        evaluation_string=evaluation_string,
                        adjmat=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed),
                        parameters=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
                        data=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
                    
                    for seed in get_seed_range(sim_setup["seed_range"])
                ]
                for sim_setup in config["benchmark_setup"]["data"]
            ]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] if alg_conf["id"] in config["benchmark_setup"]["evaluation"][eval_module]["ids"]
        ]
        for alg in active_algorithms(eval_module)
    ]

    return ret
