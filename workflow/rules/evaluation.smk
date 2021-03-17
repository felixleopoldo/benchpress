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
        snake="workflow/Snakefile",
        algs=active_algorithm_files("ROC") # It should maybe be stated there which kind of roc to be considered..
    output:
        csv="results/ROC_data.csv"
    shell:
        "Rscript workflow/scripts/combine_ROC_data.R --filename {output.csv} --algorithms {input.algs} --config_filename {input.conf} "

rule roc:
    input:
        configfilename,
        "workflow/Snakefile",
        csv="results/ROC_data.csv" 
    output:
        eps="results/ROC.eps"
    shell:
        "Rscript workflow/scripts/plot_ROC.R --input_filename {input.csv} --output_filename {output.eps}"

rule roc_cpdag:
    input:
        configfilename,
        "workflow/Snakefile",
        csv="results/ROC_data.csv" 
    output:
        eps="results/ROC_essential_graph.eps"
    shell:
        "Rscript scripts/plot_cpdag_roc.R --input_filename {input.csv} --output_filename {output.eps}"

# problem with seeds. The seed is in cluden in graph, bn and data. but not in algorithm.
# When the order ord the data,bn and data is changed, the seed is lost. 
# It use to be matched out from data.
def adjvecs():
    # Everythihng may have seed depending on the source.
    ret = [[[expand("{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "bn=/{param_string}/"\
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
            for alg_conf in config["resources"]["structure_learning_algorithms"]["trilearn_loglin"] if alg_conf["id"] in config["benchmark_setup"]["evaluation"]["mcmc_traj"]]
    return ret

def traj_plots():
    ret = [[[[expand("{output_dir}/traj_plot/"\               
            "adjmat=/{adjmat_string}/"\            
            "bn=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
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
            "bn=/{param_string}/"\
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
            "bn=/{param_string}/"\
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
            "bn=/{param_string}/"\
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
            "bn=/{param_string}/"\
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
            "bn=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"        
    output:
        plot="{output_dir}/traj_plot/"\               
        "adjmat=/{adjmat_string}/"\            
        "bn=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "traj_plot.eps"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/plot_graph_traj.py {input.traj} {output.plot}"

rule mcmc_heatmap_plot:
    input: 
        "workflow/scripts/plot_heatmap_from_graphtraj.py",
        traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "bn=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"       
    output:
        filename="{output_dir}/heatmap_plot/"\               
        "adjmat=/{adjmat_string}/"\            
        "bn=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "heatmap_plot.eps"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/plot_heatmap_from_graphtraj.py {input.traj} {output.filename}"

rule adjmat_plot:
    input:
        matrix_filename = "{output_dir}/adjmat_estimate/{something}/adjmat.csv",
    output:
        plot_filename = "{output_dir}/adjmat_estimate/{something}/adjmat.eps"
    singularity:
        "docker://civisanalytics/datascience-python:latest"
    script:
        "../scripts/plot_matrix_as_heatmap.py"

rule adjmat_true_plot:
    input:
        matrix_filename="{output_dir}/adjmat/{adjmat}.csv" 
    output:
        plot_filename = "{output_dir}/adjmat/{adjmat}.eps"
    singularity:
        "docker://civisanalytics/datascience-python:latest"
    script:
        "../scripts/plot_matrix_as_heatmap.py"

# This rule is very generally specified ad relies on that it is called in  the right way.
# I.e with the path of an adjaceny matrix.
rule adjmat_to_dot:
    input:
        filename="{output_dir}/{something}.csv" 
    output:
        filename = "{output_dir}/{something}.dot"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/trilearn/adjmat_to_dot.py {input.filename} {output.filename}"

rule plot_dot:
    input:
        filename="{output_dir}/{something}.dot" 
    output:
        filename="{output_dir}/{something}.ps" 
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "dot -T ps {input.filename} > {output.filename}"

rule autocorr_plot:
    input: 
         "workflow/scripts/plot_autocorr_from_traj.py",
         traj="{output_dir}/adjvecs/"\               
            "adjmat=/{adjmat_string}/"\            
            "bn=/{param_string}/"\
            "data=/{data_string}/"\            
            "algorithm=/{alg_string}/"\                            
            "seed={seed}/"
            "adjvecs.csv"        
    output:
        plot="{output_dir}/autocorr_plot/"\               
        "adjmat=/{adjmat_string}/"\            
        "bn=/{param_string}/"\
        "data=/{data_string}/"\            
        "algorithm=/{alg_string}/"\                            
        "seed={seed}/"
        "autocorr_plot.eps"
    singularity:
        docker_image("trilearn_loglin")
    shell:
        "python workflow/scripts/plot_autocorr_from_traj.py {input.traj} {output.plot}"

rule mcmc_heatmaps:
    input:
        heatmap_plots()

rule mcmc_traj_plots:
    input:
        traj_plots()

rule autocorr_plots:
    input:
        autocorr_plots()

rule adjmat_plots:
    input:
        adjmat_plots()

rule adjmat_true_plots:
    input:
        adjmat_true_plots()

rule graph_plots:
    input:
        graph_plots()

rule graph_true_plots:
    input:
        graph_true_plots()
