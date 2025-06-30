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

Implementation:
======================================================

- **bagging.py**: Uses csv files created from the structure learning algorithms to create an averaged csv file.
- **rule.smk**: Runs the bagging rule to create the csv file, as well as other rules to create the adjacency matrix and graph PNG files.
  All output files are stored in `output/evaluation/bagging/{dataset_name}`.

Plotting and Visualization:
======================================================

- **plot_matrix_as_heatmap.py** is used to visualize the final adjacency matrix as a heatmap using Seaborn and Matplotlib.
- The plot includes optional metadata about the bagging setup, such as:
  - Bagging type (`standard` or `weighted`)
  - Number of edges
  - Threshold value
  - Weights for each algorithm (if applicable)
- This information is rendered as the **y-axis label** of the heatmap instead of a traditional legend, allowing for a more compact layout in figures.
- The title of the heatmap is set from the Snakemake `title` parameter, and the plotting style is consistent with high-resolution settings (`dpi=300`).

Notes:
======================================================

- The bagging module currently requires that all structure learning algorithms only produce one csv file, 
  i.e., only one parameter allowed.
- The bagging module currently requires that the `graph_plots` parameter includes all of the relevant algorithm IDs.
  To change this, the `adjmats()` function must be customized within the bagging rule section.
- For the weighted bagging, the weights are normalized, so one can use ratios for weight selection, ex:
    if weights are (1,1,2), then the corresponding real values are then (0.25 0.25 0.5)

Validation:
======================================================

.. code-block:: python

   with open(configfilename) as json_config:
       cf = json.load(json_config)
       validate_bagging_lengths(cf)

This function checks:
- Weight dictionary keys match algorithm IDs.
- Threshold is between 0 and 1.
- Number of weights aligns with algorithm list.

