.. _parameters:

``parameters``
==============================

Samples the parameters for a graphical model with a given graph (specified in the ``data`` section).

``bin_bn``
--------------------

Samples conditional probability tables in a limited range (``min`` to ``max``) for a binary Bayesian network.

`https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generatebinaryBNf.r <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generatebinaryBNf.r>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatebinarybn.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id": "binbn",
        "min": 0.1,
        "max": 0.9
    }


``sem_params``
-------------------------------

Samples parameters for a Gaussian structural equation model (SEM) type Bayesian network.
Coefficients are sampled in the range ``edge_coefficient_range_from`` to ``edge_coefficient_range_to``.
Noise is sampled from a normal distribution with mean ``mean`` and variance ``variance``.

`https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_random_dag_parameters.py <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_random_dag_parameters.py>`_

`https://github.com/jmoss20/notears <https://github.com/jmoss20/notears>`_


.. note::

    Note that this can only be combined with graphs from the section ``graph->notears``.


See  `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id": "SEM",
        "min": 0.25,
        "max": 1
    }


Bnlearn Bayesian networks
-------------------------

Bnlearn objects `bn.fit` objects are stored in ``.rds`` format in the directory ``resources/bn.fit_networks``.


.. rubric:: Example

Example standard networks (mostly from `https://www.bnlearn.com/bnrepository/ <https://www.bnlearn.com/bnrepository/>`_) are found at `https://github.com/felixleopoldo/benchpress/tree/master/resources/parameters/myparams/bn.fit_networks <https://github.com/felixleopoldo/benchpress/tree/master/resources/parameters/myparams/bn.fit_networks>`_.



.. note::

    This must be combined with the correct graph of the network. For example, the network of ``asia.rds`` should be used with the graph ``asia.csv``, which happens the be corresponding adjacancy matrix.