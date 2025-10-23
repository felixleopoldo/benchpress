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
        tar="{whatever}/adjvecs.tar.gz",       
    output:
        csv=temp("{whatever}/adjvecs_tobecompressed.csv")
    shell:
        "tar -xf {input.tar}"

rule copy_adjvecs:
    input:
        csv=rules.extract.output.csv
    output:
        temp("{whatever}/adjvecs.csv")
    shell:
        "cp {input.csv} {output}"

# From the alg id we could easily determine the varying paramter by checking which key has
# a list instead of a single value. But we need to match the id and we need to match the
# parameters so that we can get the varying parameter value.


# Only get the pattern strings for the actual mcmc algorithms
mcmc_alg_ids = set()

# Create adapted anonymous MCMC rules where the algorithm parameters are matched.
for algid in config["resources"]["structure_learning_algorithms"]:
    if algid in mcmc_modules: # mcmc_modules is defined in the Snakefile
        # Processed graph trajectory
        rule:
            name: "mcmc_traj_{}".format(algid)
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
                docker_image("pydatascience")
            script:
                "../../../scripts/evaluation/write_graph_traj.py"


for bmark_setup in config["benchmark_setup"]:
    if "mcmc_traj_plots" not in bmark_setup["evaluation"]:
        continue
    # Joins processed trajs
    bmark_setup_title = bmark_setup["title"]
    rule:
        name:
            "mcmc_traj_plots_join_trajs_"+bmark_setup_title
        input:
            trajs=processed_trajs(bmark_setup, "mcmc_traj_plots")
        output:
            # having constant files makes triggering complicatad
            trajs="results/output/"+bmark_setup_title+"/mcmc_traj_plots/mcmc_filled_trajs.csv"
        script:
            "../../../scripts/evaluation/join_graph_trajs.py"

    # This plots several trajectories in one figure
    rule:
        name:
            "mcmc_traj_plots_plot_joined_trajs_"+bmark_setup_title
        input:
            configfilename,
            trajs="results/output/"+bmark_setup_title+"/mcmc_traj_plots/mcmc_filled_trajs.csv"
            #trajs=rules.mcmc_traj_plots_join_trajs.output.trajs
        output:
            touch("results/output/"+bmark_setup_title+"/mcmc_traj_plots/mcmc_traj_plots.done"),
            single=directory("results/output/"+bmark_setup_title+"/mcmc_traj_plots/single_param_settings"),
            multi=directory("results/output/"+bmark_setup_title+"/mcmc_traj_plots/multi_param_settings")
        params:
            xlab="Iteration"
        container:
            docker_image("pydatascience")
        script:
            "../../../scripts/evaluation/plot_multi_trajs.py"
