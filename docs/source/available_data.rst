.. _data:

``data``
=========

There are two possibilities for the data section. 
The user may provide their own data in .csv format for benchmarking on real data. Alternatively Benchpress can generate data according to a data model for benchmarking on simulated data.

.. _iid:

``iid``
---------------------

Independently identically distributed (IID) samples of a given size ``sample_sizes``.
The data may be standardized by setting ``standardized`` to true. 


+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Module name     | ``iid``                                                                                                                      |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Package/library | Benchpress                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| JSON schema     | `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-standard-sampling.md>`_ |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Version         | -                                                                                                                            |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Documentation   | -                                                                                                                            |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Paper           | -                                                                                                                            |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Snakemake rule  | various                                                                                                                      |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Parameters      | see JSON schema                                                                                                              |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+
| Script          | -                                                                                                                            |
+-----------------+------------------------------------------------------------------------------------------------------------------------------+

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


