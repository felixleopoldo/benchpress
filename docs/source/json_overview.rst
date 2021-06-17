
JSON config file
##################

This overview is based on the sample config file :download:`config.sample.docs.fullysampled.json <../../config/config.sample.docs.fullysampled.json>`. 
The `JSON schema <json-schema.org>`_ for the config file is found `here <https://github.com/felixleopoldo/benchpress/blob/master/workflow/schemas/docs/config.md>`_.
The figures are generated using `JSON Editor Online <https://jsoneditoronline.org>`_.

The configuration file consists of two main sections ``benchmark_setup`` and ``resources``, see :numref:`maincats`.



.. _maincats:
.. figure:: _static/maincats_exp.png
    :width: 400

    Main sections in :download:`config.sample.docs.fullysampled.json <../../config/config.sample.docs.fullysampled.json>`.

* ``resources`` contains the available resources in terms of graphs, parameters, data and structure learning algorithms.
* ``benchmark_setup`` defines the actual benchmarking setup, where the resourses are references by their corresponding ``id``.

    
``benchmark_setup``
********************

This defines the benchmark setup in two main sections, see :numref:`benchmark_setup`.

* ``data``:  a list of the data simulation setups.
* ``evaluation``: a list of evaluation metrics (currently only ROC available).

.. _benchmark_setup:
.. figure:: _static/benchmark_setup.png
    :width: 400

    Expanded ``benchmark_setup`` in :download:`config.sample.docs.fullysampled.json <../../config/config.sample.docs.fullysampled.json>`. 



``data``
========
This is a list of dictionaries, where each dictionary defines the data setup as:

* ``graph_id``:  an id from the ``resources->data`` section or a ``.csv`` file; see :ref:`graph`.
* ``parameters_id``:  an id from the ``resources->parameters`` section or a ``.rds`` file; see :ref:`parameters` .
* ``data_id``:  an id from the ``resources->data`` section or a ``.csv`` file; see :ref:`data`.
* ``seed_range``:  the number of seeds used for sampling models and datasets.  

.. note:: 

    If a ``.csv`` file is specified as ``data_id`` then ``parameters_id`` and ``seed_range`` should be *null* whereas ``graph_id`` should be the true graphs that generated the dataset.
    
.. note::

    If a ``.rds`` file is specified as ``parameters_id``, the true graph should be specified as a ``.csv`` file as ``graph_id``.


.. rubric:: Example

.. code-block:: json

    [{
        "graph_id": "DAGavpar2p80",
        "parameters_id": "binary_bn",
        "data_id": "iid160",
        "seed_range": [
            1,
            10
        ]
    }]


``evaluation``
===============

This section contains the available evaluation methods. (currently containing only ROC curve estimation).
Note that the results are also stored in the ``results`` directory as ``.csv`` files and can be analysed separately.

.. _rocdef:

``ROC``
-------
The ROC evaluation metric plots the number of false postive (FPRp) and true postive (TPR) edge rates, in the so called *pattern graph* of a DAG :math:`G=(V,E)`, where :math:`V` is the node set and :math:`E` is the edge set.

If :math:`G'=(V',E')` regarded as an estimate of :math:`G=(V,E)`, these metrics are defined as

.. math::
    
    FPRp := \frac{FP}{P},\quad TPR := \frac{TP}{P},
    
where

.. math::

    P:=|E|, \quad TP := |E \cap E'|, \quad FP:=|\bar E \cap E'|.

``algorithm_id`` is the current algorithm and ``curve_variable`` is the varying parameter in the plot.
In order to get the curve like form in the plot, you need to make sure that ``curve_variable`` is given as a list in the corresponding algorithm's section.

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-roc-item.md>`_

.. rubric:: Example

List of algorithm to be included in roc curve estimation.

.. code-block:: json

    [
        {
            "algorithm_id": "pcalg-bin",
            "curve_variable": "alpha"
        },
        {
            "algorithm_id": "tabu-bde",
            "curve_variable": "iss"
        },
        {
            "algorithm_id": "bnlearn_mmhc",
            "curve_variable": "alpha"
        },
        {
            "algorithm_id": "tetrad_fges-bdeu",
            "curve_variable": "samplePrior"
        },
        {
            "algorithm_id": "itsearch_sample",
            "curve_variable": "chi"
        },
        {
            "algorithm_id": "order_mcmc_itsample_chi1_thresh05",
            "curve_variable": "chi"
        }
    ]



``resources``
*************


The  catergories ``graph``, ``parameters``, ``data``, and ``structure_learning_algorithms``
contain the available models, data, and structure learning algorithms, see :numref:`resources`.
Each algorithm has a unique id in its own section which may be referenced from the ``benchmark_setup->data`` and ``benchmark_setup->evaluation``  sections, see :numref:`setup`.


.. _resources:
.. figure:: _static/resources.png
    :width: 400

    Expanded ``resources`` in :download:`config.sample.docs.fullysampled.json <../../config/config.sample.docs.fullysampled.json>`. 




.. _setup:
.. figure:: _static/setup.png
    :width: 400

    Expanded ``resources`` and ``benchmark_setup`` in :download:`config.sample.docs.fullysampled.json <../../config/config.sample.docs.fullysampled.json>`. 


.. include:: available_graphs.rst
.. include:: available_parameters.rst
.. include:: available_data.rst
.. include:: available_structure_learning_algorithms.rst
