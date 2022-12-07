from filenames import *

include: "filenames.py"


# These two rules are also defined in thebenchmarks module and temporarliy 
# redefined here.
# They should probably be defined at a global level.
# def summarise_alg_input_data_path():
#     return "{output_dir}/data/adjmat=/{adjmat}/parameters=/{bn}/data=/{data}/seed={replicate}.csv"

# def summarise_alg_input_adjmat_true_path():
#     return "{output_dir}/adjmat/{adjmat}.csv"

# rule cstree_plot:
#     input:        
#         matrix_filename="{output_dir}/adjmat_estimate/"
#         "adjmat=/{adjmat_string}/"
#         "parameters=/{param_string}/"
#         "data=/{data_string}/"
#         "algorithm=/{alg_string}/"
#         "seed={seed}/"
#         "adjmat.csv",
#     output:
#         plot_filename="{output_dir}/adjmat_estimate/"
#         "adjmat=/{adjmat_string}/"
#         "parameters=/{param_string}/"
#         "data=/{data_string}/"
#         "algorithm=/{alg_string}/"
#         "seed={seed}/"
#         "cstree.png",
#     params:
#         title="Graph: {adjmat_string}\nParameters: {param_string}\nData: {data_string}",
#         adjmat_string="{adjmat_string}",
#         param_string="{param_string}",
#         data_string="{data_string}",
#         alg_string="{alg_string}",
#     container:
#         None
#     conda:
#         "cstrees.yml"
#     script:
#         "script.py"


rule csdags_plots:
    input:        
        cstree="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat_string}/"
        "parameters=/{param_string}/"
        "data=/{data_string}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        "adjmat.csv",
    output:
        csdags=directory("{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat_string}/"
        "parameters=/{param_string}/"
        "data=/{data_string}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        "csdags"),
        cstree="{output_dir}/adjmat_estimate/"
        "adjmat=/{adjmat_string}/"
        "parameters=/{param_string}/"
        "data=/{data_string}/"
        "algorithm=/{alg_string}/"
        "seed={seed}/"
        "cstree.png",

    params:
        title="Graph: {adjmat_string}\nParameters: {param_string}\nData: {data_string}",
        adjmat_string="{adjmat_string}",
        param_string="{param_string}",
        data_string="{data_string}",
        alg_string="{alg_string}",
    container:
        None
    conda:
        "cstrees.yml"
    script:
        "script.py"


rule cstree_plots:
    input:
        conf=configfilename,
        cstrees=cstree_plots(),
        csdags=csdags_plots(),
        csvs=cstrees()
    output:
        touch("results/output/cstree_plots/cstree_plots.done"),
        cstrees=directory("results/output/cstree_plots/cstrees"),
        csdags=directory("results/output/cstree_plots/csdags"),
        csvs=directory("results/output/cstree_plots/cstrees_csvs")
    run:
        for i,f in enumerate(input.cstrees):
            shell("mkdir -p {output.cstrees} && cp "+f+" {output.cstrees}/" +str(i+1) + ".png")
        for i,f in enumerate(input.csdags):
            shell("mkdir -p {output.csdags} && cp -r "+f+" {output.csdags}/" +str(i+1))
        for i,f in enumerate(input.csvs):
            shell("mkdir -p {output.csvs} && cp "+f+" {output.csvs}/" +str(i+1) +".csv")

