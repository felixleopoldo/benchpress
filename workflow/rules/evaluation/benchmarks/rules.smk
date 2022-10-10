# This file contains the rules for all structure learning algorithm
# along with rules for summarising (benchmarking) results in terms of TPR, FPR etc.
# It also has a rule for each algorithms that joins all the benchmarks into one file.
#
# MCMC methods are special since the output is not an adjacency matrix but
# a trajectory of graphs (see formatting in the paper).
# Therefore these algorithms has an additional rule which creates a estimate based on
# the trajectory,


rule benchmarks_combine_data:
    input:
        "workflow/scripts/evaluation/combine_ROC_data.R",
        "workflow/scripts/evaluation/run_summarise.R",
        conf=configfilename,
        snake="workflow/Snakefile",
        algs=active_algorithm_files("benchmarks") # It should maybe be stated there which kind of benchmarks to be considered..
    output:
        csv="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +"ROC_data.csv",
        joint="results/output/benchmarks/"+config["benchmark_setup"]["evaluation"]["benchmarks"]["filename_prefix"] +"joint_benchmarks.csv"
    shell:        
        "Rscript workflow/scripts/evaluation/combine_ROC_data.R --joint_bench {output.joint} --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} "

rule benchmarks:
    input:
        "workflow/scripts/evaluation/plot_ROC.R",
        "workflow/scripts/evaluation/run_summarise.R",
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
        "../scripts/evaluation/plot_ROC.R"


if "mylib_myalg" in pattern_strings:

    rule summarise_mylib_myalg:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("mylib_myalg"),
            time=summarise_alg_input_time_path("mylib_myalg"),
            ntests=summarise_alg_input_ntests_path("mylib_myalg"),
        output:
            res=summarise_alg_output_res_path("mylib_myalg"),
        shell:
            summarise_alg_shell("mylib_myalg")

if "parallelDG" in pattern_strings:

    rule summarise_parallelDG:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("parallelDG"),
            time=summarise_alg_input_time_path("parallelDG"),
        output:
            res=summarise_alg_output_res_path("parallelDG"),
        shell:
            summarise_alg_shell("parallelDG")

if "causaldag_gsp" in pattern_strings:

    rule summarise_causaldag_gsp:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("causaldag_gsp"),
            time=summarise_alg_input_time_path("causaldag_gsp"),
            ntests=summarise_alg_input_ntests_path("causaldag_gsp"),
        output:
            res=summarise_alg_output_res_path("causaldag_gsp"),
        shell:
            summarise_alg_shell("causaldag_gsp")

if "gcastle_notears" in pattern_strings:

    rule summarise_gcastle_notears:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_notears"),
            time=summarise_alg_input_time_path("gcastle_notears"),
            ntests=summarise_alg_input_ntests_path("gcastle_notears"),
        output:
            res=summarise_alg_output_res_path("gcastle_notears"),
        shell:
            summarise_alg_shell("gcastle_notears")

if "gcastle_pc" in pattern_strings:

    rule summarise_gcastle_pc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_pc"),
            time=summarise_alg_input_time_path("gcastle_pc"),
            ntests=summarise_alg_input_ntests_path("gcastle_pc"),
        output:
            res=summarise_alg_output_res_path("gcastle_pc"),
        shell:
            summarise_alg_shell("gcastle_pc")

if "gcastle_anm" in pattern_strings:

    rule summarise_gcastle_anm:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_anm"),
            time=summarise_alg_input_time_path("gcastle_anm"),
            ntests=summarise_alg_input_ntests_path("gcastle_anm"),
        output:
            res=summarise_alg_output_res_path("gcastle_anm"),
        shell:
            summarise_alg_shell("gcastle_anm")

if "gcastle_direct_lingam" in pattern_strings:

    rule summarise_gcastle_direct_lingam:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_direct_lingam"),
            time=summarise_alg_input_time_path("gcastle_direct_lingam"),
            ntests=summarise_alg_input_ntests_path("gcastle_direct_lingam"),
        output:
            res=summarise_alg_output_res_path("gcastle_direct_lingam"),
        shell:
            summarise_alg_shell("gcastle_direct_lingam")

