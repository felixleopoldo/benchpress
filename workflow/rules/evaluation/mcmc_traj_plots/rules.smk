include: "filenames.py"

rule compress:
    input:
        "{whatever}/adjvecs_tobecompressed.csv"
    output:
        "{whatever}/adjvecs.tar.gz"
    shell:
        "tar -czf {output} {input}"

rule extract:
    input:
        "{whatever}/adjvecs.tar.gz"
    output:
        temp("{whatever}/adjvecs.csv")
    shell:
        "tar -xf {input} && mv {wildcards.whatever}/adjvecs_tobecompressed.csv {output}"

# From the alg id we could easily determine the varying paramter by checking which key has
# a list instead of a single value. But we need to match the id and we need to match the
# parameters so that we can get the varying parameter value.


# Only get the pattern strings for the actual mcmc algorithms
mcmc_alg_ids = set()

for mcmc_dict in config["benchmark_setup"]["evaluation"]["mcmc_traj_plots"]:
    # get the actual conf

    alg_conf = None
    curalg = None
    for alg, algconfs in config["resources"]["structure_learning_algorithms"].items():
        mcmc_alg_ids.add(alg)
# Create adapted anonymous MCMC rules where the algorithm parameters are matched.
for algid in mcmc_alg_ids:
    if algid in ["bidag_order_mcmc", "parallelDG", "trilearn_pgibbs", "gg99_singlepair", "gt13_multipair"]:
        # Processed graph trajectory
        rule:
            input:
                configfilename, # the variyng param might change
                traj="{output_dir}/adjvecs/"\
                    "adjmat=/{adjmat_string}/"\
                    "parameters=/{param_string}/"\
                    "data=/{data_string}/"\
                    "algorithm=/"+pattern_strings[algid]+"/"\
                    "seed={seed}/"
                    "adjvecs.csv"
            output:
                traj="{output_dir}/"\
                "evaluation=/" + pattern_strings["mcmc_traj_plots"] + "/"\
                "adjmat=/{adjmat_string}/"\
                "parameters=/{param_string}/"\
                "data=/{data_string}/"\
                "algorithm=/"+pattern_strings[algid]+"/id={id}/"\
                "seed={seed}/" \
                "processed_graphtraj.csv"
            params:
                alg=algid, # Maybe this should be matched in the pattern string instead
                data_string="{data_string}",
                adjmat_string="{adjmat_string}",
                param_string="{param_string}",
                alg_string=pattern_strings[algid],
                eval_string=pattern_strings["mcmc_traj_plots"],
                conf=configfilename
            container:
                docker_image("networkx")
            script:
                "../scripts/evaluation/write_graph_traj.py"


# Joins processed trajs
rule mcmc_traj_plots_join_trajs:
    input:
        trajs=processed_trajs("mcmc_traj_plots")
    output:
        # having constant files makes triggering complicatad
        trajs="results/output/mcmc_traj_plots/mcmc_filled_trajs.csv"
    script:
        "../scripts/evaluation/join_graph_trajs.py"

# This plots several trajectories in one figure
rule mcmc_traj_plots_plot_joined_trajs:
    input:
        configfilename,
        trajs=rules.mcmc_traj_plots_join_trajs.output.trajs
    output:
        touch("results/output/mcmc_traj_plots/mcmc_traj_plots.done"),
        single=directory("results/output/mcmc_traj_plots/single_param_settings"),
        multi=directory("results/output/mcmc_traj_plots/multi_param_settings")
    params:
        xlab="Iteration"
    container:
        docker_image("pydatascience")
    script:
        "../scripts/evaluation/plot_multi_trajs.py"
