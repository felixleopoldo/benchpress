from filenames import *

include: "filenames.py"


# These two rules are also defined in thebenchmarks module and temporarliy 
# redefined here.
# They should probably be defined at a global level.
def input_data_path():
    return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{parameters}/data=/{data}/seed={seed}.csv"

def input_adjmat_true_path():
    return "{output_dir}/adjmat/{adjmat}.csv"

# # A rule the converts between different types of graph, e.g. DAG to CPDAG
# rule graph_convert:
#     input:
#         filename="{whatever}/adjmat.csv"
#     output:
#         filename="{whatever}/adjmat_cpdag.csv"
#     container:
#         "docker://bpimages/pcalg:2.7-8"
#     params:
#         to="cpdag"
#     script:
#         convert_graph.r
# # A rule the converts between different types of graph, e.g. DAG to CPDAG
# rule graph_convert2:
#     input:
#         "workflow/scripts/utils/graph_convert.py",
#         filename="{output_dir}/adjmat_estimate/"
#         "adjmat=/{adjmat}/"
#         "parameters=/{param_string}/"
#         "data=/{data_string}/"
#         "algorithm=/{alg_string}/"
#         "seed={seed}/"
#         "adjmat.csv",
#     output:
#         filename="{output_dir}/adjmat_estimate/"
#         "adjmat=/{adjmat}/"
#         "parameters=/{param_string}/"
#         "data=/{data_string}/"
#         "algorithm=/{alg_string}/"
#         "seed={seed}/"
#         "adjmat_converted.csv",
#     container:
#         "docker://bpimages/pcalg:2.7-8"
#     params:
#         to="cpdag"
#     script:
#         convert_graph.r


rule adjmat_plot:
    input:        
        matrix_filename=graph_plots_feature_pattern(feature="csvs")

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
        matrix_filename="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat}/"
        "parameters=/{parameters}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        "adjmat.csv",
    output:
        plot_filename=graph_plots_feature_pattern(feature="csvs")
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


# This rule is very generally specified and relies on that it is called in the right way.
# I.e with the path of an adjacency matrix.
rule adjmat_to_dot:
    input:
        "workflow/scripts/utils/adjmat_to_dot.py",

        filename="{output_dir}/evaluation/graph_plots/csvs/{something}/adjmat.csv",  # true graph has adjmat in the path and estimated does not.
    output:
        filename="{output_dir}/evaluation/graph_plots/graphs/{something}/graph.dot",
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

rule plot_dot:
    input:
        "{output_dir}/evaluation/graph_plots/graphs/{something}.dot",
        
    output:
        "{output_dir}/evaluation/graph_plots/graphs/{something}.png",
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
        adjmat_true=input_adjmat_true_path(),
        adjmat_est=graph_plots_feature_pattern(feature="csvs")
    output:
        filename=graph_plots_feature_pattern(feature="graphvizcompare", param_string="layout={layout}")
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
        alg_string="{alg_string}",
    container:
        docker_image("pydatascience")
    script:
        "adjmat_diffplot.py"


#  This new version of the rule graph_plots lets the user specify which plots to include in the output.
rule graph_plots:
    input:
        conf=configfilename,
        graphs=[d for d in graph_plots_conf_to_feature_files(filename="graph", 
                                                        ext="png", 
                                                        eval_module="graph_plots", 
                                                        module_feature="graphs", 
                                                        feature_argstring="") if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphs"]],
        #cpdags=[d for d in [cpdag_plots()] if config["benchmark_setup"]["evaluation"]["graph_plots"]["cpdags"]],
        adjmats=[d for d in graph_plots_conf_to_feature_files(filename="adjmats", 
                                                        ext="png", 
                                                        eval_module="graph_plots", 
                                                        module_feature="adjmat_plots", 
                                                        feature_argstring="") 
                    if config["benchmark_setup"]["evaluation"]["graph_plots"]["adjmats"]],
        
        adjmat_diffplots=[d for d in graph_plots_conf_to_feature_files(filename="adjmat_diffplot", 
                                                                    ext="png", 
                                                                    eval_module="graph_plots", 
                                                                    module_feature="adjmat_diffplot", 
                                                                    feature_argstring="") if config["benchmark_setup"]["evaluation"]["graph_plots"]["diffplots"]],
        
        graphvizcompare=[d for d in graph_plots_conf_to_feature_files(filename="graphhvizcompare", 
                                                                    ext="pdf", 
                                                                    eval_module="graph_plots", 
                                                                    module_feature="graphvizcompare", 
                                                                    feature_argstring="layout=True") if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphvizcompare"]],
        csvs=[d for d in graph_plots_conf_to_feature_files(filename="adjmat", 
                                                                    ext="csv", 
                                                                    eval_module="graph_plots", 
                                                                    module_feature="csvs", 
                                                                    feature_argstring="") if config["benchmark_setup"]["evaluation"]["graph_plots"]["csvs"]]
    output:    # What happening here? Ah, its just a hack to get the correct output. either [] or one directory [directory(...)]
        [d for d in [directory("results/output/graph_plots/graphs")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphs"] is True],
        #[d for d in [directory("results/output/graph_plots/cpdags")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["cpdags"] is True],
        [d for d in [directory("results/output/graph_plots/adjmats")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["adjmats"] is True],
        [d for d in [directory("results/output/graph_plots/adjmat_diffplots")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["diffplots"] is True],
        [d for d in [directory("results/output/graph_plots/graphvizcompare")] if config["benchmark_setup"]["evaluation"]["graph_plots"]["graphvizcompare"] is True],
        directory("results/output/graph_plots/csvs"),
        touch("results/output/graph_plots/graph_plots.done")
    run:
        # Goes through the list of graphs etc. and copies them to the output directories.
        # Maybe this should be a script and I should do the cpdag stuff in the script.
        for i,f in enumerate(input.graphs): 
            shell("mkdir -p results/output/graph_plots/graphs && cp "+f+" results/output/graph_plots/graphs/graph_" +str(i+1) +".png")
        
        #for i,f in enumerate(input.cpdags): # if I would iterate over the csv files I could use the same code for cpdags and adjmats, sort of        #    shell("mkdir -p results/output/graph_plots/cpdags && cp "+f+" results/output/graph_plots/cpdags/cpdag_plot_" +str(i+1) +".png")
        
        for i,f in enumerate(input.adjmats):
            shell("mkdir -p results/output/graph_plots/adjmats && cp "+f+" results/output/graph_plots/adjmats/adjmat_plot_" +str(i+1) +".png")
        
        for i,f in enumerate(input.csvs):
            shell("mkdir -p results/output/graph_plots/csvs && cp "+f+" results/output/graph_plots/csvs/adjmat_" +str(i+1) +".csv")
        
        shell("mkdir -p results/output/graph_plots/graphvizcompare")
        for i,f in enumerate(input.graphvizcompare):
            shell("cp "+f+" results/output/graph_plots/graphvizcompare/compare_" +str(i+1) +".pdf")

        shell("mkdir -p results/output/graph_plots/adjmat_diffplots")
        for i,f in enumerate(input.adjmat_diffplots):
            shell("cp "+f+" results/output/graph_plots/adjmat_diffplots/diffplot_" +str(i+1) +".png")
