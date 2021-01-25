
JSON config file
##################

This overview is based on the sample config file :download:`config.sample.binary.json <../../config/config.sample.binary.json>`. 
The `JSON schema <json-schema.org>`_ for the config file is found here `here <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config.md>`_.
The figures are generated using `JSON Editor Online <https://jsoneditoronline.org>`_.

The configuration file consists of two main categories ``benchmark_setup`` and ``resources``, see :numref:`maincats`.


.. _maincats:
.. figure:: _static/maincats_exp.png
    :width: 400

    Main categories in :download:`config.sample.binary.json <../../config/config.sample.binary.json>`.

* ``resources`` contains the available resources by means of graphs, parameters, data and structure learning algorithms.
* ``benchmark_setup`` defines the actual benchmarking setup, where the resourses are references by their ``id``.

    
benchmark_setup
***************

This defines the benchmark setup in four main categories, see :numref:`benchmark_setup`.

* ``data`` is a list of the data simulation setups.
* ``evaluation`` is a list of evaluation metrics (currently only ROC available).

.. _benchmark_setup:
.. figure:: _static/benchmark_setup.png
    :width: 400

    Expanded ``benchmark_setup`` in :download:`config.sample.binary.json <../../config/config.sample.binary.json>`. 



data
====

.. rubric:: Example

.. code-block:: json

    [{
        "graph_id": "generateDAGMaxParents",
        "parameters_id": "generateBinaryBN",
        "data_id": "standard_sampling",
        "seed_range": [
            1,
            10
        ]
    }]


evaluation
==========

.. _rocdef:

ROC
---
The ROC evaluation metric plots the number of false postive (FPRp) and true postive (TPR) edge rates, in the so called pattern graph of a DAG :math:`G=(V,E)`, where :math:`V` is the node set and :math:`E` is the edge set.

If :math:`G'=(V',E')` regarded as an estimate of :math:`G=(V,E)`, these metrics are defined as

.. math::
    
    FPRp := \frac{FP}{P},\quad TPR := \frac{TP}{P},
    
where

.. math::

    P:=|E|, \quad TP := |E \cap E'|, \quad FP:=|\bar E \cap E'|.


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-roc-item.md>`_

.. rubric:: Example

List of algorithm to be included in roc curve estimation.

.. code-block:: json

    [
        {
            "algorithm_id": "blip",
            "curve_variable": "time"
        },
        {
            "algorithm_id": "order_mcmc",
            "curve_variable": "threshold"
        },
        {
            "algorithm_id": "gobnilp",
            "curve_variable": "palim"
        },
        {
            "algorithm_id": "fges",
            "curve_variable": "faithfulnessAssumed"
        },
        {
            "algorithm_id": "tabu",
            "curve_variable": "beta"
        },
        {
            "algorithm_id": "hc",
            "curve_variable": "restart"
        },
        {
            "algorithm_id": "mmhc",
            "curve_variable": "alpha"
        }
    ]



resources
*********


The first catergories ``graph``, ``parameters``, ``data``, and ``structure_learning_algorithms``
contains the available algorithms for models, data, and structure learning algorihtms.


.. _resources:
.. figure:: _static/resources.png
    :width: 400

    Expanded ``resources`` in :download:`config.sample.binary.json <../../config/config.sample.binary.json>`. 


    Each algorithm has a unique id in its own category.


.. _setup:
.. figure:: _static/setup.png
    :width: 400

    Expanded ``data`` in :download:`config.sample.binary.json <../../config/config.sample.binary.json>`. 


    Each algorithm has a unique id in its own category.

.. include:: available_graphs.rst
.. include:: available_parameters.rst
.. include:: available_data.rst
.. include:: available_structure_learning_algorithms.rst
