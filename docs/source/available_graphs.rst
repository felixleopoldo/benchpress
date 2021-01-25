graph
========================


generateDAGMaxParents
----------------------

This methods generates a random DAG with agiven number of nodes and limited average nuber of parents per node.

`See code <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generate_DAG.R>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md>`_ 


.. rubric:: Example


.. code-block:: json

    {
        "id": "myrandomdag",
        "av_parents": 2,
        "dims": 80
    }


notears
-------

This method generated a random DAG with a given number of nodes and edges using a triangular array.

See

`https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_randomdag.py <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_randomdag.py>`_ 
`https://github.com/jmoss20/notears/blob/master/notears/utils.py <https://github.com/jmoss20/notears/blob/master/notears/utils.py>`_.

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-dag-sampling.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "notears_dag_sampling",
        "num_nodes":40,
        "num_edges": 80
    }


Adjacency matrix 
----------------


Adjacency matrix in .csv format should be stored in the directory ``resources/adjmats/myadjmats`.
The graph is referenced by the corresponding filename of the adjacency matrix.

* The first row should contain the labels of the variables.
* The columns should be separated by a comma (,).
* 1 (0) at row i column j mean that there is (is not) an edge pointing from variable i to j. 
* Undirected graphs have symmetric matrices.

.. Example::

Examples are found here
`https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats <https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats>`_