# This file contains rules for the different evaluation types.

rule roc_data:
    input:
        "workflow/scripts/evaluation/combine_ROC_data.R",
        "workflow/scripts/evaluation/run_summarise.R",
        conf=configfilename,
        snake="workflow/Snakefile",
        algs=active_algorithm_files("roc") # It should maybe be stated there which kind of roc to be considered..
    output:
        csv="results/output/roc/ROC_data.csv",
        joint="results/output/roc/joint_benchmarks.csv"
    shell:
        "Rscript workflow/scripts/evaluation/combine_ROC_data.R --joint_bench {output.joint} --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} "

rule roc:
    input:
        "workflow/scripts/evaluation/plot_ROC.R",
        "workflow/scripts/evaluation/run_summarise.R",
        "workflow/Snakefile",
        config=configfilename,
        csv="results/output/roc/ROC_data.csv",
        raw_bench="results/output/roc/joint_benchmarks.csv"
    output: # somewhere we have to demand this file
        temp(touch("results/output/roc/roc.done")),
        fpr_tpr_pattern="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "FPR_TPR_pattern.png",
        FPRp_FNR_skel="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "FPRp_FNR_skel.png",
        fnr_fprp_skel="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "FNR_FPR_skel.png",
        roc_FPRp_TPR_skel="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "FPR_TPR_skel.png",
        #elapsed_time="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "ellapsed_time.png",
        elapsed_time_joint="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "elapsed_time_joint.png",
        graph_type="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "graph_type.png",
        #SHD_cpdag="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "SHD_cpdag.png",
        SHD_cpdag_joint="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "SHD_cpdag_joint.png",
        f1_skel_joint="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "f1_skel_joint.png",
        #f1_skel="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "f1_skel.png",
        #ntests="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "ntests.png"
        ntests_joint="results/output/roc/"+config["benchmark_setup"]["evaluation"]["roc"]["filename_prefix"] + "ntests_joint.png"
    script:
        "../scripts/evaluation/plot_ROC.R"

# Problem with seeds. The seed is includen in graph, bn and data, but not in algorithm.
# When the order of the data, parameters and data is changed, the seed is lost.
# It use to be matched out from data.

def traj_plots():
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "traj_plot.eps",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf("mcmc_traj_plots", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                if alg_conf["id"] in [mcmc_traj_conf["id"] for mcmc_traj_conf in config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"] 
                                                            if ("active" not in mcmc_traj_conf) or (mcmc_traj_conf["active"] == True)] ]
            for alg in active_algorithms("mcmc_traj_plots")]
    return ret

def bnlearn_graphvizcompare_plots(filename="graphvizcompare",ext="pdf"):
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/" + \
            filename + "." + ext,
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string="graphvizcompare/layout=True",
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"]) if sim_setup["graph_id"] != None]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                 if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]]
            for alg in active_algorithms("graph_plots")]
    return ret

