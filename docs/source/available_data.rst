data
=====

fixed_data
----------

Analysing fixed data set in ``.csv`` format.
The data file should be put in the folder ``files/data/mydatasets``.
The colomns should be separated by a blank space " ".

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-data-file.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "myasiandata.csv",
        "datatype": "binary",
        "samples": 100,
        "filename": "myasiandata.csv",
        "graph": "asia.csv",
        "source": "scutari"
    }

notears_linear_gaussian_sampling
--------------------------------

This samples data from a Gaussian Bayesian network.
Note that this can only be combined with the parameters from ``notears_standard_sampling`` and graph from ``notears``.

Documentation: https://github.com/jmoss20/notears

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-linear-gaussian-sampling.md>`_

.. rubric:: Example


.. code-block:: json

    {
        "id": "standard_linear_gaussian",
        "sample_sizes": [
            100
        ],
        "mean": 0,
        "variance": 1
    }


standard_sampling
-----------------

Sampling from a discrete Bayesian network.

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-standard-sampling.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id":"standard_sampling",
        "sample_sizes": [100]
    }
