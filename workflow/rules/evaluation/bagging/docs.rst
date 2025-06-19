Bagging Module Documentation:

Schema and Configuration
========================
The Bagging module is designed to enhance the performance of machine learning models by aggregating predictions from multiple base learners. This approach helps in reducing variance and improving accuracy.

The schema configuration for the Bagging module is defined in the `schema.json` field 
The rule.smk file uses the bagging.py script to implement the bagging functionality. The script is responsible for aggregating predictions from various algorithms based on the specified configuration.

The user can specify bagging in the configuration file as follows with one of three options:

bagging: null

bagging: "standard"

bagging: ["weighted",
        {"threshold": 0.7},
        {"id1": 0.5, "id2": 0.5}]


The standard bagging method gives all algorithms equal weight in the final prediction, with threshold set to 0.5 by default. The threshold number dictates that if the proportion of votes for an edge exceeds this threshold, that edge is included in the final adjeacency matrix.
The weighted bagging method allows for custom weights to be assigned to each algorithm, which can be specified in the configuration. The threshold can also be adjusted to control the inclusion of edges based on the proportion of votes.

