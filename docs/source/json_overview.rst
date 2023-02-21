JSON config structure
##############################

In this section we describe the modules of Benchpress and the structure of the `JSON <https://www.json.org/json-en.html>`__ configuration file, which serves as interface for the user.
For reference, we show the content of  `config/paper_pc_vs_dualpc.json <https://github.com/felixleopoldo/benchpress/blob/master/config/paper_pc_vs_dualpc.json>`__, which is  comparison between :ref:`pcalg_pc` and :ref:`dualpc`.

At the highest level there are two main sections, :ref:`benchmark_setup` (Line 2) and :ref:`resources` (Line 37). 
The :ref:`resources` section contains separate subsections of the available modules for generating or defining graphs (:ref:`graph`), parameters (:ref:`parameters`), data (:ref:`data`, and algorithms for structure learning (:ref:`structure_learning_algorithms`). 
Each module in turn has a list, where each element is an object defining a parameter setting, identified by a unique ``id`` (Lines 41, 50, 64, 73, and 87). 
The :ref:`benchmark_setup` section specifies the data models (data_) (Line 3) and evaluation methods (:ref:`evaluation`) (Line 11) a user wishes to consider for analysis. 
The module objects used in :ref:`benchmark_setup` are defined in :ref:`resources` and referenced by their corresponding ``id`` s. 


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



Figure 1 shows a flowchart describing how the files (light colored rectangles) and sections relate to the modules (dark colored rounded rectangles). 
Graphs, parameters, and data are denoted by :math:`G, \Theta`, and :math:`\mathbf Y`, respectively.
The different colors pink, blue, and purple indicate modules, files and sections related to data, structure learning, and evaluating results, respectively. 
An arrow from a node A to another node B should be read as *“B requires input from A”*. 
Thus, for any node, following the arrows in their opposite directions builds a path of the used modules or files. 
Dashed arrows indicates that one of the parents is required and grey arrows indicate partial requirement.

.. figure:: _static/jsonmap.png
    :width: 500

    Flowchart for the Benchpress sections/modules/files architecture.


.. _benchmark_setup:

``benchmark_setup``
********************


.. _datasetup:

``data``
========


This section should contain a list where each item defines a certain data setup.
For each seed number :math:`i` in the range specified by ``seed_range`` (Line 8), a graph :math:`G_i` is obtained as specified by ``graph_id`` (Line 5). 
Given :math:`G_i`, the parameters in the model :math:`\Theta_i` are obtained from ``parameters_id`` (Line 6). 
A data matrix, :math:`\mathbf Y_i^T = (Y_{1:p}^j)_{j=1}^n`, is then sampled from :math:`(G_i,\Theta_i)` as specified by the data model in ``data_id`` (Line 7). 




.. _resources:

``resources``
*************

The names of the fields of the modules in this section are directly transferred or translated from the original libraries or code. Thus, for further details of each field we refer to the documentation of the original sources.

To start an interactive `Docker <https://www.docker.com/>`_ shell for a module run

.. prompt:: bash

    docker run -it username/image:version

or using `Apptainer <https://apptainer.org/>`_

.. prompt:: bash

    apptainer run docker://username/image:version


.. rubric:: References


.. footbibliography::