rule TP:
    input:
        true_graph="{adjmat_string}.csv",
        est_graph="{est_graph}.csv"
    output:
        tp="{output_dir}/"\
            "evaluation=/TP/graph_type={graph_type}/"\
            "algorithm=/{alg_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
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
        est_graph="{est_graph}. csv"
    output:
        tp="{output_dir}/"\
            "evaluation=/FP/graph_type={graph_type}/"\
            "algorithm=/{alg_string}/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "FP.csv"
    script:
        "Rscript run_summary.R "\
        "--true_graph {input.true_graph} "\
        "--est_graph {input_est_graph} "\
        "--filename {output.tp}"

rule roc_data:
    input:
        "workflow/scripts/combine_ROC_data.R",
        "workflow/scripts/run_summarise.R",
        conf=configfilename,
        snake="workflow/Snakefile",
        algs=active_algorithm_files("ROC") # It should maybe be stated there which kind of roc to be considered..
    output:
        csv="results/output/roc/ROC_data.csv"
    shell:
        "Rscript workflow/scripts/combine_ROC_data.R --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} "

rule roc:
    input:
        "workflow/scripts/plot_ROC.R",
        "workflow/scripts/run_summarise.R",
        configfilename,
        "workflow/Snakefile",
        csv="results/output/roc/ROC_data.csv" 
    output:
        touch("results/output/roc/roc.done"),
        eps="results/output/roc/ROC.eps",
        roc_skel="results/output/roc/ROC_skel.eps",
        roc_FPRp_TPR_skel="results/output/roc/ROC_FPRp_TPR_skel.eps",
        
    script:
        "../scripts/plot_ROC.R"


