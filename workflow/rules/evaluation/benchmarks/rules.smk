# This file contains the rules for all structure learning algorithm
# along with rules for summarising (benchmarking) results in terms of TPR, FPR etc.
# It also has a rule for each algorithms that joins all the benchmarks into one file.
#
# MCMC methods are special since the output is not an adjacency matrix but
# a trajectory of graphs (see formatting in the paper).
# Therefore these algorithms has an additional rule which creates a estimate based on
# the trajectory,

include: "path_generators.py"

# Iterate over all benchmark setups
for i, bmark_setup in enumerate(config["benchmark_setup"]):

    bmark_setup_title = bmark_setup["title"]
    print("Benchmark setup: ", bmark_setup_title)
    output_dir_prefix = "results/output/"+bmark_setup_title+"/benchmarks/"+bmark_setup["evaluation"]["benchmarks"]["filename_prefix"]

    rule:
        name:
            "benchmarks_combine_data_"+bmark_setup_title
        input:
            "workflow/rules/evaluation/benchmarks/combine_ROC_data.R",
            "workflow/rules/evaluation/benchmarks/run_summarise.R",
            conf=configfilename,
            snake="workflow/Snakefile",
            algs=active_algorithm_files(bmark_setup, eval_method="benchmarks") # It should maybe be stated there which kind of benchmarks to be considered..
        output:
            csv=output_dir_prefix +"ROC_data.csv",
            joint=output_dir_prefix +"joint_benchmarks.csv"
        shell:
            "Rscript workflow/rules/evaluation/benchmarks/combine_ROC_data.R --joint_bench {output.joint} --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} "

    rule benchmarks:
        input:
            "workflow/rules/evaluation/benchmarks/plot_ROC.R",
            "workflow/rules/evaluation/benchmarks/run_summarise.R",
            "workflow/Snakefile",
            config=configfilename,
            csv=output_dir_prefix +"ROC_data.csv",
            raw_bench=output_dir_prefix +"joint_benchmarks.csv"
        output:
            temp(touch("results/output/"+bmark_setup_title+"/benchmarks/benchmarks.done")),
            fpr_tpr_pattern=directory(output_dir_prefix + "FPR_TPR_pattern"),
            FPRp_FNR_skel=directory(output_dir_prefix + "FPRp_FNR_skel"),
            fnr_fprp_skel=directory(output_dir_prefix + "FNR_FPR_skel"),
            roc_FPRp_TPR_skel=directory(output_dir_prefix + "FPR_TPR_skel"),
            roc_FPR_TPR=directory(output_dir_prefix + "roc_FPR_TPR"),
            elapsed_time_joint=directory(output_dir_prefix + "elapsed_time_joint"),
            elapsed_log_time_joint=directory(output_dir_prefix + "elapsed_log_time_joint"),
            graph_type=directory(output_dir_prefix + "graph_type"),
            SHD_cpdag_joint=directory(output_dir_prefix + "SHD_cpdag_joint"),
            f1_skel_joint=directory(output_dir_prefix + "f1_skel_joint"),
            f1_pattern_joint=directory(output_dir_prefix + "f1_pattern_joint"),
            ntests_joint=directory(output_dir_prefix + "ntests_joint")

        script:
            "plot_ROC.R"



for alg in config["resources"]["structure_learning_algorithms"]:
    if alg in pattern_strings:
        if alg not in mcmc_modules:
            # These dont get triggered when updating alg script for some reason when the benchmarks module has run
            rule: 
                name: 
                    alg+"_summary"
                input:
                    dataset=summarise_alg_input_data_path(),
                    adjmat_true=summarise_alg_input_adjmat_true_path(),
                    adjmat_est=summarise_alg_input_adjmat_est_path(alg), # BUG: this should trigger new run when altering alg script
                    time=summarise_alg_input_time_path(alg),
                    ntests=summarise_alg_input_ntests_path(alg),
                output:
                    res=summarise_alg_output_res_path(alg) # this is containing the SHD, TP,.. etc for each run.
                
                params: 
                    alg=alg,
                    config=configfilename
                script:
                    # Had to use this wrapper script for some reason to get the right parameters.
                    "benchmarks_csv.py" 

        # TODO: Special for mcmc algorithms
        else:        
            rule:
                name: 
                    alg+"_summary_mcmc"
                input:
                    dataset=data_path(),
                    adjmat_true=adjmat_true_path(),
                    adjmat_est=adjmat_estimate_path_mcmc(alg),
                    time=time_path(alg)
                output:
                    res=result_path_mcmc(alg),  # {data} is used for the data module here. not as the whole datamodel
                params: 
                    alg=alg,
                    config=configfilename
                script:
                    # Had to use this wrapper script for some reason to get the right parameters.
                    "benchmarks_csv.py" 

        rule:
            name:
                alg+"_joined_benchmarks"
            input:
                "workflow/rules/evaluation/benchmarks/run_summarise.R",
                conf=configfilename,
                res=join_string_sampled_model(alg) # this is not triggering new run of alg script when altered, Where is it even produced? Should end with results.
            output:
                join_summaries_output(alg),
            script:
                "../../../scripts/evaluation/join_csv_files.R"