if "gcastle_ica_lingam" in pattern_strings:

    rule summarise_gcastle_ica_lingam:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_ica_lingam"),
            time=summarise_alg_input_time_path("gcastle_ica_lingam"),
            ntests=summarise_alg_input_ntests_path("gcastle_ica_lingam"),
        output:
            res=summarise_alg_output_res_path("gcastle_ica_lingam"),
        shell:
            summarise_alg_shell("gcastle_ica_lingam")


if "gcastle_notears_nonlinear" in pattern_strings:

    rule summarise_gcastle_notears_nonlinear:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_notears_nonlinear"),
            time=summarise_alg_input_time_path("gcastle_notears_nonlinear"),
            ntests=summarise_alg_input_ntests_path("gcastle_notears_nonlinear"),
        output:
            res=summarise_alg_output_res_path("gcastle_notears_nonlinear"),
        shell:
            summarise_alg_shell("gcastle_notears_nonlinear")


if "gcastle_notears_low_rank" in pattern_strings:

    rule summarise_gcastle_notears_low_rank:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_notears_low_rank"),
            time=summarise_alg_input_time_path("gcastle_notears_low_rank"),
            ntests=summarise_alg_input_ntests_path("gcastle_notears_low_rank"),
        output:
            res=summarise_alg_output_res_path("gcastle_notears_low_rank"),
        shell:
            summarise_alg_shell("gcastle_notears_low_rank")


if "gcastle_golem" in pattern_strings:

    rule summarise_gcastle_golem:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_golem"),
            time=summarise_alg_input_time_path("gcastle_golem"),
            ntests=summarise_alg_input_ntests_path("gcastle_golem"),
        output:
            res=summarise_alg_output_res_path("gcastle_golem"),
        shell:
            summarise_alg_shell("gcastle_golem")


if "gcastle_grandag" in pattern_strings:

    rule summarise_gcastle_grandag:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_grandag"),
            time=summarise_alg_input_time_path("gcastle_grandag"),
            ntests=summarise_alg_input_ntests_path("gcastle_grandag"),
        output:
            res=summarise_alg_output_res_path("gcastle_grandag"),
        shell:
            summarise_alg_shell("gcastle_grandag")


if "gcastle_mcsl" in pattern_strings:

    rule summarise_gcastle_mcsl:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_mcsl"),
            time=summarise_alg_input_time_path("gcastle_mcsl"),
            ntests=summarise_alg_input_ntests_path("gcastle_mcsl"),
        output:
            res=summarise_alg_output_res_path("gcastle_mcsl"),
        shell:
            summarise_alg_shell("gcastle_mcsl")


if "gcastle_gae" in pattern_strings:

    rule summarise_gcastle_gae:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_gae"),
            time=summarise_alg_input_time_path("gcastle_gae"),
            ntests=summarise_alg_input_ntests_path("gcastle_gae"),
        output:
            res=summarise_alg_output_res_path("gcastle_gae"),
        shell:
            summarise_alg_shell("gcastle_gae")


if "gcastle_rl" in pattern_strings:

    rule summarise_gcastle_rl:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_rl"),
            time=summarise_alg_input_time_path("gcastle_rl"),
            ntests=summarise_alg_input_ntests_path("gcastle_rl"),
        output:
            res=summarise_alg_output_res_path("gcastle_rl"),
        shell:
            summarise_alg_shell("gcastle_rl")


if "gcastle_corl" in pattern_strings:

    rule summarise_gcastle_corl:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gcastle_corl"),
            time=summarise_alg_input_time_path("gcastle_corl"),
            ntests=summarise_alg_input_ntests_path("gcastle_corl"),
        output:
            res=summarise_alg_output_res_path("gcastle_corl"),
        shell:
            summarise_alg_shell("gcastle_corl")


if "sklearn_glasso" in pattern_strings:

    rule summarise_sklearn_glasso:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("sklearn_glasso"),
            time=summarise_alg_input_time_path("sklearn_glasso"),
        output:
            res=summarise_alg_output_res_path("sklearn_glasso"),
        shell:
            summarise_alg_shell("sklearn_glasso")


if "bnlearn_tabu" in pattern_strings:

    rule summarise_tabu:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_tabu"),
            time=summarise_alg_input_time_path("bnlearn_tabu"),
            ntests=summarise_alg_input_ntests_path("bnlearn_tabu"),
        output:
            res=summarise_alg_output_res_path("bnlearn_tabu"),
        shell:
            summarise_alg_shell("bnlearn_tabu")


