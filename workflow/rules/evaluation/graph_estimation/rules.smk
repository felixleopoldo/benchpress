from filenames import *

include: "filenames.py"


rule graph_estimation_adjmat_plot:
    input:
        matrix_filename=eval_module_feature_pattern(module="graph_estimation", feature="csvs", filename="adjmat", ext="csv")
    output:
        plot_filename=eval_module_feature_pattern(module="graph_estimation", feature="adjmats")
    params:
        title="Graph: {adjmat}\nParameters: {parameters}\nData: {data}",
        adjmat_string="{adjmat}",
        param_string="{parameters}",
        data_string="{data}",
        alg_string="{alg_string}",
        graph_type="{graph_type}"
    container:
        docker_image("pydatascience")
    script:
        "plot_matrix_as_heatmap.py"

# This just copies the csv. May this should be the actual estimation rule instead.
rule graph_estimation_adjmat_csv:
    input:
        ("{output_dir}/adjmat_estimate/"
         "adjmat=/{adjmat}/"
         "parameters=/{parameters}/"
         "data=/{data}/"
         "algorithm=/{alg_string}/"
         "seed={seed}/"
         "adjmat.csv")
    output:
        eval_module_feature_pattern(module="graph_estimation", feature="csvs", graph_type="original")
    shell:
        "cp {input} {output}"

# This just copies the csv.
# Shit should be in the graph_true_plots module, if activated...
rule graph_estimation_true_adjmat_csv:
    input:
        "{output_dir}/adjmat/{adjmat_and_seed}.csv"
    output:
        "{output_dir}/evaluation/graph_true_plots/graph_type=original/csvs/adjmat=/{adjmat_and_seed}/adjmat.csv"
    shell:
        "cp {input} {output}"

# A rule the converts between different types of graph, e.g. DAG to CPDAG.
# It assumes that the input is a DAG or a CPDAG. So its up to the user to use it in a correct way.
# As algorithms may output different types of graphs, we keep it like this.
rule graph_estimation_convert_graph:
    input:
        filename="{whatever}/evaluation/{eval_module}/graph_type=original/csvs/{something}/adjmat.csv"
    output:
        filename="{whatever}/evaluation/{eval_module}/graph_type={graph_type}/csvs/{something}/adjmat.csv"
    params:
        output_graph_type="{graph_type}"
    wildcard_constraints:
        graph_type="(cpdag|pattern|skeleton)"
    script:
        "convert_graph.R"


# This rule is very generally specified and relies on that it is called in the right way.
# I.e with the path of an adjacency matrix.
rule graph_estimation_adjmat_to_dot:
    input:
        "workflow/scripts/utils/adjmat_to_dot.py",
        filename="{output_dir}/evaluation/graph_estimation/graph_type={graph_type}/csvs/{something}/adjmat.csv"  # true graph has adjmat in the path and estimated does not.
    output:
        filename="{output_dir}/evaluation/graph_estimation/graph_type={graph_type}/dot/{something}/graph.dot" # maybe need a temp dot folder
    container:
        docker_image("trilearn")
    shell:
        """
        if [ -s {input.filename} ]; then
            python workflow/scripts/utils/adjmat_to_dot.py {input.filename} {output.filename}
        else
            touch {output.filename}
        fi
        """

rule graph_estimation_dot_to_plot:
    input:
        "{output_dir}/evaluation/graph_estimation/graph_type={graph_type}/dot/{something}/graph.dot"
    output:
        "{output_dir}/evaluation/graph_estimation/graph_type={graph_type}/graphs/{something}/graph.png"
    container:
        docker_image("trilearn")
    shell: # labels could be edded by -Glabel="{wildcards.something}"
        """
        if [ -s {input} ]; then
            dot -T png {input} -o {output} -Glabel="Graph type: {wildcards.graph_type}"
        else
            touch {output}
        fi
        """

# The adjmat_est pattern could in the future be raplaced byt the adjmat pattern of the modules algorithm.
rule graph_estimation_bnlearn_graphvizcompare:
    input:
        adjmat_true = ("{output_dir}/"
                       "evaluation/graph_true_plots/graph_type={graph_type}/csvs/"
                       "adjmat=/{adjmat}/"
                       "adjmat.csv"),
        adjmat_est=eval_module_feature_pattern(module="graph_estimation", feature="csvs", filename="adjmat", ext="csv")
    output:
        filename=eval_module_feature_pattern(module="graph_estimation",feature="graphvizcompare", param_string="layout={layout}")
    params:
        graph_type="{graph_type}"
    script:
        "bnlearn_graphvizcompare.R"

