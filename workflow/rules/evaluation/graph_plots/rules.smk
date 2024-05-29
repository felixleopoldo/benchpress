from filenames import *

include: "filenames.py"


# These two rules are also defined in thebenchmarks module and temporarliy 
# redefined here.
# They should probably be defined at a global level.
def input_data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{parameters}/data=/{data}/seed={seed}.csv"

def input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv"


rule adjmat_plot:
    input:        
        matrix_filename=graph_plots_feature_pattern(feature="csvs", filename="adjmat", ext="csv")

    output:
        plot_filename=graph_plots_feature_pattern(feature="adjmat_plots")   
    params:
        title="Graph: {adjmat}\nParameters: {parameters}\nData: {data}",
        adjmat_string="{adjmat}",
        param_string="{parameters}",
        data_string="{data}",
        alg_string="{alg_string}",
    container:
        docker_image("pydatascience")
    script:
        "plot_matrix_as_heatmap.py"

# This just copies the csv. May this should be the actual estimation rule instead.
rule adjmat_csv:
    input:
        matrix_filename=("{output_dir}/adjmat_estimate/"
                    "adjmat=/{adjmat}/"
                    "parameters=/{parameters}/"
                    "data=/{data}/"
                    "algorithm=/{alg_string}/"
                    "seed={seed}/"
                    "adjmat.csv")
    output:
        plot_filename=graph_plots_feature_pattern(feature="csvs", graph_type="original") # this should be with original graph type.
    params:
        title="Graph: {adjmat}\nParameters: {parameters}\nData: {data}",
        adjmat_string="{adjmat}",
        param_string="{parameters}",
        data_string="{data}",
        alg_string="{alg_string}",
    container:
        docker_image("pydatascience")
    shell:
        "cp {input.matrix_filename} {output.plot_filename}"

# A rule the converts between different types of graph, e.g. DAG to CPDAG.
# It assumes that the input is a DAG or a CPDAG. So its up to the user to use it in a correct way.
# As algorithms may output different types of graphs, we keep it like this.
rule dag_to_cpdag:
    input:
        filename="{whatever}/evaluation/graph_plots/graph_type=original/csvs/{something}/adjmat.csv"
    output:
        filename="{whatever}/evaluation/graph_plots/graph_type=cpdag/csvs/{something}/adjmat.csv"
    container:
        "docker://bpimages/pcalg:2.7-8"
    params:
        to="cpdag"
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

# This is actually a quite general rule.
# The adjmat_est pattern could in the future be raplaced byt the adjmat pattern of the modules algorithm.
rule bnlearn_graphvizcompare:
    input:
        data=input_data_path(),
        adjmat_true=input_adjmat_true_path(), # should take the right graph, maybe as a paratemer to the rule.
        adjmat_est=graph_plots_feature_pattern(feature="csvs")
    output:
        filename=graph_plots_feature_pattern(feature="graphvizcompare", param_string="layout={layout}")
    params:
        graph_type="{wildcards.graph_type}"
    script:
        "bnlearn_graphvizcompare.R"

# This is actually a quite general rule.
rule adjmat_diffplot:
    input:
        data=input_data_path(),
        adjmat_true=input_adjmat_true_path(),
        adjmat_est=graph_plots_feature_pattern(feature="csvs")
    output:
        filename=graph_plots_feature_pattern(feature="adjmat_diffplot")
    params:
        title="Graph: {adjmat}\nParameters: {parameters}\nData: {data}",
        adjmat_string="{adjmat}",
        param_string="{parameters}",
        data_string="{data}",
        alg_string="{alg_string}"
    container:
        docker_image("pydatascience")
    script:
        "adjmat_diffplot.py"

