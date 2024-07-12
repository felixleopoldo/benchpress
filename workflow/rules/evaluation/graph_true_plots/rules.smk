def adjmat_true_plots(bmark_setup):
    return [[expand("{output_dir}/adjmat/{adjmat_string}.png",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in bmark_setup["data"] ]

def graph_true_plots(bmark_setup):
    return [[expand("{output_dir}/graph_plot/{adjmat_string}.png",
            output_dir="results",
            seed=seed,
            adjmat_string=gen_adjmat_string_from_conf(sim_setup["graph_id"], seed))
            for seed in get_seed_range(sim_setup["seed_range"]) ]
            for sim_setup in bmark_setup["data"] ]

# This rule is very generally specified and relies on that it is called in the right way.
# I.e with the path of an adjacency matrix.
rule true_adjmat_to_dot:
    input:
        "workflow/scripts/utils/adjmat_to_dot.py",
        filename="{output_dir}/adjmat/{something}.csv" # true graph has /adjmat/ in the path and estimated does not.
    output:        
        filename = "{output_dir}/dotgraph/{something}.dot"
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

rule adjmat_true_plot:
    input:
        matrix_filename="{output_dir}/adjmat/{adjmat_string}.csv"
    output:
        plot_filename = "{output_dir}/adjmat/{adjmat_string}.png"
    params:
        title="{adjmat_string}.csv",
        alg_string=""
    container:
        docker_image("pydatascience")
    script:
        "plot_matrix_as_heatmap.py"

for bmark_setup in config["benchmark_setup"]:
    bmark_setup_title = bmark_setup["title"]
    rule:
        name: 
            "graph_true_plots_"+bmark_setup["title"]
        input:
            conf=configfilename,
            graphs=graph_true_plots(bmark_setup),
            adjmats=adjmat_true_plots(bmark_setup)
        output:
            touch("results/output/"+bmark_setup_title+"/graph_true_plots/graph_true_plots.done"),
        run:
            for i,f in enumerate(input.graphs):
                shell("cp "+f+" results/output/"+bmark_setup_title+"/graph_true_plots/graph_true_" +str(i+1) +".png")
            for i,f in enumerate(input.adjmats):
                shell("cp "+f+" results/output/"+bmark_setup_title+"/graph_true_plots/adjmat_true_" +str(i+1) +".png")

