rule sklearn_glasso:
    input:
        data = alg_input_data(),
        sklearn_glasso="workflow/scripts/sklearn_glasso.py"
    output:
        adjmat = alg_output_adjmat_path("sklearn_glasso"),
        time = alg_output_time_path("sklearn_glasso")
    singularity:
        docker_image("pydatascience")
    script:
        "../scripts/sklearn_glasso.py"

rule summarise_sklearn_glasso:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("sklearn_glasso"),
        time = summarise_alg_input_time_path("sklearn_glasso")
    output:
        res = summarise_alg_output_res_path("sklearn_glasso")
    shell:
        summarise_alg_shell("sklearn_glasso")
       
rule join_summaries_sklearn_glasso:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("sklearn_glasso")
    output:
        join_summaries_output("sklearn_glasso")
    script:
        "../scripts/join_csv_files.R"

rule tabu:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("bnlearn_tabu"),
        time = alg_output_time_path("bnlearn_tabu")
    shell:
        alg_shell("bnlearn_tabu")

rule summarise_tabu:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("bnlearn_tabu"),
        time = summarise_alg_input_time_path("bnlearn_tabu")
    output:
        res = summarise_alg_output_res_path("bnlearn_tabu")
    shell:
        summarise_alg_shell("bnlearn_tabu")
       
rule join_summaries_tabu:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bnlearn_tabu")
    output:
        join_summaries_output("bnlearn_tabu")
    script:
        "../scripts/join_csv_files.R"

rule notears:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("notears"),
        time = alg_output_time_path("notears")
    singularity:
        docker_image("notears")
    shell:
        alg_shell("notears")

rule summarise_notears:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("notears"),
        time = summarise_alg_input_time_path("notears")
    output:
        res = summarise_alg_output_res_path("notears")
    shell:
        summarise_alg_shell("notears")
       
rule join_summaries_notears:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("notears")
    output:
        join_summaries_output("notears")
    script:
        "../scripts/join_csv_files.R"

rule hc:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("bnlearn_hc"),
        time = alg_output_time_path("bnlearn_hc")
    shell:
        alg_shell("bnlearn_hc")

rule summarise_hc:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("bnlearn_hc"),
        time = summarise_alg_input_time_path("bnlearn_hc")
    output:
        res = summarise_alg_output_res_path("bnlearn_hc")
    shell:
        summarise_alg_shell("bnlearn_hc")
       
rule join_summaries_hc:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bnlearn_hc")
    output:
        join_summaries_output("bnlearn_hc")
    script:
        "../scripts/join_csv_files.R"

rule bnlearn_interiamb:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("bnlearn_interiamb"),
        time = alg_output_time_path("bnlearn_interiamb")
    script:
        "../scripts/run_inter-iamb.R"

rule summarise_bnlearn_interiamb:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("bnlearn_interiamb"),
        time = summarise_alg_input_time_path("bnlearn_interiamb")
    output:
        res = summarise_alg_output_res_path("bnlearn_interiamb")
    shell:
        summarise_alg_shell("bnlearn_interiamb")
       
rule join_summaries_bnlearn_interiamb:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bnlearn_interiamb")
    output:
        join_summaries_output("bnlearn_interiamb")
    script:
        "../scripts/join_csv_files.R"

rule gs:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("bnlearn_gs"),
        time = alg_output_time_path("bnlearn_gs")
    script:
        "../scripts/run_gs.R"

rule summarise_gs:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("bnlearn_gs"),
        time = summarise_alg_input_time_path("bnlearn_gs")
    output:
        res = summarise_alg_output_res_path("bnlearn_gs")
    shell:
        summarise_alg_shell("bnlearn_gs")
       
rule join_summaries_gs:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bnlearn_gs")
    output:
        join_summaries_output("bnlearn_gs")
    script:
        "../scripts/join_csv_files.R"

rule blip:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("rblip"),
        time = alg_output_time_path("rblip")
    shell:        
        alg_shell("rblip")

rule summarise_blip:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("rblip"),
        time = summarise_alg_input_time_path("rblip")
    output:
        res = summarise_alg_output_res_path("rblip")
    shell:
        summarise_alg_shell("rblip")

rule join_summaries_blip:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("rblip")
    output:
        join_summaries_output("rblip")
    script:
        "../scripts/join_csv_files.R"

rule itsearch:
    input:
        "workflow/scripts/run_iterative_search.R",
        data = alg_input_data(),
    output:
        adjmat = alg_output_adjmat_path("bidag_itsearch"),
        time = alg_output_time_path("bidag_itsearch")
    singularity:
        docker_image("bidag")
    script:
        "../scripts/run_iterative_search.R"

rule summarise_itsearch:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("bidag_itsearch"),
        time = summarise_alg_input_time_path("bidag_itsearch")
    output:
        res = summarise_alg_output_res_path("bidag_itsearch")
    shell:
        summarise_alg_shell("bidag_itsearch")

