# This is the bagging rule. It takes in the adjmat.csv files and performs bagging over them.
# include: "../../validate.py" # to use idtoalg function
print("--------------------------------")
print("BAGGING RULE")
print("--------------------------------")


# maybe include the filenames.py here? (should be included already)
include: "../graph_plots/filenames.py"

bmark_setup = config["benchmark_setup"][0]
bmark_setup_title = bmark_setup["title"]



# the input from the adjmats() function is many nested lists so we need to flatten it into the format: ['str1', 'str2', 'str3', ...]
def flatten(list_to_flatten):
    result = []
    for item in list_to_flatten:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    print("--------------------------------")
    print("Here is the flattened list:")
    print(result)
    print("--------------------------------")
    return result



def get_csv_adjmats(bmark_setup):
    return flatten(adjmats(bmark_setup))


if config["benchmark_setup"][0]["evaluation"]["bagging"] is not None: # we don't want to generate any csv file if bagging is null (rule will not be triggered)
    rule bagging:
        """
        Perform standard or weighted bagging over multiple
        adjacency‐matrix CSVs produced by graph_estimation.
        """
        # Expand all the per‐seed adjmat inputs using the seed_range from your config:
        input:
            csv_adjmats = adjmats(bmark_setup)

        # This wildcard picks up the graph_type from the output path:
        output:
            adjmat="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv"

        # Pull in the bagging spec (null / "standard" / weighted array):
        params:
            bag_value=config["benchmark_setup"][0]["evaluation"]["bagging"]
        # Delegate all the heavy lifting to your Python script
        script:
            "bagging.py"


    rule heatmap_bagging: # this gets the heatmap
        input:
            matrix_filename="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv"
        output:
            plot_filename="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.png"
        params: 
            title="Bagging Adjacency Matrix: "+bmark_setup_title,
            alg_string="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv"
        container:
            docker_image("pydatascience")
        script:
            "../graph_plots/plot_matrix_as_heatmap.py"
        


    # not sure where the output for this is.

    # rule graph_bagging: # this gets the graph
    #     input:
    #         matrix_filename="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv"
    #     output:
    #         plot_filename="results/evaluation/bagging/"+bmark_setup_title+"/bagged_graph.png"
    #     script:
    #         "../graph_plots/plot_matrix_as_graph.py"


    rule complete_bagging:
        input:
            # "results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv",
            "results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.png",
            # "results/evaluation/bagging/"+bmark_setup_title+"/bagged_graph.png"
        output:
            donefile="results/evaluation/bagging/"+bmark_setup_title +"/bagging.done"
        shell:
            """
            touch {output.donefile}
            echo {output.donefile}
            """