rule graph_estimation_adjmat_diffplot:
    input:
        adjmat_true = ("{output_dir}/"
                       "evaluation/graph_true_plots/graph_type={graph_type}/csvs/"
                       "adjmat=/{adjmat}/"
                       "adjmat.csv"),
        adjmat_est=eval_module_feature_pattern(module="graph_estimation", feature="csvs", filename="adjmat", ext="csv")
    output:
        filename=eval_module_feature_pattern(module="graph_estimation", feature="diffplots")
    params:
        title="Graph: {adjmat}\nParameters: {parameters}\nData: {data}",
        adjmat_string="{adjmat}",
        param_string="{parameters}",
        data_string="{data}",
        alg_string="{alg_string}",
        graph_type="{graph_type}"
    container:
        docker_image("pydatascience")
    script:
        "adjmat_diffplot.py"

# This new version of the rule graph_estimation lets the user specify which plots to include in the output.
# It generates a rule for each type of graph that is specified in other_graph_types, apart from the original graph.
graph_estimation = config["benchmark_setup"]["evaluation"]["graph_estimation"]
graph_types = graph_estimation["convert_to"] is not None and graph_estimation["convert_to"] or []
graph_types += ["original"]

features = {
    "graphs": {"ext":"png", "argstring":"", "filename":"graph"},
    "adjmats": {"ext":"png", "argstring":"", "filename":"adjmats"},
    "diffplots": {"ext":"png", "argstring":"", "filename":"diffplots"},
    "graphvizcompare": {"ext":"pdf", "argstring":"layout=True", "filename":"graphvizcompare"},
    "csvs": {"ext":"csv", "argstring":"", "filename":"adjmat"}
}

