.. _graph:

``graph``
========================

This section contains the availabele graph modules.

``pcalg_randdag``
-------------------------

This is the randDAG from the *pcalg* R package with the extra feature that the maximuma averagr numbr of parents can be set by (``max_parents``).

Source `resources/binarydatagen/generate_DAG.R <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generate_DAG.R>`_

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md>`_ 


.. rubric:: Example


.. code-block:: json

    {
        "id": "avneigs4",
        "max_parents": 5,
        "n": 80,
        "d": 4,
        "par1": null,
        "par2": null,
        "method": "er"
    }

``trilearn_cta``
-------------------
This is the Christmas tree algorithm for generating decomposable graph implemented in the *trilearn* PyPi package.

.. rubric:: Example


.. code-block:: json

    {
        "id": "trilearn_cta",
        "order": 50,
        "alpha": 0.5,
        "beta": 0.7
    }


``bandmat``
-------------------
An object of the bandmat module specifies a decomposable graphs with adjacency matrix
with given bandwidth (bandwith).

.. rubric:: Example


.. code-block:: json

    {
        "id": "AR2",
        "bandwidth": 2,
        "dim": 50
    }
    
``rand_bandmat``
-------------------
An object of the max bandwith module specifies a decomposable graph with band structured adjacency matrix of a given maximum width (max bandwith).


.. rubric:: Example


.. code-block:: json

    {
        "id": "AR1-5",
        "max_bandwidth": 5,
        "dim": 50
    }
    


.. ``notears``
.. -----------

.. Samples a random DAG with a given number of nodes (``num_nodes``) and edges (``num_edges``) using a triangular array.

.. See

.. `https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_randomdag.py <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/notears/generate_randomdag.py>`_ 
.. `https://github.com/jmoss20/notears/blob/master/notears/utils.py <https://github.com/jmoss20/notears/blob/master/notears/utils.py>`_.

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears-dag-sampling.md>`_


.. .. rubric:: Example


.. .. code-block:: json

..     {
..         "id": "randdag_p40_e80",
..         "num_nodes": 40,
..         "num_edges": 80
..     }


Adjacency matrix 
----------------


Adjacency matrix of a graph in ``.csv`` format. 
Must be stored in the directory ``resources/adjmats/myadjmats``.
The graph is referenced by the corresponding filename.

* The first row should contain the labels of the variables.
* The columns should be separated by a comma (,).
* 1 (0) at row i column j mean that there is (is not) an edge pointing from variable i to j. 
* Undirected graphs have symmetric matrices.

.. Example::

Examples are found here
`https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats <https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats>`_