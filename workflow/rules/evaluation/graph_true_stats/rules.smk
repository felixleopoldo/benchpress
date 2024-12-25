def adjmat_true_stats(bmark_setup):
    return [[expand("{output_dir}/adjmatstats/{adjmat_string}/stats.csv",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in bmark_setup["data"] ]

rule adjmat_true_stats:
    input:
        "workflow/rules/evaluation/graph_true_stats/graph_stats.R",
        matrix_filename="{output_dir}/adjmat/{adjmat_string}.csv"
    output:
        stats_filename = "{output_dir}/adjmatstats/{adjmat_string}/stats.csv"
    params:
        title="{adjmat_string}.csv",
    script:
        "graph_stats.R"

for bmark_setup in config["benchmark_setup"]:

    bmark_setup_title = bmark_setup["title"]

    rule:
        name: 
            "join_adjmat_stats_"+bmark_setup["title"]
        input:
            conf=configfilename,
            res=adjmat_true_stats(bmark_setup)
        output:
            "results/output/"+bmark_setup_title+"/graph_true_stats/joint_stats.csv"
        script:
            "join_csv_files.R"

    rule:
        name: 
            "graph_true_stats_"+bmark_setup["title"]
        input:
            "workflow/rules/evaluation/graph_true_stats/graph_stats_plot.R",
            conf=configfilename,
            joint_stats="results/output/"+bmark_setup_title+"/graph_true_stats/joint_stats.csv"
        output:
            touch("results/output/"+bmark_setup_title+"/graph_true_stats/graph_true_stats.done"),
            graph_density_plot="results/output/"+bmark_setup_title+"/graph_true_stats/graph_properties_plot.png"
        script:
            "graph_stats_plot.R"