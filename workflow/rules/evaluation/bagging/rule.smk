# This is the bagging rule. It takes in the adjmat.csv files and performs bagging over them.
# include: "../../validate.py" # to use idtoalg function
print("--------------------------------")
print("BAGGING RULE")
print("--------------------------------")


# maybe include the filenames.py here? (should be included already)
include: "../graph_plots/filenames.py"

bmark_setup = config["benchmark_setup"][0]
bmark_setup_title = bmark_setup["title"]

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
            adjmat="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv",
            avgmat="results/evaluation/bagging/"+bmark_setup_title+"/bagged_avg.csv"

        # Pull in the bagging spec (null / "standard" / weighted array):
        params:
            bag_value=config["benchmark_setup"][0]["evaluation"]["bagging"],
            configfile=config
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
        
    rule adjmat_to_dot_bagging:
        input:
            "workflow/scripts/utils/adjmat_to_dot.py",
            filename="results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.csv",  # true graph has adjmat in the path and estimated does not.
        output:
            filename="results/evaluation/bagging/"+bmark_setup_title+"/bag.dot"
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
    rule plot_dot_bagging:
        input:
            filename="results/evaluation/bagging/"+bmark_setup_title+"/bag.dot"
        output:
            filename="results/evaluation/bagging/"+bmark_setup_title+"/bagged_graph.png"
        container:
            docker_image("trilearn")
        shell:
            """
            if [ -s {input.filename} ]; then
                dot -T png {input.filename} -o {output.filename}
            else
                touch {output.filename}
            fi
            """
            
    rule complete_bagging:
        input:
            "results/evaluation/bagging/"+bmark_setup_title+"/bagged_adjmat.png",
            "results/evaluation/bagging/"+bmark_setup_title+"/bagged_graph.png"
        output:
            donefile="results/evaluation/bagging/"+bmark_setup_title +"/bagging.done"
        shell:
            """
            touch {output.donefile}
            echo {output.donefile}
            """