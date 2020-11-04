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


bn.fit_networks
---------------

Fixed Bayesian network file in ``bn.fit`` format saved in ``.rds`` format.



See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-bnfit-network-file.md>`_

.. rubric:: Example

.. code-block:: json

    {
        "id":"hepar2.rds",
        "filename": "hepar2.rds",
        "source": "http://bnlearn.com/bnrepository/discrete-large.html#hepar2"          
    }

notears_parameters_sampling
---------------------------

Samples parameters for a Gaussisan Bayesian network.
Note that this can only be combined with graph from ``notears``.

Documentation: https://github.com/jmoss20/notears


See  `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id":"notears",
        "edge_coefficient_range_from":0.5,
        "edge_coefficient_range_to":2
    }
