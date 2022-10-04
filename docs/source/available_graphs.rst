.. _graph:

``graph``
========================


Several possibilities exist for defining the graph component, depending on whether we wish
to draw random graphs from a given distribution, or maybe provide a given structure on
which we wish to perform a benchmarking study. Below is the list of currently available modules.

.. _pcalg_randdag:

``pcalg_randdag``
-------------------------

This is the *randDAG* from the R package `pcalg <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`_  with the extra feature that the maximum average number of parents can be set by ``max_parents``.

An object of the pcalg_randdag module specifies a graph generated using the randDAG
function from the pcalg package (Kalisch et al. 2012), with the extra functionality of restricting
the maximal number of parents per node (max_parents). It samples a random graph with n
nodes and d neighbours per node on average, using the algorithm specified by method with
parameters par1 and par2, for further details see Kalisch et al. (2

.. Source `resources/binarydatagen/generate_DAG.R <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generate_DAG.R>`_

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
        "method": "er",
        "DAG": true
    }

``trilearn_cta``
-------------------
This is the Christmas tree algorithm for generating decomposable graph implemented in the PyPi package `trilearn <https://pypi.org/project/trilearn/>`_.

.. rubric:: Example


.. code-block:: json

    {
        "id": "trilearn_cta",
        "order": 50,
        "alpha": 0.5,
        "beta": 0.7
    }

``bdgraph_graphsim``
--------------------

Provided that :math:`G` is undirected, an object of this module defines a zero-mean Gaussian graphical model by sampling the precision matrix from the *G-Wishart* distribution [4]_ [5]_ using the *rgwish* function from the R package `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_.
The inverted precision matrix is saved, serving as covariance matrix in a Gaussian distribution.

``bandmat``
-------------------
An object of the bandmat module specifies a decomposable graphs with adjacency matrix
with given bandwidth (*bandwith*).

.. rubric:: Example


.. code-block:: json

    {
        "id": "AR2",
        "bandwidth": 2,
        "dim": 50
    }
    
``rand_bandmat``
-------------------
An object of the max bandwith module specifies a decomposable graph with band structured adjacency matrix of a given maximum width (``max_bandwith``).


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


Fixed graph
----------------


Adjacency matrix of a graph in ``.csv`` format. 
Must be stored in the directory ``resources/adjmats/myadjmats``.
The graph is referenced by the corresponding filename.

* The first row should contain the labels of the variables.
* The columns should be separated by a comma (,).
* 1 (0) at row i column j mean that there is (is not) an edge pointing from variable i to j. 
* Undirected graphs have symmetric matrices.


Examples are found `here <https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats>`_.





.. important:: 

    If a CSV file is specified as ``data_id`` then ``parameters_id`` and ``seed_range`` should be *null* whereas ``graph_id`` should be the true graphs that generated the dataset.
    

.. [4] A. Atay-Kayis and H. Massam. A Monte Carlo method for computing the marginal likelihood in non decomposable Gaussian graphical models. Biometrika, 92(2):317–335, 2005.
.. [5] A. Lenkoski. A direct sampler for g-wishart variates. Stat, 2(1):119–128, 2013.