# problem with seeds. The seed is in cluden in graph, bn and data. but not in algorithm.
# When the order ord the data,bn and data is changed, the seed is lost. 
# It use to be matched out from data.
def adjvecs():
    # Everythihng may have seed depending on the source.
    ret = [[[expand("{output_dir}/adjvecs/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.json",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]+"_noest"],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"]["trilearn_pgibbs"] if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["mcmc_traj"]]
    return ret

def traj_plots():
    ret = [[[[expand("{output_dir}/traj_plot/"\
            "adjmat=/{adjmat_string}/"\
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\
            "algorithm=/{alg_string}/" \
            "seed={seed}/"
            "traj_plot.eps",
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
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"]]
            for alg in active_algorithms("mcmc_traj_plots")]
    return ret


def adjmat_true_plots():
    return [[expand("{output_dir}/adjmat/{adjmat_string}.eps",
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
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["adjmat_plots"]]
            for alg in active_algorithms("adjmat_plots")]
    return ret

def graph_true_plots():
    return [[expand("{output_dir}/adjmat/{adjmat_string}.ps",
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
            "adjmat.ps",
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
    ret = [[[[expand("{output_dir}/autocorr_plot/"\
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "autocorr_plot.eps",
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
                if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["autocorr_plots"]]
            for alg in active_algorithms("autocorr_plots")]
    return ret

def heatmap_plots():
    ret = [[[[expand("{output_dir}/heatmap_plot/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "heatmap_plot.eps",
            output_dir="results",
            alg_string=json_string[alg_conf["id"]],
            **alg_conf,
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed), 
            param_string=gen_parameter_string_from_conf(sim_setup["parameters_id"], seed),
            data_string=gen_data_string_from_conf(sim_setup["data_id"], seed, seed_in_path=False))
            for seed in get_seed_range(sim_setup["seed_range"])]
            for sim_setup in config["benchmark_setup"]["data"]]
            for alg_conf in config["resources"]["structure_learning_algorithms"][alg] if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["mcmc_heatmaps"]]
            for alg in active_algorithms("mcmc_heatmaps")]
    return ret

rule mcmc_traj_plot:
    input: 
        "workflow/scripts/plot_graph_traj.py",
        traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"        
    output:
        plot="{output_dir}/traj_plot/"\               
        "adjmat=/{adjmat_string}/"\            
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "traj_plot.eps"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/plot_graph_traj.py {input.traj} {output.plot}"

rule mcmc_heatmap_plot:
    input: 
        "workflow/scripts/plot_heatmap_from_graphtraj.py",
        traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"       
    output:
        filename="{output_dir}/heatmap_plot/"\               
        "adjmat=/{adjmat_string}/"\            
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "heatmap_plot.eps"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/plot_heatmap_from_graphtraj.py {input.traj} {output.filename}"

rule adjmat_plot:
    input:
        "workflow/scripts/plot_matrix_as_heatmap.py",
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
        title="{adjmat_string}\n{param_string}\n{data_string}\n{alg_string}"
    singularity:
        docker_image("pydatascience")
    script:
        "../scripts/plot_matrix_as_heatmap.py"

rule adjmat_true_plot:
    input:
        "workflow/scripts/plot_matrix_as_heatmap.py",
        matrix_filename="{output_dir}/adjmat/{adjmat_string}.csv" 
    output:
        plot_filename = "{output_dir}/adjmat/{adjmat_string}.eps"
    params:
        title="{adjmat_string}.csv"
    singularity:
        docker_image("pydatascience")
    script:
        "../scripts/plot_matrix_as_heatmap.py"

# This rule is very generally specified ad relies on that it is called in  the right way.
# I.e with the path of an adjaceny matrix.
rule adjmat_to_dot:
    input:
        "workflow/scripts/trilearn/adjmat_to_dot.py",
        filename="{output_dir}/{something}.csv" 
    output:
        filename = "{output_dir}/{something}.dot"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/trilearn/adjmat_to_dot.py {input.filename} {output.filename}"

rule plot_dot:
    input:
        filename="{output_dir}/{something}.dot" 
    output:
        filename="{output_dir}/{something}.ps" 
    singularity:
        docker_image("trilearn")
    shell:
        "dot -T ps {input.filename} > {output.filename}"

rule autocorr_plot:
    input: 
         "workflow/scripts/plot_autocorr_from_traj.py",
         traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "parameters=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"        
    output:
        plot="{output_dir}/autocorr_plot/"\               
        "adjmat=/{adjmat_string}/"\            
        "parameters=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "autocorr_plot.eps"
    singularity:
        docker_image("trilearn")
    shell:
        "python workflow/scripts/plot_autocorr_from_traj.py {input.traj} {output.plot}"

rule mcmc_heatmaps:
    input:
        configfilename,
        heatmap_plots()
    output:
        touch("results/output/mcmc_heatmaps/mcmc_heatmaps.done")
    run:
        for i,f in enumerate(input):
            shell("cp "+f+" results/output/mcmc_heatmaps/heatmap_" +str(i) +".eps")

rule mcmc_traj_plots:
    input:
        configfilename,
        traj_plots()
    output: 
        touch("results/output/mcmc_traj_plots/mcmc_traj_plots.done")
    run:
        for i,f in enumerate(input):
            shell("cp "+f+" results/output/mcmc_traj_plots/trajplot_" +str(i) +".eps")

rule autocorr_plots:
    input:
        configfilename,
        autocorr_plots()
    output:
        touch("results/output/autocorr_plots.done")
    run:
        for i,f in enumerate(input):
            shell("cp "+f+" results/output/autocorr_plots/autocorr_" +str(i) +".eps")

rule adjmat_plots:
    input:        
        configfilename,
        adjmats=adjmat_plots()
    output:
        touch("results/output/adjmat_plots/adjmat_plots.done")
    run:
        for i,f in enumerate(input.adjmats):
            shell("cp "+f+" results/output/adjmat_plots/adjmat_" +str(i) +".eps")

rule adjmat_true_plots:
    input:  
        configfilename,      
        adjmats=adjmat_true_plots()
    output:
        touch("results/output/adjmat_true_plots/adjmat_true_plots.done")
    run:
        for i,f in enumerate(input.adjmats):
            shell("cp "+f+" results/output/adjmat_true_plots/adjmat_true_" +str(i) +".eps")

rule graph_plots:
    input:
        conf=configfilename,
        graphs=graph_plots()
    output:
        touch("results/output/graph_plots/graph_plots.done")
    run:
        
        for i,f in enumerate(input.graphs):
            shell("cp "+f+" results/output/graph_plots/graph_" +str(i) +".ps")

rule graph_true_plots:
    input:
        conf=configfilename,
        graphs=graph_true_plots()
    output:
        touch("results/output/graph_true_plots/graph_true_plots.done"),
    run:
        for i,f in enumerate(input.graphs):
            shell("cp "+f+" results/output/graph_true_plots/graph_true_" +str(i) +".eps")