if "notears" in pattern_strings:

    rule summarise_notears:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("notears"),
            time=summarise_alg_input_time_path("notears"),
        output:
            res=summarise_alg_output_res_path("notears"),
        shell:
            summarise_alg_shell("notears")


if "bnlearn_hc" in pattern_strings:

    rule summarise_hc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_hc"),
            time=summarise_alg_input_time_path("bnlearn_hc"),
            ntests=summarise_alg_input_ntests_path("bnlearn_hc"),
        output:
            res=summarise_alg_output_res_path("bnlearn_hc"),
        shell:
            summarise_alg_shell("bnlearn_hc")


if "bnlearn_interiamb" in pattern_strings:

    rule summarise_bnlearn_interiamb:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_interiamb"),
            time=summarise_alg_input_time_path("bnlearn_interiamb"),
            ntests=summarise_alg_input_ntests_path("bnlearn_interiamb"),
        output:
            res=summarise_alg_output_res_path("bnlearn_interiamb"),
        shell:
            summarise_alg_shell("bnlearn_interiamb")


if "bnlearn_gs" in pattern_strings:

    rule summarise_gs:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_gs"),
            time=summarise_alg_input_time_path("bnlearn_gs"),
            ntests=summarise_alg_input_ntests_path("bnlearn_gs"),
        output:
            res=summarise_alg_output_res_path("bnlearn_gs"),
        shell:
            summarise_alg_shell("bnlearn_gs")


if "bnlearn_pcstable" in pattern_strings:

    rule summarise_bnlearn_pcstable:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_pcstable"),
            time=summarise_alg_input_time_path("bnlearn_pcstable"),
            ntests=summarise_alg_input_ntests_path("bnlearn_pcstable"),
        output:
            res=summarise_alg_output_res_path("bnlearn_pcstable"),
        shell:
            summarise_alg_shell("bnlearn_pcstable")


if "bnlearn_iamb" in pattern_strings:

    rule summarise_bnlearn_iamb:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_iamb"),
            time=summarise_alg_input_time_path("bnlearn_iamb"),
            ntests=summarise_alg_input_ntests_path("bnlearn_iamb"),
        output:
            res=summarise_alg_output_res_path("bnlearn_iamb"),
        shell:
            summarise_alg_shell("bnlearn_iamb")


if "bnlearn_fastiamb" in pattern_strings:

    rule summarise_bnlearn_fastiamb:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_fastiamb"),
            time=summarise_alg_input_time_path("bnlearn_fastiamb"),
            ntests=summarise_alg_input_ntests_path("bnlearn_fastiamb"),
        output:
            res=summarise_alg_output_res_path("bnlearn_fastiamb"),
        shell:
            summarise_alg_shell("bnlearn_fastiamb")


if "bnlearn_iambfdr" in pattern_strings:

    rule summarise_bnlearn_iambfdr:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_iambfdr"),
            time=summarise_alg_input_time_path("bnlearn_iambfdr"),
            ntests=summarise_alg_input_ntests_path("bnlearn_iambfdr"),
        output:
            res=summarise_alg_output_res_path("bnlearn_iambfdr"),
        shell:
            summarise_alg_shell("bnlearn_iambfdr")


if "bnlearn_mmpc" in pattern_strings:

    rule summarise_bnlearn_mmpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_mmpc"),
            time=summarise_alg_input_time_path("bnlearn_mmpc"),
            ntests=summarise_alg_input_ntests_path("bnlearn_mmpc"),
        output:
            res=summarise_alg_output_res_path("bnlearn_mmpc"),
        shell:
            summarise_alg_shell("bnlearn_mmpc")


if "bnlearn_sihitonpc" in pattern_strings:

    rule summarise_bnlearn_sihitonpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_sihitonpc"),
            time=summarise_alg_input_time_path("bnlearn_sihitonpc"),
            ntests=summarise_alg_input_ntests_path("bnlearn_sihitonpc"),
        output:
            res=summarise_alg_output_res_path("bnlearn_sihitonpc"),
        shell:
            summarise_alg_shell("bnlearn_sihitonpc")


if "bnlearn_hpc" in pattern_strings:

    rule summarise_bnlearn_hpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_hpc"),
            time=summarise_alg_input_time_path("bnlearn_hpc"),
            ntests=summarise_alg_input_ntests_path("bnlearn_hpc"),
        output:
            res=summarise_alg_output_res_path("bnlearn_hpc"),
        shell:
            summarise_alg_shell("bnlearn_hpc")


