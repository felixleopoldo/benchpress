data
=====


standard_sampling
-----------------

Data sampling from the model defined by ``graph_id`` and ``parameters_id``.

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-standard-sampling.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id":"standard_sampling",
        "sample_sizes": [100]
    }


Data files 
----------

Data files should be saved as .csv files in the ``resources/data/mydatasets`` directory.
A dataset is referenced by its filename.


* Columns should be separated by a blank space.
* First row should contain labels 
* For discrete data, the second row should contain the cardinalities of each variable.


.. rubric:: Example


Example of a discrete dataset from the Asia network `https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/myasiandata.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/myasiandata.csv>`_