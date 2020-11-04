data
=====

fixed
-----

See `JSON schema <>`_


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
    
notears_standard_sampling
-------------------------

Datatype: continuous

See `JSON schema <>`_

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

See `JSON schema <>`_


.. rubric:: Example


.. code-block:: json

    {
        "id":"standard_sampling",
        "sample_sizes": [100]
    }