rule join_summaries_itsearch:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bidag_itsearch")
    output:
        join_summaries_output("bidag_itsearch")
    script:
        "../scripts/join_csv_files.R"

rule pcalg:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("pcalg_pc"),
        time = alg_output_time_path("pcalg_pc")
    singularity:
        docker_image("bidag")
    script:
        "../scripts/run_pcalg.R"

rule summarise_pcalg:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("pcalg_pc"),
        time = summarise_alg_input_time_path("pcalg_pc")
    output:
        res = summarise_alg_output_res_path("pcalg_pc")
    shell:
        summarise_alg_shell("pcalg_pc")

rule join_summaries_pcalg:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("pcalg_pc")
    output:
        join_summaries_output("pcalg_pc")
    script:
        "../scripts/join_csv_files.R"

rule mmhc:
    input:        
        "workflow/scripts/run_mmhc.R",
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("bnlearn_mmhc"),
        time = alg_output_time_path("bnlearn_mmhc")
    script:
        "../scripts/run_mmhc.R"

rule summarise_mmhc:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("bnlearn_mmhc"),
        time = summarise_alg_input_time_path("bnlearn_mmhc")
    output:
        res = summarise_alg_output_res_path("bnlearn_mmhc")
    #singularity:
    #    docker_image("bidag")
    shell:
       summarise_alg_shell("bnlearn_mmhc")

rule join_summaries_mmhc:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bnlearn_mmhc")
    output:
        join_summaries_output("bnlearn_mmhc")  
    script:
        "../scripts/join_csv_files.R"

rule gobnilp:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gobnilp"),
        time = alg_output_time_path("gobnilp")
    singularity:
        docker_image("gobnilp")        
    shell: 
        alg_shell("gobnilp")

rule summarise_gobnilp:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gobnilp"),
        time = summarise_alg_input_time_path("gobnilp")
    output:
        res = summarise_alg_output_res_path("gobnilp")
    shell:
        summarise_alg_shell("gobnilp")

rule join_summaries_gobnilp:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("gobnilp")
    output:
        join_summaries_output("gobnilp")
    script:
        "../scripts/join_csv_files.R"

rule tetrad_fges:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("tetrad_fges"),
        time = alg_output_time_path("tetrad_fges") 
    singularity:
        docker_image("tetrad")
    script:
        "../scripts/run_tetrad_fges.py"

rule summarise_tetrad_fges:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("tetrad_fges"),
        time = summarise_alg_input_time_path("tetrad_fges")
    output:
        res = summarise_alg_output_res_path("tetrad_fges")
    shell:
        summarise_alg_shell("tetrad_fges")

rule join_summaries_tetrad_fges:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("tetrad_fges")
    output:
        join_summaries_output("tetrad_fges")
    script:
        "../scripts/join_csv_files.R"

rule tetrad_fci:
    input:
        "workflow/scripts/run_tetrad_fci.py",
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("tetrad_fci"),
        time = alg_output_time_path("tetrad_fci")
    singularity:
        docker_image("tetrad")
    script:
        "../scripts/run_tetrad_fci.py"

rule summarise_tetrad_fci:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("tetrad_fci"),
        time = summarise_alg_input_time_path("tetrad_fci")
    output:
        res = summarise_alg_output_res_path("tetrad_fci")
    shell:
        summarise_alg_shell("tetrad_fci")

rule join_summaries_tetrad_fci:
    input: 
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("tetrad_fci")
    output:
        join_summaries_output("tetrad_fci")
    script:
        "../scripts/join_csv_files.R"

rule tetrad_gfci:
    input:
        "workflow/scripts/run_tetrad_gfci.py",
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("tetrad_gfci"),
        time = alg_output_time_path("tetrad_gfci")
    singularity:
        docker_image("tetrad")
    script:
        "../scripts/run_tetrad_gfci.py"
        
rule summarise_tetrad_gfci:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("tetrad_gfci"),
        time = summarise_alg_input_time_path("tetrad_gfci")
    output:
        res = summarise_alg_output_res_path("tetrad_gfci")
    shell:
        summarise_alg_shell("tetrad_gfci")

rule join_summaries_tetrad_gfci:
    input: 
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("tetrad_gfci")
    output:
        join_summaries_output("tetrad_gfci")
    script:
        "../scripts/join_csv_files.R"

rule tetrad_rfci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("tetrad_rfci"),
        time = alg_output_time_path("tetrad_rfci")
    singularity:
        docker_image("tetrad")
    script:
        "../scripts/run_tetrad_rfci.py"
    #shell:
    #    alg_shell("tetrad_rfci")

