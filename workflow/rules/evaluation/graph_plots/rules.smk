from filenames import *

include: "filenames.py"


rule adjmat_plot:
    input:
        matrix_filename=eval_module_feature_pattern(module="graph_plots", feature="csvs", filename="adjmat", ext="csv")
    output:
        plot_filename=eval_module_feature_pattern(module="graph_plots", feature="adjmat_plots")
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
rule adjmat_csv:
    input:
        ("{output_dir}/adjmat_estimate/"
         "adjmat=/{adjmat}/"
         "parameters=/{parameters}/"
         "data=/{data}/"
         "algorithm=/{alg_string}/"
         "seed={seed}/"
         "adjmat.csv")
    output:
        eval_module_feature_pattern(module="graph_plots", feature="csvs", graph_type="original")
    shell:
        "cp {input} {output}"

# This just copies the csv.
# Shit should be in the graph_true_plots module, if activated...
rule true_adjmat_csv:
    input:
        "{output_dir}/adjmat/{adjmat_and_seed}.csv"
    output:
        "{output_dir}/evaluation/graph_true_plots/graph_type=original/csvs/adjmat=/{adjmat_and_seed}/adjmat.csv"
    shell:
        "cp {input} {output}"

# A rule the converts between different types of graph, e.g. DAG to CPDAG.
# It assumes that the input is a DAG or a CPDAG. So its up to the user to use it in a correct way.
# As algorithms may output different types of graphs, we keep it like this.
rule convert_graph:
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
rule adjmat_to_dot:
    input:
        "workflow/scripts/utils/adjmat_to_dot.py",
        filename="{output_dir}/evaluation/graph_plots/graph_type={graph_type}/csvs/{something}/adjmat.csv"  # true graph has adjmat in the path and estimated does not.
    output:
        filename="{output_dir}/evaluation/graph_plots/graph_type={graph_type}/dot/{something}/graph.dot" # maybe need a temp dot folder
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

rule dot_to_plot:
    input:
        "{output_dir}/evaluation/graph_plots/graph_type={graph_type}/dot/{something}/graph.dot"
    output:
        "{output_dir}/evaluation/graph_plots/graph_type={graph_type}/graphs/{something}/graph.png"
    container:
        docker_image("trilearn")
    shell:
        """
        if [ -s {input} ]; then
            dot -T png {input} -o {output}
        else
            touch {output}
        fi
        """

# The adjmat_est pattern could in the future be raplaced byt the adjmat pattern of the modules algorithm.
rule bnlearn_graphvizcompare:
    input:
        adjmat_true = ("{output_dir}/"
                       "evaluation/graph_true_plots/graph_type={graph_type}/csvs/"
                       "adjmat=/{adjmat}/"
                       "adjmat.csv"),
        adjmat_est=eval_module_feature_pattern(module="graph_plots", feature="csvs", filename="adjmat", ext="csv")
    output:
        filename=eval_module_feature_pattern(module="graph_plots",feature="graphvizcompare", param_string="layout={layout}")
    params:
        graph_type="{graph_type}"
    script:
        "bnlearn_graphvizcompare.R"

rule adjmat_diffplot:
    input:
        adjmat_true = ("{output_dir}/"
                       "evaluation/graph_true_plots/graph_type={graph_type}/csvs/"
                       "adjmat=/{adjmat}/"
                       "adjmat.csv"),
        adjmat_est=eval_module_feature_pattern(module="graph_plots", feature="csvs", filename="adjmat", ext="csv")
    output:
        filename=eval_module_feature_pattern(module="graph_plots", feature="adjmat_diffplot")
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