# This new version of the rule graph_plots lets the user specify which plots to include in the output.
# It generates a rule for each type of graph that is specified in other_graph_types, apart from the original graph.
for graph_type in config["benchmark_setup"]["evaluation"]["graph_plots"]["other_graph_types"]:

    rule:
        name: "graph_plots_"+str(graph_type)
        input:
            conf=configfilename,
            graphs=[d for d in graph_plots_conf_to_feature_files(filename="graph", 
                                                            ext="png", 
                                                            eval_module="graph_plots", 
                                                            module_feature="graphs", 
                                                            feature_argstring="",
                                                            graph_type=graph_type) 
                        if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphs"]],

            adjmats=[d for d in graph_plots_conf_to_feature_files(filename="adjmats", 
                                                            ext="png", 
                                                            eval_module="graph_plots", 
                                                            module_feature="adjmat_plots", 
                                                            feature_argstring="",
                                                            graph_type=graph_type) 
                        if config["benchmark_setup"]["evaluation"]["graph_plots"]["adjmats"]],
            
            adjmat_diffplots=[d for d in graph_plots_conf_to_feature_files(filename="adjmat_diffplot", 
                                                                        ext="png", 
                                                                        eval_module="graph_plots", 
                                                                        module_feature="adjmat_diffplot", 
                                                                        feature_argstring="",
                                                                        graph_type=graph_type) 
                        if config["benchmark_setup"]["evaluation"]["graph_plots"]["diffplots"]],
            
            graphvizcompare=[d for d in graph_plots_conf_to_feature_files(filename="graphhvizcompare", 
                                                                        ext="pdf", 
                                                                        eval_module="graph_plots", 
                                                                        module_feature="graphvizcompare", 
                                                                        feature_argstring="layout=True",
                                                                         graph_type=graph_type) 
                        if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphvizcompare"]],
            csvs=[d for d in graph_plots_conf_to_feature_files(filename="adjmat", 
                                                                        ext="csv", 
                                                                        eval_module="graph_plots", 
                                                                        module_feature="csvs", 
                                                                        feature_argstring="",
                                                                        graph_type=graph_type) 
                        if config["benchmark_setup"]["evaluation"]["graph_plots"]["csvs"]]

        output:    # What happening here? Ah, its just a hack to get the correct output. either [] or one directory [directory(...)]
            [d for d in [directory("results/output/graph_plots/graph_type="+graph_type+"/graphs")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphs"] is True],
            [d for d in [directory("results/output/graph_plots/graph_type="+graph_type+"/adjmats")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["adjmats"] is True],
            [d for d in [directory("results/output/graph_plots/graph_type="+graph_type+"/adjmat_diffplots")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["diffplots"] is True],
            [d for d in [directory("results/output/graph_plots/graph_type="+graph_type+"/graphvizcompare")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphvizcompare"] is True],
            [d for d in [directory("results/output/graph_plots/graph_type="+graph_type+"/csvs")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["csvs"] is True],
            touch("results/output/graph_plots/graph_type="+graph_type+"/graph_plots.done")
        params:
            graph_type=graph_type
        run:
            print("running code")
            # Goes through the list of graphs etc. and copies them to the output directories.
            # Maybe this should be a script and I should do the cpdag stuff in the script.
            for i,f in enumerate(input.graphs): 
                print(f)
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/graphs && cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/graphs/graph_" +str(i+1) +".png")
                    
            for i,f in enumerate(input.adjmats):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmats && cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmats/adjmat_plot_" +str(i+1) +".png")
            
            for i,f in enumerate(input.csvs):
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/csvs && cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/csvs/adjmat_" +str(i+1) +".csv")
            
            if len(input.graphvizcompare) > 0:
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/graphvizcompare")
                for i,f in enumerate(input.graphvizcompare):
                    shell("cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/graphvizcompare/compare_" +str(i+1) +".pdf")

            if len(input.adjmat_diffplots) > 0:
                shell("mkdir -p results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmat_diffplots")
                for i,f in enumerate(input.adjmat_diffplots):
                    shell("cp "+f+" results/output/graph_plots/graph_type="+params["graph_type"]+"/adjmat_diffplots/diffplot_" +str(i+1) +".png")
