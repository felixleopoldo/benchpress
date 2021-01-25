parameters
==============================

generateBinaryBN
----------------

Samples gonditional probability tables in a limited range for a binary Bayesian network.

`https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generatebinaryBNf.r <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generatebinaryBNf.r>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatebinarybn.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id":"generateBinaryBN",
        "min":0.1,
        "max":0.9
    }


notears_parameters_sampling
---------------------------

Samples parameters for a Gaussian structural equation model type Bayesian network.

`https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_random_dag_parameters.py <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_random_dag_parameters.py>`_

`https://github.com/jmoss20/notears <https://github.com/jmoss20/notears>`_


.. note::

    Note that this can only be combined with graph from ``notears``.


See  `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id": "notears",
        "edge_coefficient_range_from": 0.5,
        "edge_coefficient_range_to": 2,
        "mean": 0,
        "variance": 1.0
    }


Bnlearn Bayesian networks
-------------------------

Bnlearn objects bn.fit objects are stored in ``.rds`` format in the directory ``resources/bn.fit_networks``.


.. rubric:: Example

Example standard networks (mostly from `https://www.bnlearn.com/bnrepository/ <https://www.bnlearn.com/bnrepository/>`_) are found at `https://github.com/felixleopoldo/benchpress/tree/master/resources/bn/bn.fit_networks <https://github.com/felixleopoldo/benchpress/tree/master/resources/bn/bn.fit_networks>`_.



.. note::

    This must be combined with the correct graph of the network. For example the network of ``asia.rds`` should be used with the graph ``asia.csv``, whish is the corresponding adjacancy matrix.