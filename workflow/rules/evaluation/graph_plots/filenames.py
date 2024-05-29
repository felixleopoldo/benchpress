def graph_plots_feature_pattern(feature, 
                                param_string="", 
                                graph_type="{graph_type}",
                                filename="{filename}",
                                ext="{ext}"
                                ):
    if param_string != "":
        param_string = param_string + "/"

    str = (
        "{output_dir}/"
        "evaluation/graph_plots/graph_type="+graph_type+"/" + feature + "/" + param_string + 
        "adjmat=/{adjmat}/"
        "parameters=/{parameters}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        + filename + "." + ext
    )
    print(str)
    return str


def graph_plots_conf_to_feature_files(
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

    ret = [
        [
            [
                [
                    expand(
                        graph_plots_feature_pattern(module_feature, param_string=feature_argstring),
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
                    
                    for seed in get_seed_range(sim_setup["seed_range"])# if sim_setup["graph_id"] != None
                ]
                for sim_setup in config["benchmark_setup"]["data"]
            ]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] if alg_conf["id"] in config["benchmark_setup"]["evaluation"][eval_module]["ids"]
        ]
        for alg in active_algorithms(eval_module)
    ]
    # create a for loop doing the same as the list comprehension above, for debugging purposes
    
    for alg in active_algorithms(eval_module):
        print("alg: ", alg)
        for alg_conf in config["resources"]["structure_learning_algorithms"][alg]:
            print("alg_conf: ", alg_conf)
            if alg_conf["id"] in config["benchmark_setup"]["evaluation"][eval_module]["ids"]:
                print("alg_conf[id]: ", alg_conf["id"])
                for sim_setup in config["benchmark_setup"]["data"]:
                    print("sim_setup: ", sim_setup)
                    for seed in get_seed_range(sim_setup["seed_range"]):
                        print("seed: ", seed)
                        #if sim_setup["graph_id"] != None: #this was for graphvix.compare since it needs a graph!
                        print("sim_setup[graph_id]: ", sim_setup["graph_id"])
                        print(expand(
                            graph_plots_feature_pattern(module_feature, param_string=feature_argstring),
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
                        )
    
    print("the files")
    print(ret)

    return ret
