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

features = {
    "graphs": {"ext":"png", "argstring":"", "filename":"graph"},
    "adjmats": {"ext":"png", "argstring":"", "filename":"adjmats"},
    "diffplots": {"ext":"png", "argstring":"", "filename":"diffplots"},
    "graphvizcompare": {"ext":"pdf", "argstring":"layout=True", "filename":"graphvizcompare"},
    "csvs": {"ext":"csv", "argstring":"", "filename":"adjmat"}
}

# Since we have a lot of different data setups and algs, we need to create a rule for 
# each combination of them.

for bmark_setup in config["benchmark_setup"]:
    
    graph_estimation = bmark_setup["evaluation"]["graph_estimation"]
    graph_types = graph_estimation["convert_to"] is not None and graph_estimation["convert_to"] or []
    graph_types += ["original"]

    bmark_setup_title = bmark_setup["title"]
    for feature, feature_dict in features.items():
        for graph_type in graph_types:
            for alg in active_algorithms(bmark_setup, eval_method="graph_estimation"):
                data_index = 0
                # We want one folder per data setup, so we create one rule for each of them.
                
                for sim_setup in bmark_setup["data"]:
                    for seed in get_seed_range(sim_setup["seed_range"]):  
                        
                        adjmat_strings = gen_adjmat_string_from_conf(sim_setup["graph_id"], seed) 
                        parameters_strings = gen_parameter_string_from_conf(sim_setup["parameters_id"], seed)
                        data_strings = gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False)
                        

                        if adjmat_strings is None:
                            adjmat_strings = [None]
                        elif isinstance(adjmat_strings, str):
                            adjmat_strings = [adjmat_strings]
                        if parameters_strings is None:
                            parameters_strings = [None]
                        elif isinstance(parameters_strings, str):
                            parameters_strings = [parameters_strings]
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
                                    #print(bmark_setup)
                                    rule:   
                                        name: 
                                            "results/output/"+bmark_setup_title+"/graph_estimation/dataset_"+str(data_index+1)+"/"+alg+"/graph_type="+graph_type+"/"+feature 
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
                                                                                            alg=alg,
                                                                                            bmark_setup=bmark_setup)
                                                                                            
                                        output:
                                            touch("results/output/"+bmark_setup_title+"/graph_estimation/dataset_"+str(data_index+1)+"/graph_type="+graph_type+"/"+feature+"/"+alg+".done")
                                            
                                        params:
                                            graph_type=graph_type,
                                            data_index=str(data_index+1),
                                            feature=feature,
                                            ext=feature_dict["ext"],
                                            alg=alg,
                                            bmark_setup=bmark_setup_title

                                        run:                                    
                                            output_dir = "results/output/{params.bmark_setup}/graph_estimation/dataset_"+params["data_index"]+"/graph_type="+params["graph_type"]+"/"+params["feature"]+"/"+params["alg"]
                                            # clean old file while keeping the directory
                                            # check if the directory exists
                                            if Path(output_dir).exists():
                                                # remove all files in the directory
                                                [f.unlink() for f in Path(output_dir).glob("*.png") ]
                                            for i, f in enumerate(input.graphs):                                            
                                                shell("mkdir -p " + output_dir)                                                                                                                                    
                                                shell("cp "+f+" " + output_dir + "/"+params["alg"]+"_"+params["graph_type"]+"_" +str(i+1) +"."+params["ext"])

                                    data_index += 1

