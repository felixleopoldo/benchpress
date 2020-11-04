graph
========================


generateDAGMaxParents
----------------------

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md>`_ 


.. rubric:: Example


.. code-block:: json

    {
        "id": "myrandomdag",
        "av_parents": 2,
        "dims": 80
    }


fixed_adjmats
-------------

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-fixed-adjacenty-matrix-of-a-graph.md>`_



.. rubric:: Example



.. code-block:: json

    {
        "id": "hepar2.csv",
        "filename": "hepar2.csv",
        "source": "http://bnlearn.com/bnrepository/discrete-large.html#hepar2"
    }
    

notears
-------

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-dag-sampling.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "notears_dag_sampling",
        "num_nodes":40,
        "num_edges": 80
    }
