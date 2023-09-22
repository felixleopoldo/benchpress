def adjmat_true_stats():
    return [[expand("{output_dir}/adjmatstats/{adjmat_string}/stats.csv",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ]

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

rule join_adjmat_stats:
    input:
        conf=configfilename,
        res=adjmat_true_stats()
    output:
        "results/output/graph_true_stats/joint_stats.csv"
    script:
        "join_csv_files.R"


rule plot_adjmat_stats:
    input:
        "workflow/rules/evaluation/graph_true_stats/graph_stats_plot.R",
        conf=configfilename,
        joint_stats="results/output/graph_true_stats/joint_stats.csv"
    output:
        touch("results/output/graph_true_stats/graph_true_stats.done"),
        graph_density_plot="results/output/graph_true_stats/graph_properties_plot.png"
    script:
        "graph_stats_plot.R"