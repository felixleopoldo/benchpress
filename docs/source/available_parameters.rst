parameters
==============================

generateBinaryBN
----------------

Samples parameters for a binary Bayesian network.

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

Samples parameters for a Gaussisn Bayesian network.
Note that this can only be combined with graph from ``notears``.

Documentation: https://github.com/jmoss20/notears


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