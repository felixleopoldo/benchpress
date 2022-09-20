# This file contains the rules for all structure learning algorithm
# along with rules for summarising (benchmarking) results in terms of TPR, FPR etc.
# It also has a rule for each algorithms that joins all the benchmarks into one file.
#
# MCMC methods are special since the output is not an adjacency matrix but
# a trajectory of graphs (see formatting in the paper).
# Therefore these algorithms has an additional rule which creates a estimate based on
# the trajectory,

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

    rule join_summaries_mylib_myalg:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("mylib_myalg"),
        output:
            join_summaries_output("mylib_myalg"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "parallelDG" in pattern_strings:

    rule parallelDG:
        input:
            data=alg_input_data(),
        output:
            adjvecs=alg_output_seqgraph_path("parallelDG"),
            time=alg_output_time_path("parallelDG"),
        container:
            docker_image("parallelDG")
        shell:
            alg_shell("parallelDG")

    rule parallelDG_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("parallelDG"),
        output:
            adjmat=alg_output_adjmat_path("parallelDG"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

    rule join_summaries_parallelDG:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("parallelDG"),
        output:
            join_summaries_output("parallelDG"),
        script:
            "../scripts/evaluation/join_csv_files.R"

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

    rule causaldag_gsp:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("causaldag_gsp"),
            time=alg_output_time_path("causaldag_gsp"),
            ntests=alg_output_ntests_path("causaldag_gsp"),

        container:
            docker_image("causaldag")
        script:
            "../scripts/structure_learning_algorithms/causaldag_gsp.py"

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

    rule join_summaries_causaldag_gsp:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("causaldag_gsp"),
        output:
            join_summaries_output("causaldag_gsp"),
        script:
            "../scripts/evaluation/join_csv_files.R"

if "gcastle_notears" in pattern_strings:

    rule gcastle_notears:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_notears"),
            time=alg_output_time_path("gcastle_notears"),
            ntests=alg_output_ntests_path("gcastle_notears"),
        params:
            alg="notears",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_notears:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_notears"),
        output:
            join_summaries_output("gcastle_notears"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_pc" in pattern_strings:

    rule gcastle_pc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_pc"),
            time=alg_output_time_path("gcastle_pc"),
            ntests=alg_output_ntests_path("gcastle_pc"),
        params:
            alg="pc",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_pc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_pc"),
        output:
            join_summaries_output("gcastle_pc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_anm" in pattern_strings:

    rule gcastle_anm:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_anm"),
            time=alg_output_time_path("gcastle_anm"),
            ntests=alg_output_ntests_path("gcastle_anm"),
        params:
            alg="anm",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_anm:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_anm"),
        output:
            join_summaries_output("gcastle_anm"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_direct_lingam" in pattern_strings:

    rule gcastle_direct_lingam:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_direct_lingam"),
            time=alg_output_time_path("gcastle_direct_lingam"),
            ntests=alg_output_ntests_path("gcastle_direct_lingam"),
        params:
            alg="direct_lingam",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_direct_lingam:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_direct_lingam"),
        output:
            join_summaries_output("gcastle_direct_lingam"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_ica_lingam" in pattern_strings:

    rule gcastle_ica_lingam:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_ica_lingam"),
            time=alg_output_time_path("gcastle_ica_lingam"),
            ntests=alg_output_ntests_path("gcastle_ica_lingam"),
        params:
            alg="ica_lingam",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_ica_lingam:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_ica_lingam"),
        output:
            join_summaries_output("gcastle_ica_lingam"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_notears_nonlinear" in pattern_strings:

    rule gcastle_notears_nonlinear:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_notears_nonlinear"),
            time=alg_output_time_path("gcastle_notears_nonlinear"),
            ntests=alg_output_ntests_path("gcastle_notears_nonlinear"),
        params:
            alg="notears_nonlinear",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_notears_nonlinear:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_notears_nonlinear"),
        output:
            join_summaries_output("gcastle_notears_nonlinear"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_notears_low_rank" in pattern_strings:

    rule gcastle_notears_low_rank:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_notears_low_rank"),
            time=alg_output_time_path("gcastle_notears_low_rank"),
            ntests=alg_output_ntests_path("gcastle_notears_low_rank"),
        params:
            alg="notears_low_rank",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_notears_low_rank:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_notears_low_rank"),
        output:
            join_summaries_output("gcastle_notears_low_rank"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_golem" in pattern_strings:

    rule gcastle_golem:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_golem"),
            time=alg_output_time_path("gcastle_golem"),
            ntests=alg_output_ntests_path("gcastle_golem"),
        params:
            alg="golem",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_golem:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_golem"),
        output:
            join_summaries_output("gcastle_golem"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_grandag" in pattern_strings:

    rule gcastle_grandag:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_grandag"),
            time=alg_output_time_path("gcastle_grandag"),
            ntests=alg_output_ntests_path("gcastle_grandag"),
        params:
            alg="grandag",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_grandag:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_grandag"),
        output:
            join_summaries_output("gcastle_grandag"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gcastle_mcsl" in pattern_strings:

    rule gcastle_mcsl:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_mcsl"),
            time=alg_output_time_path("gcastle_mcsl"),
            ntests=alg_output_ntests_path("gcastle_mcsl"),
        params:
            alg="mcsl",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_mcsl:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_mcsl"),
        output:
            join_summaries_output("gcastle_mcsl"),
        script:
            "../scripts/evaluation/join_csv_files.R"
###############



if "gcastle_gae" in pattern_strings:

    rule gcastle_gae:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_gae"),
            time=alg_output_time_path("gcastle_gae"),
            ntests=alg_output_ntests_path("gcastle_gae"),
        params:
            alg="gae",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_gae:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_gae"),
        output:
            join_summaries_output("gcastle_gae"),
        script:
            "../scripts/evaluation/join_csv_files.R"
###############



if "gcastle_rl" in pattern_strings:

    rule gcastle_rl:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_rl"),
            time=alg_output_time_path("gcastle_rl"),
            ntests=alg_output_ntests_path("gcastle_rl"),
        params:
            alg="rl",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_rl:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_rl"),
        output:
            join_summaries_output("gcastle_rl"),
        script:
            "../scripts/evaluation/join_csv_files.R"
###############



if "gcastle_corl" in pattern_strings:

    rule gcastle_corl:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("gcastle_corl"),
            time=alg_output_time_path("gcastle_corl"),
            ntests=alg_output_ntests_path("gcastle_corl"),
        params:
            alg="corl",
        container:
            docker_image("gcastle")
        script:
            "../scripts/structure_learning_algorithms/gcastle.py"

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

    rule join_summaries_gcastle_corl:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gcastle_corl"),
        output:
            join_summaries_output("gcastle_corl"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "sklearn_glasso" in pattern_strings:

    rule sklearn_glasso:
        input:
            data=alg_input_data(),
            sklearn_glasso="workflow/scripts/structure_learning_algorithms/sklearn_glasso.py",
        output:
            adjmat=alg_output_adjmat_path("sklearn_glasso"),
            time=alg_output_time_path("sklearn_glasso"),
        container:
            docker_image("pydatascience")
        script:
            "../scripts/structure_learning_algorithms/sklearn_glasso.py"

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

    rule join_summaries_sklearn_glasso:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("sklearn_glasso"),
        output:
            join_summaries_output("sklearn_glasso"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_tabu" in pattern_strings:

    rule tabu:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_tabu"),
            time=alg_output_time_path("bnlearn_tabu"),
            ntests=alg_output_ntests_path("bnlearn_tabu"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/bnlearn_tabu.R"

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

    rule join_summaries_tabu:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_tabu"),
        output:
            join_summaries_output("bnlearn_tabu"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "notears" in pattern_strings:

    rule notears:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("notears"),
            time=alg_output_time_path("notears"),
        container:
            docker_image("notears")
        shell:
            alg_shell("notears")

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

    rule join_summaries_notears:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("notears"),
        output:
            join_summaries_output("notears"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_hc" in pattern_strings:

    rule hc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_hc"),
            time=alg_output_time_path("bnlearn_hc"),
            ntests=alg_output_ntests_path("bnlearn_hc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/bnlearn_hc.R"

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

    rule join_summaries_hc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_hc"),
        output:
            join_summaries_output("bnlearn_hc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_interiamb" in pattern_strings:

    rule bnlearn_interiamb:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_interiamb"),
            time=alg_output_time_path("bnlearn_interiamb"),
            ntests=alg_output_ntests_path("bnlearn_interiamb"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/bnlearn_inter-iamb.R"

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

    rule join_summaries_bnlearn_interiamb:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_interiamb"),
        output:
            join_summaries_output("bnlearn_interiamb"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_gs" in pattern_strings:

    rule gs:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_gs"),
            time=alg_output_time_path("bnlearn_gs"),
            ntests=alg_output_ntests_path("bnlearn_gs"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_gs" + ".R"

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

    rule join_summaries_gs:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_gs"),
        output:
            join_summaries_output("bnlearn_gs"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_pcstable" in pattern_strings:

    rule bnlearn_pcstable:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_pcstable"),
            time=alg_output_time_path("bnlearn_pcstable"),
            ntests=alg_output_ntests_path("bnlearn_pcstable"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_pcstable" + ".R"

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

    rule join_summaries_bnlearn_pcstable:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_pcstable"),
        output:
            join_summaries_output("bnlearn_pcstable"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_iamb" in pattern_strings:

    rule bnlearn_iamb:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_iamb"),
            time=alg_output_time_path("bnlearn_iamb"),
            ntests=alg_output_ntests_path("bnlearn_iamb"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_iamb" + ".R"

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

    rule join_summaries_bnlearn_iamb:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_iamb"),
        output:
            join_summaries_output("bnlearn_iamb"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_fastiamb" in pattern_strings:

    rule bnlearn_fastiamb:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_fastiamb"),
            time=alg_output_time_path("bnlearn_fastiamb"),
            ntests=alg_output_ntests_path("bnlearn_fastiamb"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_fastiamb" + ".R"

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

    rule join_summaries_bnlearn_fastiamb:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_fastiamb"),
        output:
            join_summaries_output("bnlearn_fastiamb"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_iambfdr" in pattern_strings:

    rule bnlearn_iambfdr:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_iambfdr"),
            time=alg_output_time_path("bnlearn_iambfdr"),
            ntests=alg_output_ntests_path("bnlearn_iambfdr"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_iambfdr" + ".R"

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

    rule join_summaries_bnlearn_iambfdr:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_iambfdr"),
        output:
            join_summaries_output("bnlearn_iambfdr"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_mmpc" in pattern_strings:

    rule bnlearn_mmpc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_mmpc"),
            time=alg_output_time_path("bnlearn_mmpc"),
            ntests=alg_output_ntests_path("bnlearn_mmpc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_mmpc" + ".R"

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

    rule join_summaries_bnlearn_mmpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_mmpc"),
        output:
            join_summaries_output("bnlearn_mmpc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_sihitonpc" in pattern_strings:

    rule bnlearn_sihitonpc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_sihitonpc"),
            time=alg_output_time_path("bnlearn_sihitonpc"),
            ntests=alg_output_ntests_path("bnlearn_sihitonpc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_sihitonpc" + ".R"

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

    rule join_summaries_bnlearn_sihitonpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_sihitonpc"),
        output:
            join_summaries_output("bnlearn_sihitonpc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_hpc" in pattern_strings:

    rule bnlearn_hpc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_hpc"),
            time=alg_output_time_path("bnlearn_hpc"),
            ntests=alg_output_ntests_path("bnlearn_hpc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_hpc" + ".R"

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

    rule join_summaries_bnlearn_hpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_hpc"),
        output:
            join_summaries_output("bnlearn_hpc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_h2pc" in pattern_strings:

    rule bnlearn_h2pc:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_h2pc"),
            time=alg_output_time_path("bnlearn_h2pc"),
            ntests=alg_output_ntests_path("bnlearn_h2pc"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_h2pc" + ".R"

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

    rule join_summaries_bnlearn_h2pc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_h2pc"),
        output:
            join_summaries_output("bnlearn_h2pc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_rsmax2" in pattern_strings:

    rule bnlearn_rsmax2:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_rsmax2"),
            time=alg_output_time_path("bnlearn_rsmax2"),
            ntests=alg_output_ntests_path("bnlearn_rsmax2"),
        container:
            docker_image("bnlearn")
        script:
            "../scripts/structure_learning_algorithms/" + "bnlearn_rsmax2" + ".R"

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

    rule join_summaries_bnlearn_rsmax2:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_rsmax2"),
        output:
            join_summaries_output("bnlearn_rsmax2"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "rblip_asobs" in pattern_strings:

    rule blip:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("rblip_asobs"),
            time=alg_output_time_path("rblip_asobs"),
        shell:
            alg_shell("rblip_asobs")

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

    rule join_summaries_blip:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("rblip_asobs"),
        output:
            join_summaries_output("rblip_asobs"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bidag_itsearch" in pattern_strings:

    rule itsearch:
        input:
            "workflow/scripts/structure_learning_algorithms/bidag_iterative_search.R",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bidag_itsearch"),
            time=alg_output_time_path("bidag_itsearch"),
        container:
            docker_image("bidag")
        script:
            "../scripts/structure_learning_algorithms/bidag_iterative_search.R"

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

    rule pcalg:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("pcalg_pc"),
            time=alg_output_time_path("pcalg_pc"),
        container:
            docker_image("pcalg")
        script:
            "../scripts/structure_learning_algorithms/pcalg_pc.R"

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

    rule join_summaries_pcalg:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("pcalg_pc"),
        output:
            join_summaries_output("pcalg_pc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "dualpc" in pattern_strings:

    rule dualpc:
        input:
            "workflow/scripts/structure_learning_algorithms/dualpc.R",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("dualpc"),
            time=alg_output_time_path("dualpc"),
        container:
            docker_image("dualpc")
        script:
            "../scripts/structure_learning_algorithms/dualpc.R"

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

    rule join_summaries_dualpc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("dualpc"),
        output:
            join_summaries_output("dualpc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bnlearn_mmhc" in pattern_strings:

    rule mmhc:
        input:
            "workflow/scripts/structure_learning_algorithms/bnlearn_mmhc.R",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("bnlearn_mmhc"),
            time=alg_output_time_path("bnlearn_mmhc"),
            ntests=alg_output_ntests_path("bnlearn_mmhc"),
        script:
            "../scripts/structure_learning_algorithms/bnlearn_mmhc.R"

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

    rule join_summaries_mmhc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bnlearn_mmhc"),
        output:
            join_summaries_output("bnlearn_mmhc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gobnilp" in pattern_strings:

    rule gobnilp:
        input:
            data=alg_input_data(),
            extra_args="resources/extra_args/{extra_args}",
            constraints="resources/constraints/{constraints}",
        output:
            adjmat=alg_output_adjmat_path("gobnilp"),
            time=alg_output_time_path("gobnilp"),
        container:
            docker_image("gobnilp")
        shell:
            alg_shell("gobnilp")

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

    rule join_summaries_gobnilp:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gobnilp"),
        output:
            join_summaries_output("gobnilp"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "tetrad_fges" in pattern_strings:

    rule tetrad_fges:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_fges"),
            time=alg_output_time_path("tetrad_fges"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_fges.py"

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

    rule join_summaries_tetrad_fges:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("tetrad_fges"),
        output:
            join_summaries_output("tetrad_fges"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "tetrad_fci" in pattern_strings:

    rule tetrad_fci:
        input:
            "workflow/scripts/structure_learning_algorithms/tetrad_fci.py",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_fci"),
            time=alg_output_time_path("tetrad_fci"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_fci.py"

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

    rule join_summaries_tetrad_fci:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("tetrad_fci"),
        output:
            join_summaries_output("tetrad_fci"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "tetrad_gfci" in pattern_strings:

    rule tetrad_gfci:
        input:
            "workflow/scripts/structure_learning_algorithms/tetrad_gfci.py",
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_gfci"),
            time=alg_output_time_path("tetrad_gfci"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_gfci.py"

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

    rule join_summaries_tetrad_gfci:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("tetrad_gfci"),
        output:
            join_summaries_output("tetrad_gfci"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "tetrad_rfci" in pattern_strings:

    rule tetrad_rfci:
        input:
            data=alg_input_data(),
        output:
            adjmat=alg_output_adjmat_path("tetrad_rfci"),
            time=alg_output_time_path("tetrad_rfci"),
        container:
            docker_image("tetrad")
        script:
            "../scripts/structure_learning_algorithms/tetrad_rfci.py"

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

    rule join_summaries_tetrad_rfci:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("tetrad_rfci"),
        output:
            join_summaries_output("tetrad_rfci"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bidag_order_mcmc" in pattern_strings:

    rule order_mcmc:
        input:
            "workflow/scripts/structure_learning_algorithms/bidag_order_mcmc.R",
            data=alg_input_data(),
            startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
        output:  # data seems to be matched wrongly
            seqgraph=alg_output_seqgraph_path("bidag_order_mcmc"),
            time=alg_output_time_path("bidag_order_mcmc"),
        container:
            docker_image("bidag")
        script:
            "../scripts/structure_learning_algorithms/bidag_order_mcmc.R"

    rule order_mcmc_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_fine_match("bidag_order_mcmc"),
        output:
            adjmat=adjmat_estimate_path_mcmc("bidag_order_mcmc"),
        params:
            graph_type="dag",
            estimator="threshold",
            threshold="{threshold}",
            burnin="{burnin}",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

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


    """ This should be OK
                """

    rule join_summaries_order_mcmc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bidag_order_mcmc"),
        output:
            join_summaries_output("bidag_order_mcmc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "bidag_partition_mcmc" in pattern_strings:

    rule bidag_partition_mcmc:
        input:
            "workflow/scripts/structure_learning_algorithms/bidag_partition_mcmc.R",
            data=alg_input_data(),
            startspace="{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv",
        output:  # data seems to be matched wrongly
            seqgraph=alg_output_seqgraph_path("bidag_partition_mcmc"),
            time=alg_output_time_path("bidag_partition_mcmc"),
        container:
            docker_image("bidag")
        script:
            "../scripts/structure_learning_algorithms/bidag_partition_mcmc.R"

    rule bidag_partition_mcmc_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("bidag_partition_mcmc"),
        output:
            adjmat=alg_output_adjmat_path("bidag_partition_mcmc"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="dag",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

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

    rule join_summaries_bidag_partition_mcmc:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("bidag_partition_mcmc"),
        output:
            join_summaries_output("bidag_partition_mcmc"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "trilearn_pgibbs" in pattern_strings:

    rule trilearn:
        input:
            data=alg_input_data(),
        output:
            adjvecs=alg_output_seqgraph_path("trilearn_pgibbs"),
            time=alg_output_time_path("trilearn_pgibbs"),
        container:
            docker_image("trilearn")
        shell:
            alg_shell("trilearn_pgibbs")

    rule trilearn_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("trilearn_pgibbs"),
        output:
            adjmat=alg_output_adjmat_path("trilearn_pgibbs"),  #here is the difference from order_mcmc. matching diffferently.
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

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

    rule join_summaries_trilearn:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("trilearn_pgibbs"),
        output:
            join_summaries_output("trilearn_pgibbs"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gt13_multipair" in pattern_strings:

    rule gt13_multipair:
        input:
            data=alg_input_data(),
        output:
            seqgraph=alg_output_seqgraph_path("gt13_multipair"),
            time=alg_output_time_path("gt13_multipair"),
        container:
            docker_image("thomasjava")
        shell:
            alg_shell("gt13_multipair")

    rule gt13_multipair_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("gt13_multipair"),
        output:
            adjmat=alg_output_adjmat_path("gt13_multipair"),
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

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

    rule join_summaries_gt13_multipair:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gt13_multipair"),
        output:
            join_summaries_output("gt13_multipair"),
        script:
            "../scripts/evaluation/join_csv_files.R"


if "gg99_singlepair" in pattern_strings:

    rule gg99_singlepair:
        input:
            data=alg_input_data(),
        output:
            seqgraph=alg_output_seqgraph_path("gg99_singlepair"),
            time=alg_output_time_path("gg99_singlepair"),
        container:
            docker_image("thomasjava")
        shell:
            alg_shell("gg99_singlepair")

    rule gg99_singlepair_est:
        input:
            "workflow/scripts/evaluation/graphtraj_est.py",
            traj=alg_output_seqgraph_path_nocomp("gg99_singlepair"),
        output:
            adjmat=alg_output_adjmat_path("gg99_singlepair"),
        params:
            graph_type="chordal",
            estimator="map",
        container:
            docker_image("networkx")
        script:
            "../scripts/evaluation/graphtraj_est.py"

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

    rule join_summaries_gg99_singlepair:
        input:
            "workflow/scripts/evaluation/run_summarise.R",
            conf=configfilename,
            res=join_string_sampled_model("gg99_singlepair"),
        output:
            join_summaries_output("gg99_singlepair"),
        script:
            "../scripts/evaluation/join_csv_files.R"