for feature, feature_dict in features.items():
    for graph_type in graph_types:
        for alg in active_algorithms("graph_estimation"):
            data_index = 0
            # We want one folder per data setup, so we create one rule for each of them.
            
            for sim_setup in config["benchmark_setup"]["data"]:
                for seed in get_seed_range(sim_setup["seed_range"]):  
                    
                    adjmat_strings = gen_adjmat_string_from_conf(sim_setup["graph_id"], seed) 
                    parameters_strings = gen_parameter_string_from_conf(sim_setup["parameters_id"], seed)
                    data_strings = gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False)
                    
                    if adjmat_strings is None:
                        adjmat_strings = [None]
                    if parameters_strings is None:
                        parameters_strings = [None]
                    if data_strings is None:
                        data_strings = [None]
                    elif isinstance(data_strings, str):
                        data_strings = [data_strings]
                    # sort them
                    adjmat_strings = sorted(adjmat_strings)
                    parameters_strings = sorted(parameters_strings)
                    data_strings = sorted(data_strings)

                    for adjmat_string in adjmat_strings:
                        for parameters_string in parameters_strings:
                            for data_string in data_strings:
                                rule:
                                    name: 
                                        "results/output/graph_estimation/dataset_"+str(data_index)+"/"+alg+"/graph_type="+graph_type+"/"+feature 
                                    input:
                                        conf=configfilename,
                                        graphs=eval_module_conf_to_feature_files_data(filename=feature_dict["filename"],
                                                                                        ext=feature_dict["ext"],
                                                                                        seed=seed,
                                                                                        eval_module="graph_estimation",
                                                                                        module_feature=feature,
                                                                                        feature_argstring=feature_dict["argstring"],
                                                                                        graph_type=graph_type,
                                                                                        adjmat_string=adjmat_string,
                                                                                        parameters_string=parameters_string,
                                                                                        data_string=data_string,
                                                                                        alg=alg)
                                                                                        
                                    output:
                                        touch("results/output/graph_estimation/dataset_"+str(data_index)+"/graph_type="+graph_type+"/"+feature+"/"+alg+".done")
                                        
                                    params:
                                        graph_type=graph_type,
                                        data_index=str(data_index),
                                        feature=feature,
                                        ext=feature_dict["ext"],
                                        alg=alg
                                    run:
                                        for i, f in enumerate(input.graphs):
                                            
                                            shell("mkdir -p results/output/graph_estimation/dataset_"+params["data_index"]+"/graph_type="+params["graph_type"]+"/"+params["feature"]+"/"+params["alg"])
                                            # clean old file while keeping the directory
                                            #newfile = "results/output/graph_estimation/dataset_"+params["data_index"]+"/graph_type="+params["graph_type"]+"/"+params["feature"]+"/"+params["alg"]+"/"+params["feature"]+"_"+params["graph_type"]+"_" +str(i+1) +"."+params["ext"]
                                            Path("results/output/graph_estimation/dataset_"+params["data_index"]+"/graph_type="+params["graph_type"]+"/"+params["feature"]+"/"+params["alg"]+"/"+params["alg"]+"_"+params["graph_type"]+"_" +str(i+1) +"."+params["ext"]).unlink(missing_ok=True)
                                            shell("cp "+f+" " + "results/output/graph_estimation/dataset_"+params["data_index"]+"/graph_type="+params["graph_type"]+"/"+params["feature"]+"/"+params["alg"]+"/"+params["alg"]+"_"+params["graph_type"]+"_" +str(i+1) +"."+params["ext"])

                                data_index += 1



    # rule:
    #     name: "graph_estimation_graphs_"+str(graph_type)
    #     input:
    #         conf=configfilename,
    #         graphs=eval_module_conf_to_feature_files(filename="graph",
    #                                                  ext="png",
    #                                                  eval_module="graph_estimation",
    #                                                  module_feature="graphs",
    #                                                  feature_argstring="",
    #                                                  graph_type=graph_type) if ("graphs" in graph_estimation) and graph_estimation["graphs"] else []
    #     output:
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/graphs") if ("graphs" in graph_estimation) and graph_estimation["graphs"] else []

    #     params:
    #         graph_type=graph_type
    #     run:
    #         for i,f in enumerate(sorted(input.graphs)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphs && "
    #                   "cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphs/graph_"+params["graph_type"]+"_" +str(i+1) +".png")

    # rule:
    #     name: "graph_estimation_adjmats_"+str(graph_type)
    #     input:
    #         conf=configfilename,
    #         adjmats=eval_module_conf_to_feature_files(filename="adjmats",
    #                                                 ext="png",
    #                                                 eval_module="graph_estimation",
    #                                                 module_feature="adjmat_plots",
    #                                                 feature_argstring="",
    #                                                 graph_type=graph_type) if ("adjmats" in graph_estimation) and graph_estimation["adjmats"] else []
    #     output:
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/adjmats") if ("adjmats" in graph_estimation) and graph_estimation["adjmats"] else []
    #     params:
    #         graph_type=graph_type
    #     run:
    #         for i,f in enumerate(sorted(input.adjmats)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmats &&"
    #                   "cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmats/adjmat_"+params["graph_type"]+"_" +str(i+1) +".png")
    
    # rule:
    #     name: "graph_estimation_csvs_"+str(graph_type)
    #     input:
    #         conf=configfilename,
    #         csvs=eval_module_conf_to_feature_files(filename="adjmat",
    #                                                 ext="csv",
    #                                                 eval_module="graph_estimation",
    #                                                 module_feature="csvs",
    #                                                 feature_argstring="",
    #                                                 graph_type=graph_type) if ("csvs" in graph_estimation) and graph_estimation["csvs"] else []
    #     output:
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/csvs") if ("csvs" in graph_estimation) and graph_estimation["csvs"] else []
    #     params:
    #         graph_type=graph_type
    #     run:
    #         for i,f in enumerate(sorted(input.csvs)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/csvs && "
    #                   "cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/csvs/adjmat_"+params["graph_type"]+"_" +str(i+1) +".csv")

    # rule:
    #     name: "graph_estimation_graphvizcompare_"+str(graph_type)
    #     input:
    #         conf=configfilename,
    #         graphvizcompare=eval_module_conf_to_feature_files(filename="graphvizcompare",
    #                                                         ext="pdf",
    #                                                         eval_module="graph_estimation",
    #                                                         module_feature="graphvizcompare",
    #                                                         feature_argstring="layout=True",
    #                                                             graph_type=graph_type) if ("graphvizcompare" in graph_estimation) and graph_estimation["graphvizcompare"] else []
    #     output:
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/graphvizcompare") if ("graphvizcompare" in graph_estimation) and graph_estimation["graphvizcompare"] else []
    #     params:
    #         graph_type=graph_type
    #     run:
    #         for i,f in enumerate(sorted(input.graphvizcompare)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphvizcompare")
    #             shell("cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphvizcompare/compare_"+params["graph_type"]+"_" +str(i+1) +".pdf")

    # rule:
    #     name: "graph_estimation_adjmat_diffplots_"+str(graph_type)
    #     input:
    #         conf=configfilename,
    #         adjmat_diffplots=eval_module_conf_to_feature_files(filename="adjmat_diffplot",
    #                                                             ext="png",
    #                                                             eval_module="graph_estimation",
    #                                                             module_feature="adjmat_diffplot",
    #                                                             feature_argstring="",
    #                                                             graph_type=graph_type) if ("diffplots" in graph_estimation) and graph_estimation["diffplots"] else []
    #     output:
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/adjmat_diffplots") if ("diffplots" in graph_estimation) and graph_estimation["diffplots"] else []
    #     params:
    #         graph_type=graph_type
    #     run:
    #         for i,f in enumerate(sorted(input.adjmat_diffplots)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmat_diffplots")
    #             shell("cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmat_diffplots/diffplot_"+params["graph_type"]+"_" +str(i+1) +".png")



    # rule:
    #     name: "graph_estimation_"+str(graph_type)
    #     input:
    #         conf=configfilename,            
    #         graphs=eval_module_conf_to_feature_files(filename="graph",
    #                                                 ext="png",
    #                                                 eval_module="graph_estimation",
    #                                                 module_feature="graphs",
    #                                                 feature_argstring="",
    #                                                 graph_type=graph_type) if ("graphs" in graph_estimation) and graph_estimation["graphs"] else [],

    #         adjmats=eval_module_conf_to_feature_files(filename="adjmats",
    #                                                 ext="png",
    #                                                 eval_module="graph_estimation",
    #                                                 module_feature="adjmat_plots",
    #                                                 feature_argstring="",
    #                                                 graph_type=graph_type) if ("adjmats" in graph_estimation) and graph_estimation["adjmats"] else [],
    #         adjmat_diffplots=eval_module_conf_to_feature_files(filename="adjmat_diffplot",
    #                                                             ext="png",
    #                                                             eval_module="graph_estimation",
    #                                                             module_feature="adjmat_diffplot",
    #                                                             feature_argstring="",
    #                                                             graph_type=graph_type) if ("diffplots" in graph_estimation) and graph_estimation["diffplots"] else [],

    #         graphvizcompare=eval_module_conf_to_feature_files(filename="graphvizcompare",
    #                                                         ext="pdf",
    #                                                         eval_module="graph_estimation",
    #                                                         module_feature="graphvizcompare",
    #                                                         feature_argstring="layout=True",
    #                                                             graph_type=graph_type) if ("graphvizcompare" in graph_estimation) and graph_estimation["graphvizcompare"] else [],
    #         csvs=eval_module_conf_to_feature_files(filename="adjmat",
    #                                                 ext="csv",
    #                                                 eval_module="graph_estimation",
    #                                                 module_feature="csvs",
    #                                                 feature_argstring="",
    #                                                 graph_type=graph_type) if ("csvs" in graph_estimation) and graph_estimation["csvs"] else []

    #     output:
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/graphs") if ("graphs" in graph_estimation) and graph_estimation["graphs"] else [],            
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/adjmats") if ("adjmats" in graph_estimation) and graph_estimation["adjmats"] else [],
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/adjmat_diffplots") if ("diffplots" in graph_estimation) and graph_estimation["diffplots"] else [],
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/graphvizcompare") if ("graphvizcompare" in graph_estimation) and graph_estimation["graphvizcompare"] else [],
    #         directory("results/output/graph_estimation/graph_type="+graph_type+"/csvs") if ("csvs" in graph_estimation) and graph_estimation["csvs"] else [],
    #         touch("results/output/graph_estimation/graph_type="+graph_type+"/graph_estimation.done")
    #     params:
    #         graph_type=graph_type
    #     run:
    #         # Goes through the list of graphs etc. and copies them to the output directories.
    #         for i,f in enumerate(sorted(input.graphs)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphs && "
    #                   "cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphs/graph_"+params["graph_type"]+"_" +str(i+1) +".png")

    #         for i,f in enumerate(sorted(input.adjmats)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmats &&"
    #                   "cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmats/adjmat_"+params["graph_type"]+"_" +str(i+1) +".png")

    #         for i,f in enumerate(sorted(input.csvs)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/csvs && "
    #                   "cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/csvs/adjmat_"+params["graph_type"]+"_" +str(i+1) +".csv")

    #         for i,f in enumerate(sorted(input.graphvizcompare)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphvizcompare")
    #             shell("cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/graphvizcompare/compare_"+params["graph_type"]+"_" +str(i+1) +".pdf")

    #         for i,f in enumerate(sorted(input.adjmat_diffplots)):
    #             shell("mkdir -p results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmat_diffplots")
    #             shell("cp "+f+" results/output/graph_estimation/graph_type="+params["graph_type"]+"/adjmat_diffplots/diffplot_"+params["graph_type"]+"_" +str(i+1) +".png")
    # split this big rule into smaller rules