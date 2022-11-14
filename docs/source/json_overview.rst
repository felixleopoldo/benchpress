
JSON config file
##################

In this section we describe the modules of Benchpress and the structure of the Snakemake JSON (Pezoa et al. 2016) configuration file, which serves as interface for the user.

At the highest level there are two main sections, benchmark_setup_ and resources_. 
The resources_ section contains separate subsections of the available modules for generating or defining graphs (graph_), parameters (parameters_), data (data_), and algorithms for structure learning (structure_learning_algorithms_). 
Each module in turn has a list, where each element is an object defining a parameter setting, identified by a unique ``id``. 
The benchmark_setup_ section specifies the data models (datasetup_) and evaluation methods (evaluation_) a user wishes to consider for analysis. 
The module objects used in benchmark_setup_ are defined in resources_ and referenced by their corresponding id’s. 
The output files of each module are saved systematically under the *results/* directory based on the corresponding objects’ values.

Figure 1 shows a flowchart describing how the files (light colored rectangles) and sections relate to the modules (dark colored rounded rectangles) in a JSON file. 
Graphs, parameters, and data are denoted by :math:`G, \Theta`, and :math:`\mathbf Y`, respectively.
The different colors pink, blue, and purple indicate modules, files and sections related to data, structure learning, and evaluating results, respectively. 
An arrow from a node A to another node B should be read as *“B requires input from A”*. 
Thus, for any node, following the arrows in their opposite directions builds a path of the used modules or files. 
Dashed arrows indicates that one of the parents is required and grey arrows indicate partial requirement.

.. figure:: _static/jsonmap.png
    :width: 500

    Flowchart for the Benchpress architecture describing how the files and sections (light colored rectangles) of the JSON configuration file are related to the modules (dark colored rounded rectangles). 
    The different colors pink, blue, and purple indicate modules, files and sections related to data, structure learning, and evaluating results respectively. 


For specific information about each element in the JSON file, see the documentation generated from the `JSON schema <https://github.com/felixleopoldo/benchpress/tree/master/docs/source/json_schema/config.md>`_.

.. _benchmark_setup:

``benchmark_setup``
********************


.. _datasetup:

``data``
========


This section should contain a list where each item defines a certain data setup.
For each seed number :math:`i` in the range defined by ``seed_range``, a graph :math:`G_i` is obtained as specified according to ``graph_id``. 
Given :math:`G_i`, the parameters in the model :math:`\Theta_i` are obtained according to the specifics in ``parameters_id``. 
A data matrix, :math:`\mathbf Y_i^T = (Y_{1:p}^j)_{j=1}^n`, is then sampled from :math:`(G_i,\Theta_i)` as specified by the data model in ``data_id``. 



+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field             | Description                                                                                                                                                                                            |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``graph_id``      | ``id`` from a graph_ module object.                                                                                                                                                                    |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``parameters_id`` | ``id`` from a parameters_ module object.                                                                                                                                                               |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``data_id``       | ``id`` from the data_ module object of a dataset or folder with datasets located in `resources/data/mydatasets <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/>`_. |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``seed_range``    | range of seeds used for random number generation.                                                                                                                                                      |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


In case of fixed data sets, parameters, or graphs, we simply use the corresponding filenames in place of ``id``.


.. rubric:: Example


.. code-block:: json
    
    [
        { 
            "graph_id": "avneigs4_p20",
            "parameters_id": "SEM",
            "data_id": "standardized",
            "seed_range": [1, 10]
        }
    ]

Data scenarios
---------------

Benchpress supports different strategies for defining models and data. 
One possibility is to generate data, graphs and parameters using the existing modules in the resources_ section, referenced by their objects id, as described above. 
An alternative is to provide user-specified graphs, parameters and data sets, referenced by their corresponding filenames. 
Further we can combine the two approaches as needed.

The different sources of data can be summarised in five scenarios
shown in the table below. Scenario I is the typical scenario for data analysts, where the user provides
one or more datasets by hand. Scenario II is similar to Scenario I, with the difference that
the user also provides the true graph underlying the data. This situation arises e.g. when
replicating a simulation study from the literature, where both the true graph and the dataset
are given. Scenario III-V are pure benchmarking scenarios, where either all of the graphs,
parameters and data are generated (V) or the graphs and possibly parameters are specified by
the user (III, IV).

+-----+-----------+------------+-----------+
|     | Graph     | Parameters | Data      |
+-----+-----------+------------+-----------+
| I   | -         | -          | Fixed     |
+-----+-----------+------------+-----------+
| II  | Fixed     | -          | Fixed     |
+-----+-----------+------------+-----------+
| III | Fixed     | Fixed      | Generated |
+-----+-----------+------------+-----------+
| IV  | Fixed     | Generated  | Generated |
+-----+-----------+------------+-----------+
| V   | Generated | Generated  | Generated |
+-----+-----------+------------+-----------+

The following subsections shows some data examples in the benchmark_setup_ section that correspond to the scenarios I-IV.
To try this out, you may change the current data section in `config/config.json <../../config/config.json>`_.
Note that, in general the ``id``'s used must be defined in the resources section (as it is in `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`_ ). 
For example, *avneigs4_p20* is the ``id`` of an object in the pcalg_randdag_ module in the graph_ section.
Also, datasets, parameters, and graphs must be placed in the proper subfolder of the `resources/ <https://github.com/felixleopoldo/benchpress/blob/master/resources/>`_ folder.

I
---

Note that some evaluation modules are not compatible with this scenario as there is no true graph specified.
For example, you may not use the graph_true_plots_ or benchmarks_ modules as both require the true graph to be provided.


.. rubric:: Example 

Here we use `2005_sachs_2_cd3cd28icam2_log_std.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs_2_cd3cd28icam2_log_std.csv>`_, which is the logged and standardized version of the 2nd dataset from Sachs et. al 2005, and is contain

.. code-block:: json

    { 
        "graph_id": null,
        "parameters_id": null,
        "data_id": "2005_sachs_2_cd3cd28icam2_log_std.csv",
        "seed_range": null
    }

.. rubric:: Example 

`2005_sachs <https://github.com/felixleopoldo/benchpress/tree/master/resources/data/mydatasets/2005_sachs>`_ is a subfolder of  `resources/data/mydatasets <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/>`_ containing all the datasets from Sachs et. al 2005.

.. code-block:: json

    { 
        "graph_id": null,
        "parameters_id": null,
        "data_id": "2005_sachs",
        "seed_range": null
    }

II
---

.. rubric:: Example


.. code-block:: json

    { 
        "graph_id": "sachs.csv",
        "parameters_id": null,
        "data_id": "2005_sachs_2_cd3cd28icam2_log_std.csv",
        "seed_range": null
    }

III
---

.. rubric:: Example

Beware that the parameters in the following example is for binary data so make sure that the algorithms used must be compatible.
You may e.g. use the id *itsearch_sample-bde* in the graph_plots_ module.

.. code-block:: json

    { 
        "graph_id": "sachs.csv",
        "parameters_id": "sachs.rds",
        "data_id": "nonstandardized",
        "seed_range": [1, 10]
    }

IV
---

.. rubric:: Example


.. code-block:: json

    { 
        "graph_id": "sachs.csv",
        "parameters_id": "SEM",
        "data_id": "standardized",
        "seed_range": [1, 10]
    }


.. code-block:: json

    
        {
            "graph_id": "alarm.csv",
            "parameters_id": "SEM",
            "data_id": "standardized",
            "seed_range": [
                1,
                3
            ]
        }
    
V
---

.. rubric:: Example


.. code-block:: json

    { 
        "graph_id": "avneigs4_p20",
        "parameters_id": "SEM",
        "data_id": "standardized",
        "seed_range": [1, 10]
    }

.. include:: available_evaluations.rst

.. .. _evaluation:

.. ``evaluation``
.. ===============



.. There is typically no algorithm which performs well with respect to all performance metrics, and no single metric which is generally preferred. 
.. Therefore, to get an overall picture of the performance of an algorithm Benchpress supports different metrics through the modules in this section.
.. The output of the modules are copied to *results/output* for easy access.

.. .. _benchmarks:

.. ``benchmarks``
.. -----------------


.. +-------------+--------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `benchmarks <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-roc-item.md>`_ |
.. +-------------+--------------------------------------------------------------------------------------------------------------------+

.. Fields of this module

.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | Field               | Description                                                                                                                                                                                                          |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``filename_prefix`` | the prefix for the produced files.                                                                                                                                                                                   |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``show_seed``       | shows the seed numbers in the ROC type plots and for the outliers in the box-plots.                                                                                                                                  |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``errorbar``        | shows vertical estimated 5% and 95% quantiles in the ROC type plots.                                                                                                                                                 |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``errorbarh``       | shows horisontal estimated 5% and 95% quantiles in the ROC type plots.                                                                                                                                               |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``scatter``         | shows scatterplots in the ROC type plots.                                                                                                                                                                            |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``path``            | joins the median values of each parameter setting for a specific with a line. So for this to become a path, you need to specify range of values for some of the fields in the corresponding algorithm module object. |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
.. | ``text``            | shows the parameter value in the ROC type plots. If this is set to false, a dot will be plotted instead.                                                                                                             |     |
.. +---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+


.. This module produces the following files

.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *elapsed_time_joint.png*  | Box-plots for the total times over all seeds.                                                              |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *f1_skel_joint.png*       | F1 score box-plots.                                                                                        |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *FNR_FPR_skel.png*        | Median false negative rate (FNR) / false positive rate (FPRp) for the skeleton graph (undirected version). |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *FPR_TPR_skel.png*        | Median FPRp / TPR for the skeleton graph (undirected version).                                             |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *FPR_TPR_pattern.png*     | Median FPRp / TPR for the pattern graph (same as skeleton for undirected graphs).                          |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *FPRp_FNR_skel.png*       | Median FPRp / FNR for the skeleton graph.                                                                  |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *graph_type.png*          | Plots the type of graph for each graph estimate.                                                           |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *joint_benchmarks.csv*    | Benchmarks joined in a CSV file (this ay be analyzed using any preferred software).                        |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *ntests_joint.png*        | Box-plots for number of statistical tests (this is only applicable for some algorithms).                   |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *ROC_data.csv*            | Summarized benchmarks joined in a CSV file.                                                                |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+
.. | *SHD_cpdag_joint.png*     | Structural Hamming distance (SHD) box-plots.                                                               |
.. +---------------------------+------------------------------------------------------------------------------------------------------------+


.. .. rubric:: Example


.. .. code-block:: json

..     {
..         "filename_prefix": "example/",
..         "show_seed": false,
..         "errorbar": true,
..         "errorbarh": false,
..         "scatter": true,
..         "path": true,
..         "text": false,
..         "ids": [
..             "fges-sem-bic",
..             "mmhc-bge-zf",
..             "gfci-sem-bic-fisher-z",
..             "pc-gaussCItest"
..         ]
..     }

    
.. ..  figure:: _static/alarm/FPR_TPR_skel.png
..     :alt: FPR_TPR_skel.png 
..     :width: 500

..     *FPR_TPR_skel.png* 

.. The following plots are also produced

.. ..  figure:: _static/alarm/elapsed_time_joint.png
..     :alt: Timing 
..     :width: 500

..     *elapsed_time_joint.png*

.. ..  figure:: _static/alarm/f1_skel_joint.png
..     :alt: F1 
..     :width: 500

..     *f1_skel_joint.png*

.. ..  figure:: _static/alarm/graph_type.png
..     :alt: Graph type 
..     :width: 500

..     *graph_type.png* 

.. .. _ggally_ggpairs:

.. ``ggally_ggpairs``
.. -------------------------

.. This module writes ggpairs plots using the `GGally <https://cran.r-project.org/web/packages/GGally/index.html#:~:text=GGally%3A%20Extension%20to%20'ggplot2',geometric%20objects%20with%20transformed%20data.>`_ package. 
.. Be careful that this can be slow and the variable names may not fit into the figure if the dimension is too large.
.. However, you can always alter the script as you like it.

.. +-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `ggplot_ggpairs <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md>`_ |
.. +-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


.. ..  figure:: _static/alarm/pairs_1.png
..     :alt: GGpairs plot
..     :width: 500


..     GGpairs plot

.. .. _graph_true_stats:

.. ``graph_true_stats``
.. -------------------------

.. +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `graph_true_stats <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md>`_ |
.. +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. This module plots properties of the true graphs such as graph density.

.. .. _graph_true_plots:

.. ``graph_true_plots``
.. -------------------------

.. +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `graph_true_plots <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md>`_ |
.. +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


.. This module plots the true underlying graphs. 


.. ..  figure:: _static/alarm.png
..     :alt: The Alarm network 

..     The Alarm network

.. ..  figure:: _static/alarmadjmat.png
..     :alt: The Alarm network 

..     The Alarm network as adjacency matrix

.. .. _graph_plots:

.. ``graph_plots``
.. -------------------------

.. +-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `graph_plots <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-graph_plots.md>`_ |
.. +-------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+



.. This module plots and saves the estimated graphs in dot-format and adjacency matrix.
.. It also plots graph comparison using *graphviz.compare* from `bnlearn <https://www.bnlearn.com/>`_.

.. .. code-block:: json
    
..     [
..         "fges-sem-bic",
..         "mmhc-bge-zf",
..         "omcmc_itsample-bge",
..         "pc-gaussCItest"
..     ]

.. ..  figure:: _static/alarmpcgraph.png
..     :alt: The Alarm network 

..     Estimate of the Alarm network using PC algorithm

.. ..  figure:: _static/alarmpcest.png
..     :alt: The Alarm network 

..     Estimate of the Alarm network using PC algorithm

.. .. _mcmc_heatmaps:

.. ``mcmc_heatmaps``
.. -------------------------

.. +-------------+-----------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `mcmc_heatmaps <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-mcmc-mean-graph-plot.md>`_ |
.. +-------------+-----------------------------------------------------------------------------------------------------------------------------------------------+



.. For Bayesian inference it is custom to use MCMC methods to simulate a Markov chain of graphs :math:`\{G^l\}_{l=0}^\infty` having the graph posterior as stationary distribution.
.. Suppose we have a realisation of length :math:`M + 1` of such chain, then the posterior edge probability of an edge e is estimated by :math:`\frac{1}{M+1-b} \sum_{l=b}^{M} \mathbf{1}_{e}(e^l)`, where the first :math:`b` samples are disregarded as a burn-in period.

.. This module has a list of objects, where each object has 

.. +-------------+-------------------------+
.. | Field       | Description             |
.. +-------------+-------------------------+
.. | ``id``      | the algorithm object id |
.. +-------------+-------------------------+
.. | ``burn_in`` | the burn-in period.     |
.. +-------------+-------------------------+

.. The estimated probabilities are plotted in heatmaps using seaborn which are saved in *results/mcmc_heatmaps/* and copied to *results/output/mcmc_heatmaps/* for easy reference.

.. .. rubric:: Example

.. .. code-block:: json

..     [
..         {
..             "id": "omcmc_itsample-bge",
..             "burn_in": 0,
..             "active": true
..         }
..     ]

.. ..  figure:: _static/alarmordermcmc.png
..     :alt: The Alarm network 

..     Mean graph estimate of the Alarm network using order MCMC with startspace from iterative MCMC 


.. .. _mcmc_autocorr_plots:

.. ``mcmc_autocorr_plots``
.. -------------------------

.. +-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `mcmc_autocorr_plots <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-mcmc_autocorr_plots-item.md>`_ |
.. +-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+


.. This module plots the auto-correlation of a functional of the graphs in a MCMC trajectory. 

.. +----------------+----------------------------------------------------------------------------------------------------------------------------+
.. | Field          | Description                                                                                                                |
.. +----------------+----------------------------------------------------------------------------------------------------------------------------+
.. | ``id``         | algorithm module object id.                                                                                                |
.. +----------------+----------------------------------------------------------------------------------------------------------------------------+
.. | ``burn_in``    | use samples starting from this value. Use 0 if no burn-in.                                                                 |
.. +----------------+----------------------------------------------------------------------------------------------------------------------------+
.. | ``thinning``   | use only each ``thinning`` sample of the chain. (It is usually recommended to use this if the number of samples if large). |
.. +----------------+----------------------------------------------------------------------------------------------------------------------------+
.. | ``functional`` | the currently supported functionals are the number of edges for the graphs *size* and the graph *score*.                   |
.. +----------------+----------------------------------------------------------------------------------------------------------------------------+
.. | ``lags``       | The maximum number of lags after ``thinning``.                                                                             |
.. +----------------+----------------------------------------------------------------------------------------------------------------------------+


.. .. rubric:: Example

.. .. code-block:: json
    
..     [
..         {
..             "id": "omcmc_itsample-bge",
..             "burn_in": 0,
..             "thinning": 1,
..             "lags": 50,
..             "functional": [
..                 "score",
..                 "size"
..             ],
..             "active": true
..         }
..     ]

.. ..  figure:: _static/omcmcscoreautocorr.png
..     :alt: Score trajectory of order MCMC

..     Auto-correlation of the scores in trajectory of order MCMC

.. .. _mcmc_traj_plots:

.. ``mcmc_traj_plots``
.. -------------------------

.. +-------------+-------------------------------------------------------------------------------------------------------------------------------------------------+
.. | JSON schema | `mcmc_traj_plots <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-mcmc_traj_plots-item.md>`_ |
.. +-------------+-------------------------------------------------------------------------------------------------------------------------------------------------+



.. This module plots the  values in the trajectory of a given functional. 

.. The ``mcmc_traj_plots`` module has a list of objects, where each object has

.. +----------------+-------------------------------------------------------------------+
.. | Field          | Description                                                       |
.. +----------------+-------------------------------------------------------------------+
.. | ``id``         | algorithm module object id.                                       |
.. +----------------+-------------------------------------------------------------------+
.. | ``burn_in``    | use samples starting from this value. Use 0 if no burn-in.        |
.. +----------------+-------------------------------------------------------------------+
.. | ``functional`` | the currently supported functionals are *size* and graph *score*. |
.. +----------------+-------------------------------------------------------------------+

.. Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the ``thinning`` field. 


.. .. rubric:: Example

.. .. code-block:: json
        
..     [
..         {
..             "id": "omcmc_itsample-bge",
..             "burn_in": 0,
..             "thinning": 1,
..             "functional": [
..                 "score",
..                 "size"
..             ],
..             "active": true
..         }
..     ]

.. ..  figure:: _static/omcmcscoretraj.png
..     :alt: Score trajectory of order MCMC

..     Score trajectory of order MCMC


.. _resources:

``resources``
*************


The  sections ``graph``, ``parameters``, ``data``, and ``structure_learning_algorithms``
contain the available modules in benchpress.
Each object in a module algorithm has a unique `id` which can be referenced in the benchmark_setup_ section.

The names of the fields of the modules in this section are directly transferred or translated from the original libraries or code. Thus, for further details of each field we refer to the documentation of the original sources.

.. .. .. _resources:
.. .. .. figure:: _static/resources.png
.. ..     :width: 400

.. ..     Expanded ``resources`` in :download:`config/sec6.1.json <../../config/sec6.1.json>`. 




.. .. _setup:
.. .. figure:: _static/setup.png
..     :width: 400

..     Expanded ``resources`` and ``benchmark_setup`` in :download:`config/sec6.1.json <../../config/sec6.1.json>`. 


.. include:: available_graphs.rst
.. include:: available_parameters.rst
.. include:: available_data.rst
.. include:: available_structure_learning_algorithms.rst


.. [3] Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and versatile workflow for benchmarking structure learning algorithms for graphical models. ArXiv eprints., 2107.03863, 2021.
