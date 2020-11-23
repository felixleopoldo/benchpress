rule TP:
    input:
        true_graph="{adjmat_string}.csv",
        est_graph="{est_graph}.csv"
    output:
        tp="{output_dir}/"\
            "evaluation=/TP/graph_type={graph_type}/"\
            "algorithm=/{alg_string}/"\
            "adjmat=/{adjmat_string}/"\
            "bn=/{param_string}/"\
            "data=/{data_string}/"\
            "TP.csv"
    script:
        "Rscript run_summary.R "\
        "--true_graph {input.true_graph} "\
        "--est_graph {input_est_graph} "\
        "--filename {output.tp}"

rule FP:
    input:
        true_graph="{adjmat_string}.csv",
        est_graph="{est_graph}.csv"
    output:
        tp="{output_dir}/"\
            "evaluation=/FP/graph_type={graph_type}/"\
            "algorithm=/{alg_string}/"\
            "adjmat=/{adjmat_string}/"\
            "bn=/{param_string}/"\
            "data=/{data_string}/"\
            "FP.csv"
    script:
        "Rscript run_summary.R "\
        "--true_graph {input.true_graph} "\
        "--est_graph {input_est_graph} "\
        "--filename {output.tp}"

rule roc_data:
    input:
        conf=configfilename,
        snake="Snakefile",
        algs=active_algorithm_files # It should maybe be stated there which kind of roc to be considered..
    output:
        csv=config["benchmark_setup"]["output_dir"] + "/ROC_data.csv"
    shell:
        "Rscript scripts/combine_ROC_data.R --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} " \

rule roc:
    input:
        configfilename,
        "Snakefile",
        csv=config["benchmark_setup"]["output_dir"] + "/ROC_data.csv" 
    output:
        eps=config["benchmark_setup"]["output_dir"] + "/ROC.eps"
    shell:
        "Rscript scripts/plot_ROC.R --input_filename {input.csv} --output_filename {output.eps}"

rule roc_cpdag:
    input:
        configfilename,
        "Snakefile",
        csv=config["benchmark_setup"]["output_dir"] + "/ROC_data.csv" 
    output:
        eps=config["benchmark_setup"]["output_dir"] + "/ROC_essential_graph.eps"
    shell:
        "Rscript scripts/plot_cpdag_roc.R --input_filename {input.csv} --output_filename {output.eps}"

# rule adjmat_plot:
#     input:
#         configfilename,
#         itsearch=adjmat_plots("itsearch"),
        #gobnilp=adjmat_plots("gobnilp", seed)
#    output:
#        config["benchmark_setup"]["output_dir"] + "/adjmat_plots",
#        plots="{output_dir}/adjmat_plots/itsearch_map.eps", #"adjmat_plots/gobnilp_seed={seed}/gobnilp.eps", "fges_seed.eps"
        # For the output, all the parameters are not that important
        # If there is a true graph, plot it
#    shell:
#        "cp {input.gobnilp} adjmat_plots/gobnilp_seed={seed}/gobnilp.eps"\
#        " && cp {input.itsearch} adjmat_plots/itsearch_seed={seed}/itsearch.eps"\