# This new version of the rule graph_plots lets the user specify which plots to include in the output.
# It generates a rule for each type of graph that is specified in other_graph_types, apart from the original graph.
graph_plots = config["benchmark_setup"]["evaluation"]["graph_plots"]
for graph_type in graph_plots["other_graph_types"]:

    rule:
        name: "graph_plots_"+str(graph_type)
        input:
            conf=configfilename,
            graphs=[d for d in eval_module_conf_to_feature_files(filename="graph",
                                                                ext="png",
                                                                eval_module="graph_plots",
                                                                module_feature="graphs",
                                                                feature_argstring="",
                                                                graph_type=graph_type)
                        if ("graphs" in graph_plots) and graph_plots["graphs"]],

            adjmats=[d for d in eval_module_conf_to_feature_files(filename="adjmats",
                                                            ext="png",
                                                            eval_module="graph_plots",
                                                            module_feature="adjmat_plots",
                                                            feature_argstring="",
                                                            graph_type=graph_type)
                        if ("adjmats" in graph_plots) and graph_plots["adjmats"]],

            adjmat_diffplots=[d for d in eval_module_conf_to_feature_files(filename="adjmat_diffplot",
                                                                        ext="png",
                                                                        eval_module="graph_plots",
                                                                        module_feature="adjmat_diffplot",
                                                                        feature_argstring="",
                                                                        graph_type=graph_type)
                        if ("diffplots" in graph_plots) and graph_plots["diffplots"]],

            graphvizcompare=[d for d in eval_module_conf_to_feature_files(filename="graphvizcompare",
                                                                        ext="pdf",
                                                                        eval_module="graph_plots",
                                                                        module_feature="graphvizcompare",
                                                                        feature_argstring="layout=True",
                                                                         graph_type=graph_type)
                        if ("graphvizcompare" in graph_plots) and graph_plots["graphvizcompare"]],
            csvs=[d for d in eval_module_conf_to_feature_files(filename="adjmat",
                                                                        ext="csv",
                                                                        eval_module="graph_plots",
                                                                        module_feature="csvs",
                                                                        feature_argstring="",
                                                                        graph_type=graph_type)
                        if ("csvs" in graph_plots) and graph_plots["csvs"]]

        output:
            directory("results/output/graph_plots/graph_type="+graph_type+"/graphs") if ("graphs" in graph_plots) and graph_plots["graphs"] else [],            
            directory("results/output/graph_plots/graph_type="+graph_type+"/adjmats") if ("adjmats" in graph_plots) and graph_plots["adjmats"] else [],
            directory("results/output/graph_plots/graph_type="+graph_type+"/adjmat_diffplots") if ("diffplots" in graph_plots) and graph_plots["diffplots"] else [],
            directory("results/output/graph_plots/graph_type="+graph_type+"/graphvizcompare") if ("graphvizcompare" in graph_plots) and graph_plots["graphvizcompare"] else [],
            directory("results/output/graph_plots/graph_type="+graph_type+"/csvs") if ("csvs" in graph_plots) and graph_plots["csvs"] else [],
            touch("results/output/graph_plots/graph_type="+graph_type+"/graph_plots.done")
        params:
            graph_type=graph_type
        run:
            # Goes through the list of graphs etc. and copies them to the output directories.
            for i,f in enumerate(sorted(input.graphs)):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/graphs && "
                      "cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/graphs/graph_"+params["graph_type"]+"_" +str(i+1) +".png")

            for i,f in enumerate(sorted(input.adjmats)):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmats &&"
                      "cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmats/adjmat_"+params["graph_type"]+"_" +str(i+1) +".png")

            for i,f in enumerate(sorted(input.csvs)):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/csvs && "
                      "cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/csvs/adjmat_"+params["graph_type"]+"_" +str(i+1) +".csv")

            for i,f in enumerate(sorted(input.graphvizcompare)):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/graphvizcompare")
                shell("cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/graphvizcompare/compare_"+params["graph_type"]+"_" +str(i+1) +".pdf")

            for i,f in enumerate(sorted(input.adjmat_diffplots)):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmat_diffplots")
                shell("cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmat_diffplots/diffplot_"+params["graph_type"]+"_" +str(i+1) +".png")
