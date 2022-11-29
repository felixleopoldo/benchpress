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

rule cstree_true_plot:
    input:
        cstree="{output_dir}/adjmat/{adjmat_string}.csv"
    output:
        cstree = "{output_dir}/cstree_true_plot/{adjmat_string}.png",
        csdags = directory("{output_dir}/cstree_true_plot/{adjmat_string}/csdags")
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

    output:
        touch("results/output/cstree_true_plots/cstree_true_plots.done"),
    run:
        for i,f in enumerate(input.cstrees):
            shell("cp "+f+" results/output/cstree_true_plots/cstree_true_" +str(i+1) +".png")
        #for i,f in enumerate(input.csdags):
        #    shell("tar -xvf "+f+" results/output/cstree_true_plots/csdags_true_" +str(i+1) +".png")

