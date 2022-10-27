# This file contains the rules for all structure learning algorithm
# along with rules for summarising (benchmarking) results in terms of TPR, FPR etc.
# It also has a rule for each algorithms that joins all the benchmarks into one file.
#
# MCMC methods are special since the output is not an adjacency matrix but
# a trajectory of graphs (see formatting in the paper).
# Therefore these algorithms has an additional rule which creates a estimate based on
# the trajectory,

include: "path_generators.smk"
include: "shell_commands.py"

rule benchmarks_combine_data:
    input:
        "workflow/rules/evaluation/benchmarks/combine_ROC_data.R",
        "workflow/rules/evaluation/benchmarks/run_summarise.R",
        conf=configfilename,
        snake="workflow/Snakefile",
        algs=active_algorithm_files("benchmarks") # It should maybe be stated there which kind of benchmarks to be considered..
    output:
        csv="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +"ROC_data.csv",
        joint="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +"joint_benchmarks.csv"
    shell:
        "Rscript workflow/rules/evaluation/benchmarks/combine_ROC_data.R --joint_bench {output.joint} --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} "

rule benchmarks:
    input:
        "workflow/rules/evaluation/benchmarks/plot_ROC.R",
        "workflow/rules/evaluation/benchmarks/run_summarise.R",
        "workflow/Snakefile",
        config=configfilename,
        csv="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +"ROC_data.csv",
        raw_bench="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +"joint_benchmarks.csv"
    output:
        temp(touch("results/output/benchmarks/benchmarks.done")),
        fpr_tpr_pattern="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "FPR_TPR_pattern.png",
        FPRp_FNR_skel="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "FPRp_FNR_skel.png",
        fnr_fprp_skel="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "FNR_FPR_skel.png",
        roc_FPRp_TPR_skel="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "FPR_TPR_skel.png",
        elapsed_time_joint="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "elapsed_time_joint.png",
        graph_type="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "graph_type.png",
        SHD_cpdag_joint="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "SHD_cpdag_joint.png",
        f1_skel_joint="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "f1_skel_joint.png",
        ntests_joint="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] + "ntests_joint.png"

    script:
        "plot_ROC.R"



for alg in config["resources"]["structure_learning_algorithms"]:

    rule:
        input:
            "workflow/rules/evaluation/benchmarks/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path(alg),
            time=summarise_alg_input_time_path(alg),
            ntests=summarise_alg_input_ntests_path(alg),
        output:
            res=summarise_alg_output_res_path(alg),
        shell:
            summarise_alg_shell(alg)

    # TODO: Special for mcmc algorithms

    rule:
        input:
            "workflow/rules/evaluation/benchmarks/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model(alg),
        output:
            join_summaries_output(alg),
        script:
            "../rules/evaluation/benchmarks/join_csv_files.R"
