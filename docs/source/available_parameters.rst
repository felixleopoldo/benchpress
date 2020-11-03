parameters_sampling_algorithms
##############################

generateBinaryBN
****************

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatebinarybn.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id":"generateBinaryBN",
        "min":0.1,
        "max":0.9
    }


bn.fit_networks
***************

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-bnfit-network-file.md>`_

.. rubric:: Example

.. code-block:: json

    {
        "id":"hepar2.rds",
        "filename": "hepar2.rds",
        "source": "http://bnlearn.com/bnrepository/discrete-large.html#hepar2"          
    }

notears_parameters_sampling
***************************

See  `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md>`_


.. rubric:: Example

.. code-block:: json

    {
        "id":"notears",
        "edge_coefficient_range_from":0.5,
        "edge_coefficient_range_to":2
    }
