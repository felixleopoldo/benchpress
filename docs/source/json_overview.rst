.. _json_config:

JSON config
##############################

The `JSON <https://www.json.org/json-en.html>`__ configuration file, together with snakemake's command line tool, serve as the interface for the user.
Below we describe the main structure of a config file, where we for reference show (in :numref:`pcdualpc` with additional comments) the content of `config/paper_pc_vs_dualpc.json <https://github.com/felixleopoldo/benchpress/blob/master/config/paper_pc_vs_dualpc.json>`__ , which is a comparison study between the PC algorithm :footcite:p:`doi:10.1177/089443939100900106` (:ref:`pcalg_pc`) and the Dual PC algorithm :footcite:p:`pmlr-v186-giudice22a` (:ref:`dualpc`). 
The results of this study can be found in :ref:`pcdualpcstudy`.

At the highest level there are two main sections, ``benchmark_setup`` (Line 2) and ``resources`` (Line 37).
The modules used in ``benchmark_setup`` are specified in ``resources`` and referenced by their corresponding IDs. 

resources
************

.. the available modules for generating or defining graphs, parameterisation, data, and algorithms for structure learning. 
The ``resources`` section contains the subsections ``graph`` (Line 47), ``parameters`` (Line 61), ``data`` (Line 37), and ``structure_learning_algorithms`` (Line 70), which should contain the modules used in a study. 
Each module in turn has a list of JSON objects, where each of the objects defines a specific parameter setting. 
The objects are identified by unique IDs (see Lines 41, 50, 64, 73, and 87). 

.. To use other modules than found in this study, you need to add them to the proper subsection of ``resources``.


benchmark_setup
**********************

The ``benchmark_setup`` section specifies the data models (``data``, Line 3) and evaluation methods (``evaluation``, Line 11) a user wishes to consider for analysis.


* The ``data`` section should contain a list, where each item defines a certain data setup. For each seed number :math:`i` in the range specified by ``seed_range`` (Line 8), a triple (:math:`G_i, \Theta_i, \mathbf Y_i`) is generated, where :math:`G_i` is obtained as specified by ``graph_id`` (Line 5). Conditional on :math:`G_i`, the model parameters :math:`\Theta_i` are obtained according to ``parameters_id`` (Line 6).  The data matrix :math:`\mathbf Y_i = (Y^j)_{j=1}^n` is sampled from :math:`(G_i,\Theta_i)` as specified by ``data_id`` (Line 7).

.. * For each seed number :math:`i` in the range specified by ``seed_range`` (Line 8), a graph :math:`G_i` is obtained as specified by ``graph_id`` (Line 5). 
.. * Given :math:`G_i`, the parameters in the model :math:`\Theta_i` are obtained from ``parameters_id`` (Line 6). 
.. * A data matrix, :math:`\mathbf Y_i = (Y^j)_{j=1}^n`, is then sampled from :math:`(G_i,\Theta_i)` as specified by the data model in ``data_id`` (Line 7). 

.. Note that, in the special case of using fixed-file modules, the IDs are replaced by filenames.

* The ``evaluation`` section contains the evaluation methods used for the analysis. Description of the available evaluation methods can be found in :ref:`evaluation`.

.. code-block:: json
    :linenos:
    :name: pcdualpc
    :caption: Comparison between PC vs. dual PC.

    {
        "benchmark_setup": {
            "data": [ // the data setups
                {
                    "graph_id": "avneigs4_p80", // see line 50
                    "parameters_id": "SEM", // see line 64
                    "data_id": "standardized", // see line 41
                    "seed_range": [1, 10]
                }
            ],
            "evaluation": { // the evaluation modules
                "benchmarks": {  
                    "filename_prefix": "paper_pc_vs_dualpc/",
                    "show_seed": true,
                    "errorbar": true,
                    "errorbarh": false,
                    "scatter": true,
                    "path": true,
                    "text": false,
                    "ids": [
                        "pc-gaussCItest", // see line 87
                        "dualpc" // see line 73
                    ]
                },
                "graph_true_plots": true,
                "graph_true_stats": true,
                "ggally_ggpairs": false,
                "graph_plots": [
                    "pc-gaussCItest",
                    "dualpc"
                ],
                "mcmc_traj_plots": [],
                "mcmc_heatmaps": [],
                "mcmc_autocorr_plots": []
            }
        },
        "resources": {
            "data": { // the data modules
                "iid": [
                    {
                        "id": "standardized",
                        "standardized": true,
                        "n": 300
                    }
                ]
            },
            "graph": { // the graph modules 
                "pcalg_randdag": [
                    {
                        "id": "avneigs4_p80",
                        "max_parents": 5,
                        "n": 80,
                        "d": 4,
                        "par1": null,
                        "par2": null,
                        "method": "er",
                        "DAG": true
                    }
                ]
            },
            "parameters": { // the parameters modules
                "sem_params": [
                    {
                        "id": "SEM",
                        "min": 0.25,
                        "max": 1
                    }
                ]
            },
            "structure_learning_algorithms": { // the structure learning modules
                "dualpc": [
                    {
                        "id": "dualpc",
                        "alpha": [
                            0.001,
                            0.05,
                            0.1
                        ],
                        "skeleton": false,
                        "pattern_graph": false,
                        "max_ord": null,
                        "timeout": null
                    }
                ],
                "pcalg_pc": [
                    {
                        "id": "pc-gaussCItest",
                        "alpha": [
                            0.001,
                            0.05,
                            0.1
                        ],
                        "NAdelete": true,
                        "mmax": "Inf",
                        "u2pd": "relaxed",
                        "skelmethod": "stable",
                        "conservative": false,
                        "majrule": false,
                        "solveconfl": false,
                        "numCores": 1,
                        "verbose": false,
                        "indepTest": "gaussCItest",
                        "timeout": null
                    }
                ]
            }
        }
    }



