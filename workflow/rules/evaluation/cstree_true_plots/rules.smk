def csdags_true_plots():
    return [[expand("{output_dir}/cstree_true_plot/{adjmat_string}/csdags",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ]

def cstree_true_plots():
    return [[expand("{output_dir}/cstree_true_plot/{adjmat_string}.png",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ] 
            # This will try to make a cstree of everything.

def cstree_csv():
    return [[expand("{output_dir}/adjmat/{adjmat_string}.csv",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in config["benchmark_setup"]["data"] ] 


rule cstree_true_plot:
    input:
        cstree="{output_dir}/adjmat/{adjmat_string}.csv"
    output:
        cstree = temp("{output_dir}/cstree_true_plot/{adjmat_string}.png"),
        csdags = temp(directory("{output_dir}/cstree_true_plot/{adjmat_string}/csdags"))
    params:
        title="{adjmat_string}.csv",
        alg_string=""
    container:
        None
    conda:
        "cstrees.yml"
    script:
        "script.py"

rule cstree_true_plots:
    input:
        conf=configfilename,
        csdags=csdags_true_plots(),
        cstrees=cstree_true_plots(),
        cstrees_csv=cstree_csv()
    output:
        touch("results/output/cstree_true_plots/cstree_true_plots.done"),
        directory("results/output/cstree_true_plots"),
        cstrees=directory("results/output/cstree_true_plots/cstrees"),
        cstrees_csv=directory("results/output/cstree_true_plots/cstrees_csv"),
        csgraphs=directory("results/output/cstree_true_plots/csdags")
    run:
        for i,f in enumerate(input.cstrees_csv):
            shell("mkdir -p results/output/cstree_true_plots/cstrees_csv && cp "+f+" results/output/cstree_true_plots/cstrees_csv/" +str(i+1) +".csv")

        for i,f in enumerate(input.cstrees):
            shell("mkdir -p results/output/cstree_true_plots/cstrees && cp "+f+" results/output/cstree_true_plots/cstrees/" +str(i+1) +".png")

        for i,f in enumerate(input.csdags):
            shell("mkdir -p results/output/cstree_true_plots/csdags && cp -r "+f+" results/output/cstree_true_plots/csdags/" +str(i+1))

