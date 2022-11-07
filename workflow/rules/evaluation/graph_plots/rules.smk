from filenames import *

include: "filenames.py"

rule adjmat_plot:
    input:        
        matrix_filename="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat_string}/"
        "parameters=/{param_string}/"
        "data=/{data_string}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        "adjmat.csv",
    output:
        plot_filename="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat_string}/"
        "parameters=/{param_string}/"
        "data=/{data_string}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        "adjmat.eps",
    params:
        title="Graph: {adjmat_string}\nParameters: {param_string}\nData: {data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        data_string="{data_string}",
        alg_string="{alg_string}",
    container:
        docker_image("pydatascience")
    script:
        "plot_matrix_as_heatmap.py"


# This rule is very generally specified and relies on that it is called in the right way.
# I.e with the path of an adjacency matrix.
rule adjmat_to_dot:
    input:
        "workflow/scripts/utils/adjmat_to_dot.py",
        filename="{output_dir}/adjmat_estimate/adjmat=/{something}/adjmat.csv",  # true graph has adjmat in the path and estimated does not.
    output:
        filename="{output_dir}/dotgraph/adjmat=/{something}.dot",
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
        filename="{output_dir}/dotgraph/{something}.dot",
    output:
        filename="{output_dir}/graph_plot/{something}.png",
    container:
        docker_image("trilearn")
    shell:
        """
        if [ -s {input.filename} ]; then
            dot -T png {input.filename} -o {output.filename}
        else
            touch {output.filename}
        fi
        """


# This is actually a quite general rule.
rule bnlearn_graphvizcompare:
    input:
        "workflow/rules/evaluation/graph_plots/bnlearn_graphvizcompare.R",
        data=summarise_alg_input_data_path(),
        adjmat_true=summarise_alg_input_adjmat_true_path(),
        adjmat_est="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat}/"
        "parameters=/{bn}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={replicate}/"
        "adjmat.csv",
    output:
        filename="{output_dir}/"
        "evaluation=/graphvizcompare/layout={layout}/"
        "adjmat=/{adjmat}/"
        "parameters=/{bn}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={replicate}/{filename}",
    script:
        "bnlearn_graphvizcompare.R"


# This is actually a quite general rule.
rule adjmat_diffplot:
    input:
        "workflow/rules/evaluation/graph_plots/adjmat_diffplot.py",
        data=summarise_alg_input_data_path(),
        adjmat_true=summarise_alg_input_adjmat_true_path(),
        adjmat_est="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat}/"
        "parameters=/{bn}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={replicate}/"
        "adjmat.csv",
    output:
        filename="{output_dir}/"
        "evaluation=/adjmat_diffplot/"
        "adjmat=/{adjmat}/"
        "parameters=/{bn}/"
        "data=/{data}/"
        "algorithm=/{alg_string}/"
        "seed={replicate}/{filename}",
    params:
        title="Graph: {adjmat}\nParameters: {bn}\nData: {data}",
        adjmat_string="{adjmat}",
        param_string="{bn}",
        data_string="{data}",
        alg_string="{alg_string}",
    container:
        docker_image("pydatascience")
    script:
        "adjmat_diffplot.py"


rule graph_plots:
    input:
        conf=configfilename,
        graphs=graph_plots(),
        adjmats=adjmat_plots(),
        adjmat_diffplots=adjmat_diffplots(),
        graphvizcompare=bnlearn_graphvizcompare_plots(),
        csv_adjmats=adjmats()
    output:
        directory("results/output/graph_plots/graphs"),
        directory("results/output/graph_plots/adjmats"),
        directory("results/output/graph_plots/adjmat_diffplots"),
        directory("results/output/graph_plots/csvs"),
        directory("results/output/graph_plots/graphvizcompare"),
        touch("results/output/graph_plots/graph_plots.done")
    run:
        for i,f in enumerate(input.graphs):
            shell("mkdir -p results/output/graph_plots/graphs && cp "+f+" results/output/graph_plots/graphs/graph_" +str(i+1) +".png")
        for i,f in enumerate(input.adjmats):
            shell("mkdir -p results/output/graph_plots/adjmats && cp "+f+" results/output/graph_plots/adjmats/adjmat_plot_" +str(i+1) +".eps")
        for i,f in enumerate(input.csv_adjmats):
            shell("mkdir -p results/output/graph_plots/csvs && cp "+f+" results/output/graph_plots/csvs/adjmat_" +str(i+1) +".csv")
        if True:
            shell("mkdir -p results/output/graph_plots/graphvizcompare")
            for i,f in enumerate(input.graphvizcompare):
                shell("cp "+f+" results/output/graph_plots/graphvizcompare/compare_" +str(i+1) +".pdf")

            shell("mkdir -p results/output/graph_plots/adjmat_diffplots")
            for i,f in enumerate(input.adjmat_diffplots):
                shell("cp "+f+" results/output/graph_plots/adjmat_diffplots/diffplot_" +str(i+1) +".png")

