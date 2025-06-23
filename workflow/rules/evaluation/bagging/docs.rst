Bagging Module Documentation:
======================================================

The Bagging module in Benchpress is designed to enhance the performance and robustness of causal discovery algorithms by aggregating their predictions.
This ensemble technique helps reduce variance and leads to more stable and reliable causal graphs.

Schema and Configuration:
======================================================

Bagging is configured through the config.json file.
It is parsed and validated using schema.json, and executed through the bagging.py script, which is called by Snakemake in rule.smk.
The user can specify bagging in the configuration file as follows with one of three options:
"bagging": null
"bagging": "standard"
"bagging": ["weighted",{"threshold": 0.7},{"id1": 0.5, "id2": 0.5}]

The standard bagging method gives all algorithms equal weight in the final prediction, with threshold set to 0.5 by default.
The threshold number dictates that if the proportion of votes for an edge exceeds this threshold, that edge is included in the final adjacency matrix.
The weighted bagging method allows for custom weights to be assigned to each algorithm, which can be specified in the configuration.
The threshold can also be adjusted to control the inclusion of edges based on the proportion of votes.

Implemenation:
======================================================

bagging.py: Uses csv files created from the structure learning algorithms to create an averaged csv file.
rule.smk: Runs the bagging rule to create the csv file, as well as some other rules to create the adjacency matrix and graph png files. 
all output files are stored in output/evaluation/bagging/name

======================================================

Notes:
======================================================
- The bagging module currently requires that all structure learning algorithms only produce one csv file, 
i.e. only one parameter allowed
- The bagging module currently requires that the graph_plots parameter has all of the ids. To change this, the adjmats() function will
need to be changed and implemented locally in the bagging rule section.


======================================================

with open(configfilename) as json_config:
    cf = json.load(json_config)
    validate_bagging_lengths(cf)

This function checks:
Weight dictionary keys match algorithm IDs.
Threshold is between 0 and 1.
Number of weights aligns with algorithm list.

==========================================