def adjmat_true_plots():
    return [[expand("{output_dir}/adjmat/{adjmat_string}.eps",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ]

def adjmat_true_stats():
    return [[expand("{output_dir}/adjmatstats/{adjmat_string}/stats.csv",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ]

def adjmat_plots():
    ret = [[[[expand("{output_dir}/adjmat_estimate/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjmat.eps",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]]
            for alg in active_algorithms("graph_plots")]
    return ret

def adjmats():
    ret = [[[[expand("{output_dir}/adjmat_estimate/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjmat.csv",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]]
            for alg in active_algorithms("graph_plots")]
    return ret

def pairs():
    ret = [[expand("{output_dir}/pairs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\                        
            "seed={seed}"
            ".png",
            output_dir="results",            
            **alg_conf,
            seed=seed,          
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
    return ret

def graph_true_plots():
    return [[expand("{output_dir}/adjmat/{adjmat_string}.png",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ]

def graph_plots():
    ret = [[[[expand("{output_dir}/adjmat_estimate/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjmat.png",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["graph_plots"]]
            for alg in active_algorithms("graph_plots")]
    return ret

def autocorr_plots():
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "autocorr_plot.png",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf("mcmc_autocorr_plots", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                if alg_conf["id"] in [conf["id"] for conf in config["benchmark_setup"]["evaluation"]["mcmc_autocorr_plots"] 
                                                    if ("active" not in conf) or (conf["active"] == True)] ]
            for alg in active_algorithms("mcmc_autocorr_plots")]
    return ret

def heatmap_plots():
    ret = [[[[expand("{output_dir}/" \
            "evaluation=/{evaluation_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "heatmap_plot.eps",
            output_dir="results",
            alg_string=json_string_mcmc_noest[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            evaluation_string=gen_evaluation_string_from_conf("mcmc_heatmaps", alg_conf["id"]),
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] 
                if alg_conf["id"] in [conf["id"] for conf in config["benchmark_setup"]["evaluation"]["mcmc_heatmaps"] 
                                                    if ("active" not in conf) or (conf["active"] == True)] ]
            for alg in active_algorithms("mcmc_heatmaps")]
    return ret

rule mcmc_traj_plot:
    input: 
        "workflow/scripts/evaluation/plot_graph_traj.py",
        traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"        
    output:
        plot="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_traj_plots"] + "/" \ 
        "adjmat=/{adjmat_string}/"\            
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "traj_plot.eps"
    params:
        data_string="{data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        alg_string="{alg_string}"
    container:
        docker_image("networkx")
    script:
        "../scripts/evaluation/plot_graph_traj.py"

rule mcmc_heatmap_plot:
    input: 
        "workflow/scripts/evaluation/plot_heatmap_from_graphtraj.py",
        traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"       
    output:
        filename="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_heatmaps"] + "/" \ 
        "adjmat=/{adjmat_string}/"\            
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "heatmap_plot.eps"
    params:
        data_string="{data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        alg_string="{alg_string}"
    container:
        docker_image("networkx")
    script:
        "../scripts/evaluation/plot_heatmap_from_graphtraj.py"

rule adjmat_plot:
    input:
        "workflow/scripts/evaluation/plot_matrix_as_heatmap.py",
        matrix_filename="{output_dir}/adjmat_estimate/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjmat.csv"
    output:
        plot_filename="{output_dir}/adjmat_estimate/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjmat.eps"
    params:
        title="Graph: {adjmat_string}\nParameters: {param_string}\nData: {data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        data_string="{data_string}",
        alg_string="{alg_string}"
    container:
        docker_image("pydatascience")
    script:
        "../scripts/evaluation/plot_matrix_as_heatmap.py"

rule adjmat_true_plot:
    input:
        "workflow/scripts/evaluation/plot_matrix_as_heatmap.py",
        matrix_filename="{output_dir}/adjmat/{adjmat_string}.csv" 
    output:
        plot_filename = "{output_dir}/adjmat/{adjmat_string}.eps"
    params:
        title="{adjmat_string}.csv",
        alg_string=""
    container:
        docker_image("pydatascience")
    script:
        "../scripts/evaluation/plot_matrix_as_heatmap.py"

rule adjmat_true_stats:
    input:
        "workflow/scripts/evaluation/graph_stats.R",
        matrix_filename="{output_dir}/adjmat/{adjmat_string}.csv" 
    output:
        stats_filename = "{output_dir}/adjmatstats/{adjmat_string}/stats.csv"
    params:
        title="{adjmat_string}.csv",
    script:
        "../scripts/evaluation/graph_stats.R"

# This rule is very generally specified ad relies on that it is called in  the right way.
# I.e with the path of an adjaceny matrix.
rule adjmat_to_dot:
    input:
        "workflow/scripts/utils/adjmat_to_dot.py",
        filename="{output_dir}/{something}.csv" 
    output:
        filename = "{output_dir}/{something}.dot"
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
        filename="{output_dir}/{something}.dot" 
    output:
        filename="{output_dir}/{something}.png" 
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

rule mcmc_autocorr_plot:
    input: 
         "workflow/scripts/evaluation/plot_autocorr_from_traj.py",
         traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"        
    output:
        plot="{output_dir}/"\
        "evaluation=/" + pattern_strings["mcmc_autocorr_plots"] + "/" \ 
        "adjmat=/{adjmat_string}/"\            
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "autocorr_plot.png"
    params:
        title="Graph: {adjmat_string}\nParameters: {param_string}\nData: {data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        data_string="{data_string}",
        alg_string="{alg_string}"
    container:
        docker_image("networkx")
    script:
        "../scripts/evaluation/plot_autocorr_from_traj.py"

rule mcmc_heatmaps:
    input:
        configfilename,
        plots=heatmap_plots()
    output:
        touch("results/output/mcmc_heatmaps/mcmc_heatmaps.done")
    run:
        for i,f in enumerate(input.plots):
            shell("cp "+f+" results/output/mcmc_heatmaps/heatmap_" +str(i+1) +".eps")

rule mcmc_traj_plots:
    input:
        configfilename,
        plots=traj_plots()
    output: 
        touch("results/output/mcmc_traj_plots/mcmc_traj_plots.done")
    run:
        for i,f in enumerate(input.plots):
            shell("cp "+f+" results/output/mcmc_traj_plots/trajplot_" +str(i+1) +".eps")

rule mcmc_autocorr_plots:
    input:
        configfilename,
        plots=autocorr_plots()
    output:
        touch("results/output/mcmc_autocorr_plots/mcmc_autocorr_plots.done")
    run:
        for i,f in enumerate(input.plots):
            shell("cp "+f+" results/output/mcmc_autocorr_plots/mcmc_autocorr_" +str(i+1) +".png")

rule join_adjmat_stats:
    input:
        conf=configfilename,
        res=adjmat_true_stats()
    output:
        "results/output/graph_true_stats/joint_stats.csv"
    script:
        "../scripts/evaluation/join_csv_files.R"

rule plot_adjmat_stats:
    input:    
        "workflow/scripts/evaluation/graph_stats_plot.R",
        conf=configfilename,
        joint_stats="results/output/graph_true_stats/joint_stats.csv"
    output:
        touch("results/output/graph_true_stats/graph_true_stats.done"),
        graph_density_plot="results/output/graph_true_stats/graph_density_plot.png"
    script:
        "../scripts/evaluation/graph_stats_plot.R"

rule plot_pairs:
    input:            
        "workflow/scripts/utils/pairs.R",        
        data=summarise_alg_input_data_path()        
    output:
        filename="{output_dir}/pairs/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.png",
    params:
        data="Graph:\n{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}"
    script:
        "../scripts/utils/pairs.R"

rule pairs:
    input:
        "workflow/scripts/utils/pairs.R",
        pairsplots=pairs() # This will not trigger the rule if these files have already been generated.
    output:
        temp(touch("results/output/pairs_plots/pairs_plots.done"))
    run:
        for i,f in enumerate(input.pairsplots):
            shell("cp "+f+" results/output/pairs_plots/pairs_" +str(i+1) +".png")

# This is actually a quite general rule.
rule bnlearn_graphvizcompare:
    input:
        "workflow/scripts/evaluation/bnlearn_graphvizcompare.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = "{output_dir}/adjmat_estimate/"\
                    "adjmat=/{adjmat}/"\
                    "parameters=/{bn}/"\
                    "data=/{data}/"\
                    "algorithm=/{alg_string}/"  \
                    "seed={replicate}/" \
                    "adjmat.csv"
    output:
        filename="{output_dir}/" \
        "evaluation=/graphvizcompare/layout={layout}/"\
        "adjmat=/{adjmat}/"\
        "parameters=/{bn}/"\
        "data=/{data}/"\
        "algorithm=/{alg_string}/" \
        "seed={replicate}/{filename}"
    script:
        "../scripts/evaluation/bnlearn_graphvizcompare.R"

rule graph_plots:
    input:
        conf=configfilename,
        graphs=graph_plots(),
        adjmats=adjmat_plots(),
        graphvizcompare=bnlearn_graphvizcompare_plots(),
        csv_adjmats=adjmats()
    output:
        directory("results/output/graph_plots/graphs"),
        directory("results/output/graph_plots/adjmats"),
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

rule graph_true_plots:
    input:
        conf=configfilename,
        graphs=graph_true_plots(),
        adjmats=adjmat_true_plots()
    output:
        touch("results/output/graph_true_plots/graph_true_plots.done"),        
    run:
        for i,f in enumerate(input.graphs):
            shell("cp "+f+" results/output/graph_true_plots/graph_true_" +str(i+1) +".png")
        for i,f in enumerate(input.adjmats):
            shell("cp "+f+" results/output/graph_true_plots/adjmat_true_" +str(i+1) +".eps")

