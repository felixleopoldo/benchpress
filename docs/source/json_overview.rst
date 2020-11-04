
JSON file
#########

In this overview, the file :download:`config.sample.json <../../config.sample.json>` is used. The figures are generated using `JSON Editor Online <https://jsoneditoronline.org>`_.


The configuration file consists of two main categories ``benchmark_setup`` and ``resources``, see :numref:`maincats`.


.. _maincats:
.. figure:: _static/maincats_exp.png
    :width: 400

    Main categories in :download:`config.sample.json <../../config.sample.json>`.

``resources`` contains the available resources by means of graphs, parameters, data and structure learning algorithms.
``benchmark_setup`` defines the actual benchmarking setup, where the resourses are references by there id´s.

    
benchmark_setup
***************

This defines the benchmark setup in four main categories, see :numref:`benchmark_setup`  

``output_dir`` is the directory where the output will be stored (can only be files at the moment).
``structure_learning_algorithms`` is a list of id´s of structure learning algorithms to be analysed.
``data`` is a list of the data simulation setups.
``evaluation`` is a list of evaluation metrics (currently only ROC available).

.. _benchmark_setup:
.. figure:: _static/benchmark_setup.png
    :width: 400

    Expanded ``benchmark_setup`` in :download:`config.sample.json <../../config.sample.json>`. 


output_dir
==========

This is simply the directory for the files created.

algorithm_ids
=============

data
====

graph_id
---------

parameters_id
--------------

data_id
--------

seed_range
----------


evaluation
==========

ROC
---

List of algorithm to be included in roc curve estimation.

See `JSON schema <>`_

.. rubric:: Example

.. code-block:: json

    [
        {
            "structure_learning_algorithm": "blip",
            "curve_variable": "max_time"
        },
        {
            "structure_learning_algorithm": "order_mcmc",
            "curve_variable": "threshold"
        },
        {
            "structure_learning_algorithm": "gobnilp",
            "curve_variable": "palim"
        },
        {
            "structure_learning_algorithm": "fges",
            "curve_variable": "faithfulnessAssumed"
        },
        {
            "structure_learning_algorithm": "tabu",
            "curve_variable": "beta"
        },
        {
            "structure_learning_algorithm": "hc",
            "curve_variable": "restart"
        },
        {
            "structure_learning_algorithm": "mmhc",
            "curve_variable": "alpha"
        }
    ]



resources
*********


The first catergories ``graph``, ``parameters``, ``data``, and ``structure_learning_algorithms``.
contains the available algorithms for models, data, and structure learning 


.. _resources:
.. figure:: _static/resources.png
    :width: 400

    Expanded ``resources`` in :download:`config.sample.json <../../config.sample.json>`. 


    Each algorithm has a unique id in its own category.


.. _setup:
.. figure:: _static/setup.png
    :width: 400

    Expanded ``data`` in :download:`config.sample.json <../../config.sample.json>`. 


    Each algorithm has a unique id in its own category.

.. include:: available_graphs.rst
.. include:: available_parameters.rst
.. include:: available_data.rst
.. include:: available_structure_learning_algorithms.rst