if "bnlearn_h2pc" in pattern_strings:

    rule summarise_bnlearn_h2pc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_h2pc"),
            time=summarise_alg_input_time_path("bnlearn_h2pc"),
            ntests=summarise_alg_input_ntests_path("bnlearn_h2pc"),
        output:
            res=summarise_alg_output_res_path("bnlearn_h2pc"),
        shell:
            summarise_alg_shell("bnlearn_h2pc")


if "bnlearn_rsmax2" in pattern_strings:

    rule summarise_bnlearn_rsmax2:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_rsmax2"),
            time=summarise_alg_input_time_path("bnlearn_rsmax2"),
            ntests=summarise_alg_input_ntests_path("bnlearn_rsmax2"),
        output:
            res=summarise_alg_output_res_path("bnlearn_rsmax2"),
        shell:
            summarise_alg_shell("bnlearn_rsmax2")

if "rblip_asobs" in pattern_strings:

    rule summarise_blip:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("rblip_asobs"),
            time=summarise_alg_input_time_path("rblip_asobs"),
        output:
            res=summarise_alg_output_res_path("rblip_asobs"),
        shell:
            summarise_alg_shell("rblip_asobs")


if "bidag_itsearch" in pattern_strings:

    rule summarise_itsearch:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bidag_itsearch"),
            time=summarise_alg_input_time_path("bidag_itsearch"),
        output:
            res=summarise_alg_output_res_path("bidag_itsearch"),
        shell:
            summarise_alg_shell("bidag_itsearch")

    rule join_summaries_itsearch:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bidag_itsearch"),
        output:
            join_summaries_output("bidag_itsearch"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "pcalg_pc" in pattern_strings:

    rule summarise_pcalg:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("pcalg_pc"),
            time=summarise_alg_input_time_path("pcalg_pc"),
        output:
            res=summarise_alg_output_res_path("pcalg_pc"),
        shell:
            summarise_alg_shell("pcalg_pc")


if "dualpc" in pattern_strings:

    rule summarise_dualpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("dualpc"),
            time=summarise_alg_input_time_path("dualpc"),
        output:
            res=summarise_alg_output_res_path("dualpc"),
        shell:
            summarise_alg_shell("dualpc")


if "bnlearn_mmhc" in pattern_strings:

    rule summarise_mmhc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bnlearn_mmhc"),
            time=summarise_alg_input_time_path("bnlearn_mmhc"),
            ntests=summarise_alg_input_ntests_path("bnlearn_mmhc"),
        output:
            res=summarise_alg_output_res_path("bnlearn_mmhc"),
        shell:
            summarise_alg_shell("bnlearn_mmhc")

if "gobnilp" in pattern_strings:

    rule summarise_gobnilp:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gobnilp"),
            time=summarise_alg_input_time_path("gobnilp"),
        output:
            res=summarise_alg_output_res_path("gobnilp"),
        shell:
            summarise_alg_shell("gobnilp")


if "tetrad_fges" in pattern_strings:

    rule summarise_tetrad_fges:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_fges"),
            time=summarise_alg_input_time_path("tetrad_fges"),
        output:
            res=summarise_alg_output_res_path("tetrad_fges"),
        shell:
            summarise_alg_shell("tetrad_fges")


if "tetrad_fci" in pattern_strings:

    rule summarise_tetrad_fci:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_fci"),
            time=summarise_alg_input_time_path("tetrad_fci"),
        output:
            res=summarise_alg_output_res_path("tetrad_fci"),
        shell:
            summarise_alg_shell("tetrad_fci")


if "tetrad_gfci" in pattern_strings:

    rule summarise_tetrad_gfci:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_gfci"),
            time=summarise_alg_input_time_path("tetrad_gfci"),
        output:
            res=summarise_alg_output_res_path("tetrad_gfci"),
        shell:
            summarise_alg_shell("tetrad_gfci")

if "tetrad_rfci" in pattern_strings:

    rule summarise_tetrad_rfci:
        input:
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_rfci"),
            time=summarise_alg_input_time_path("tetrad_rfci"),
        output:
            res=summarise_alg_output_res_path("tetrad_rfci"),
        shell:
            summarise_alg_shell("tetrad_rfci")


if "bidag_order_mcmc" in pattern_strings:

    rule summarise_order_mcmc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=data_path(),
            adjmat_true=adjmat_true_path(),
            adjmat_est=adjmat_estimate_path_mcmc("bidag_order_mcmc"),
            time=time_path("bidag_order_mcmc"),
        output:
            res=result_path_mcmc("bidag_order_mcmc"),  # {data} is used for the data module here. not as the whole datamodel
        shell:
            summarise_alg_shell("bidag_order_mcmc")

if "bidag_partition_mcmc" in pattern_strings:

    rule summarise_bidag_partition_mcmc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("bidag_partition_mcmc"),
            time=summarise_alg_input_time_path("bidag_partition_mcmc"),
        output:
            res=summarise_alg_output_res_path("bidag_partition_mcmc"),
        shell:
            summarise_alg_shell("bidag_partition_mcmc")


if "trilearn_pgibbs" in pattern_strings:

    rule summarise_trilearn:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("trilearn_pgibbs"),
            time=summarise_alg_input_time_path("trilearn_pgibbs"),
        output:
            res=summarise_alg_output_res_path("trilearn_pgibbs"),
        shell:
            summarise_alg_shell("trilearn_pgibbs")


if "gt13_multipair" in pattern_strings:

    rule summarise_gt13_multipair:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gt13_multipair"),
            time=summarise_alg_input_time_path("gt13_multipair"),
        output:
            res=summarise_alg_output_res_path("gt13_multipair"),
        shell:
            summarise_alg_shell("gt13_multipair")


if "gg99_singlepair" in pattern_strings:

    rule summarise_gg99_singlepair:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("gg99_singlepair"),
            time=summarise_alg_input_time_path("gg99_singlepair"),
        output:
            res=summarise_alg_output_res_path("gg99_singlepair"),
        shell:
            summarise_alg_shell("gg99_singlepair")

if "tetrad_fofc" in pattern_strings:

    rule summarise_tetrad_fofc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_fofc"),
            time=summarise_alg_input_time_path("tetrad_fofc"),
        output:
            res=summarise_alg_output_res_path("tetrad_fofc"),
        shell:
            summarise_alg_shell("tetrad_fofc")


if "tetrad_fas" in pattern_strings:

    rule summarise_tetrad_fas:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_fas"),
            time=summarise_alg_input_time_path("tetrad_fas"),
        output:
            res=summarise_alg_output_res_path("tetrad_fas"),
        shell:
            summarise_alg_shell("tetrad_fas")


if "tetrad_fask" in pattern_strings:

    rule summarise_tetrad_fask:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_fask"),
            time=summarise_alg_input_time_path("tetrad_fask"),
        output:
            res=summarise_alg_output_res_path("tetrad_fask"),
        shell:
            summarise_alg_shell("tetrad_fask")


if "tetrad_pc-all" in pattern_strings:

    rule summarise_tetrad_pc_all:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_pc-all"),
            time=summarise_alg_input_time_path("tetrad_pc-all"),
        output:
            res=summarise_alg_output_res_path("tetrad_pc-all"),
        shell:
            summarise_alg_shell("tetrad_pc-all")

if "tetrad_lingam" in pattern_strings:

    rule summarise_tetrad_lingam:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_lingam"),
            time=summarise_alg_input_time_path("tetrad_lingam"),
        output:
            res=summarise_alg_output_res_path("tetrad_lingam"),
        shell:
            summarise_alg_shell("tetrad_lingam")

if "tetrad_imgscont" in pattern_strings:

    rule summarise_tetrad_imgscont:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_imgscont"),
            time=summarise_alg_input_time_path("tetrad_imgscont"),
        output:
            res=summarise_alg_output_res_path("tetrad_imgscont"),
        shell:
            summarise_alg_shell("tetrad_imgscont")


if "tetrad_ftfc" in pattern_strings:

    rule summarise_tetrad_ftfc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            data=summarise_alg_input_data_path(),
            adjmat_true=summarise_alg_input_adjmat_true_path(),
            adjmat_est=summarise_alg_input_adjmat_est_path("tetrad_ftfc"),
            time=summarise_alg_input_time_path("tetrad_ftfc"),
        output:
            res=summarise_alg_output_res_path("tetrad_ftfc"),
        shell:
            summarise_alg_shell("tetrad_ftfc")

for alg in pattern_strings:
      rule:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model(alg),
        output:
            join_summaries_output(alg),
        script:
            "../scripts/evaluation/join_csv_files.R"