.. Figure 1 shows a flowchart describing how the files (light colored rectangles) and sections relate to the modules (dark colored rounded rectangles). 
.. Graphs, parameters, and data are denoted by :math:`G, \Theta`, and :math:`\mathbf Y`, respectively.
.. The different colors pink, blue, and purple indicate modules, files and sections related to data, structure learning, and evaluating results, respectively. 
.. An arrow from a node A to another node B should be read as *“B requires input from A”*. 
.. Thus, for any node, following the arrows in their opposite directions builds a path of the used modules or files. 
.. Dashed arrows indicates that one of the parents is required and grey arrows indicate partial requirement.

.. .. figure:: _static/jsonmap.png
..     :width: 500

..     Flowchart for the Benchpress sections/modules/files architecture.



.. .. _benchmark_setup:

.. benchmark_setup
.. ************************


.. .. _datasetup:

.. data
.. ========


.. .. _resources:

.. resources
.. *************

.. The resources section defines the available modules to be used in the benchmark_setup section.



Example data scenarios
************************

Apart from the modules used in :numref:`pcdualpc`, Benchpress also provides the special modules :ref:`fixed_graph`, :ref:`fixed_params`, and :ref:`fixed_data`, which allow the user to provide files in their analysis.
These modules are not part of the resources section of the `JSON <https://www.json.org/json-en.html>`__ file and are referenced by IDs, instead, files are simply referenced by their names.
The file formats are described in :ref:`file_formats`.

.. The modules :ref:`fixed_graph`, :ref:`fixed_params`, and :ref:`fixed_data` are special, in the sense that they allow the user to specify fixed graphs, parameters and data, instead of generating them using the modules in the resources section.

.. , instead of their object ids as for ordinary modules.

.. Benchpress supports different strategies for defining models and data. 
.. One possibility is to generate data, graphs and parameters using the existing modules in the ``resources`` section, referenced by their objects id, as described above. 
.. An alternative is to provide user-specified graphs, parameters and data sets, referenced by their corresponding filenames. 
.. Further, we can combine the two approaches as needed.

The different sources of data, obtained by combining the fixed files and the ordinary modules, can be summarised in five scenarios
shown in the table below. Scenario I is the typical scenario for data analysts, where the user provides
one or more datasets by hand. Scenario II is similar to Scenario I, with the difference that
the user also provides the true graph underlying the data. This situation arises e.g. when
replicating a simulation study from the literature, where both the true graph and the dataset
are given. Scenarios III-V are pure benchmarking scenarios, where either all of the graphs,
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

The following subsections shows some template data examples in the ``benchmark_setup`` section that correspond to the scenarios I-IV.


.. To try this out, you may change the current data section in `config/config.json <../../config/config.json>`__.
.. Note that, in general the id's used must be defined in the resources section (as it is in `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`__ ). 
.. For example, *avneigs4_p20* is the id of an object in the :ref:`pcalg_randdag` module in the :ref:`graph` section.
.. Also, datasets, parameters, and graphs must be placed in the proper subfolder of the `resources/ <https://github.com/felixleopoldo/benchpress/blob/master/resources/>`_ folder.

.. Note that some evaluation modules are not compatible with this scenario as there is no true graph specified.
.. For example, you may not use the :ref:`graph_true_plots` or :ref:`benchmarks` modules as both require the true graph to be provided.


.. Examples
.. ^^^^^^^^^

.. _I:

I) Data analysis (fixed data)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the example below, *my_data_file.csv* should be a file in  `resources/data/mydatasets <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/>`_.

.. code-block:: json

    { 
        "graph_id": null,
        "parameters_id": null,
        "data_id": "my_data_file.csv",
        "seed_range": null
    }


In the example below, *my_data_folder* should be a subfolder of  `resources/data/mydatasets <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/>`_ containing data files.

.. code-block:: json

    { 
        "graph_id": null,
        "parameters_id": null,
        "data_id": "my_data_folder",
        "seed_range": null
    }


.. _II:

II) Data analysis with validation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


.. code-block:: json

    { 
        "graph_id": "my_graph_file.csv",
        "parameters_id": null,
        "data_id": "my_data_file.csv",
        "seed_range": null
    }

III) Fixed graph
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


.. code-block:: json

    
        {
            "graph_id": "my_graph_file.csv",
            "parameters_id": "my_params_id",
            "data_id": "my_data_id",
            "seed_range": [
                1,
                3
            ]
        }


IV) Fixed graph and parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. Beware that the parameters in the following example is for binary data so make sure that the algorithms used must be compatible.
.. You may e.g. use the id *itsearch_sample-bde* in the :ref:`graph_plots` module.

.. code-block:: json

    { 
        "graph_id": "my_graph_file.csv",
        "parameters_id": "my_params_file.rds",
        "data_id": "my_data_id",
        "seed_range": [1, 10]
    }


.. _V:

V) Fully generated
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: json

    { 
        "graph_id": "my_graph_id",
        "parameters_id": "my_params_id",
        "data_id": "my_data_id",
        "seed_range": [1, 10]
    }





.. rubric:: References


.. footbibliography::