rule summarise_tetrad_rfci:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("tetrad_rfci"),
        time = summarise_alg_input_time_path("tetrad_rfci")
    output:
        res = summarise_alg_output_res_path("tetrad_rfci")
    shell:
        summarise_alg_shell("tetrad_rfci")

rule join_summaries_tetrad_rfci:
    input: 
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("tetrad_rfci")
    output:
        join_summaries_output("tetrad_rfci")
    script:
        "../scripts/join_csv_files.R"

rule order_mcmc:
    input:
        "workflow/scripts/run_order_mcmc.R",
        data = alg_input_data(),
        startspace = "{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv"
    output: # data seems to be matched wrongly
        seqgraph = alg_output_seqgraph_path("bidag_order_mcmc"),
        time = alg_output_time_path("bidag_order_mcmc")
    singularity:
        docker_image("bidag")
    script:
        "../scripts/run_order_mcmc.R"

rule order_mcmc_est:
    input:
        "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path_fine_match("bidag_order_mcmc")
    output:
        adjmat = adjmat_estimate_path_mcmc("bidag_order_mcmc")
    params:
        graph_type="dag",
        estimator="threshold",
        threshold="{threshold}",
        burnin="{burnin}"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule summarise_order_mcmc:
    input:
        "workflow/scripts/run_summarise.R",
        data = data_path(),
        adjmat_true = adjmat_true_path(),
        adjmat_est = adjmat_estimate_path_mcmc("bidag_order_mcmc"),
        time = time_path("bidag_order_mcmc")
    output:
        res = result_path_mcmc("bidag_order_mcmc") # {data} is used for the data module here. not as the whole datamodel
    shell: 
        summarise_alg_shell("bidag_order_mcmc")

""" This should be OK
"""
rule join_summaries_order_mcmc:
    input: 
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("bidag_order_mcmc")
    output:
        join_summaries_output("bidag_order_mcmc")
    script:
        "../scripts/join_csv_files.R"

rule trilearn:
    input:
        data=alg_input_data()
    output:
        adjvecs = alg_output_seqgraph_path("trilearn_pgibbs"),
        time = alg_output_time_path("trilearn_pgibbs")
    singularity:
        docker_image("trilearn")
    shell:
        alg_shell("trilearn_pgibbs")

rule trilearn_est:
    input:
       "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("trilearn_pgibbs"),
    output:
        adjmat = alg_output_adjmat_path("trilearn_pgibbs") #here is the difference from order_mcmc. matching diffferently.
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule summarise_trilearn:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("trilearn_pgibbs"),
        time = summarise_alg_input_time_path("trilearn_pgibbs")
    output:
        res = summarise_alg_output_res_path("trilearn_pgibbs")
    shell:
        summarise_alg_shell("trilearn_pgibbs")
       
rule join_summaries_trilearn:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("trilearn_pgibbs")
    output:
        join_summaries_output("trilearn_pgibbs")
    script:
        "../scripts/join_csv_files.R"

rule gt13_multipair:
    input:
        data = alg_input_data()
    output:
        seqgraph = alg_output_seqgraph_path("gt13_multipair"),
        time = alg_output_time_path("gt13_multipair")
    singularity:
        docker_image("thomasjava")
    shell:
        alg_shell("gt13_multipair")

rule gt13_multipair_est:
    input:
        "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("gt13_multipair"),
    output:
        adjmat = alg_output_adjmat_path("gt13_multipair")
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule summarise_gt13_multipair:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gt13_multipair"),
        time = summarise_alg_input_time_path("gt13_multipair")
    output:
        res = summarise_alg_output_res_path("gt13_multipair")
    shell:
        summarise_alg_shell("gt13_multipair")
       
rule join_summaries_gt13_multipair:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("gt13_multipair")
    output:
        join_summaries_output("gt13_multipair")
    script:
        "../scripts/join_csv_files.R"

rule gg99_singlepair:
    input:
        data = alg_input_data()
    output:
        seqgraph = alg_output_seqgraph_path("gg99_singlepair"),
        time = alg_output_time_path("gg99_singlepair")
    singularity:
        docker_image("thomasjava")
    shell:
        alg_shell("gg99_singlepair")

rule gg99_singlepair_est:
    input:
        "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("gg99_singlepair"),
    output:
        adjmat = alg_output_adjmat_path("gg99_singlepair")
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule summarise_gg99_singlepair:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gg99_singlepair"),
        time = summarise_alg_input_time_path("gg99_singlepair")
    output:
        res = summarise_alg_output_res_path("gg99_singlepair")
    shell:
        summarise_alg_shell("gg99_singlepair")
       
rule join_summaries_gg99_singlepair:
    input:
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        res=join_string_sampled_model("gg99_singlepair")
    output:
        join_summaries_output("gg99_singlepair")
    script:
        "../scripts/join_csv_files.R"
