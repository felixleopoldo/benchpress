
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


def eval_module_conf_to_feature_files_data(
    filename, 
    ext, 
    seed,
    eval_module, 
    module_feature, 
    feature_argstring,
    graph_type,
    data_string,
    parameters_string,
    adjmat_string,
    alg
):
    evaluation_string = module_feature
    if feature_argstring != "":
        evaluation_string += "/" + feature_argstring

    ret = [

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
                adjmat=adjmat_string,
                parameters=parameters_string,
                data=data_string)
                for alg_conf in config["resources"]["structure_learning_algorithms"][alg] if alg_conf["id"] in config["benchmark_setup"]["evaluation"][eval_module]["ids"]

         ]

    return ret
