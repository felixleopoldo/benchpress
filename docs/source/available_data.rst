.. _data:

``data``
=========


``iid``
---------------------

Independently identically distributed (IID) samples of a given size ``sample_sizes``.
The data may be standardized by setting ``standardized`` to true. 


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-standard-sampling.md>`_


.. rubric:: Example


.. code-block:: json
    
    {
        "id": "example1",
        "standardized": false,
        "sample_sizes": [
            320,
            640
        ]
    }

``gcastle_iidsimulation``
--------------------------

IID samples from a SEM model using the  ``IIDSimulation`` object in the ``gCastle`` library.
The data may be standardized by setting ``standardized`` to true. 


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-gcastle_iidsimulation.md>`_


.. rubric:: Example


.. code-block:: json
    
    {
        "id": "gcastle_semdata",
        "standardized": true,
        "method": "linear",
        "sem_type": "gauss",
        "noise_scale": 1.0,
        "n": [
            1000
        ]
    }

Fixed dataset 
--------------

Data files should be saved as ``.csv`` files in the ``resources/data/mydatasets`` directory.
A dataset is referenced by its filename.


* Columns should be separated by a blank space.
* First row should contain labels.
* For discrete data, the second row should contain the cardinalities of each variable.


.. rubric:: Example


Example of a fixed dataset with and without the true graph. 
Note that the true graph is needed for the ``benchmarks`` module.

.. code-block:: json

    {
        "graph_id": null,
        "parameters_id": null,
        "data_id": "olsson2019_p15_n1000.csv",
        "seed_range": null
    }

.. code-block:: json

    {
        "graph_id": "jonesp15.csv",
        "parameters_id": null,
        "data_id": "olsson2019_p15_n1000.csv",
        "seed_range": null
    }