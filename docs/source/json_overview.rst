
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


.. _resources:

``resources``
*************


The  sections ``graph``, ``parameters``, ``data``, and ``structure_learning_algorithms``
contain the available modules in benchpress.
Each object in a module algorithm has a unique `id` which can be referenced in the benchmark_setup_ section.

The names of the fields of the modules in this section are directly transferred or translated from the original libraries or code. Thus, for further details of each field we refer to the documentation of the original sources.

To start an inderactive Doecker chell for an algorithm type e.g.

.. code-block:: bash

    docker run -it theusername/theimage:theversion

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
