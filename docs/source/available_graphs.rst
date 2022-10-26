.. _graph:

``graph``
========================


Several possibilities exist for defining the graph component, depending on whether we wish
to draw random graphs from a given distribution, or maybe provide a given structure on
which we wish to perform a benchmarking study. Below is the list of currently available modules.
The rules and corresponding scripts are located in *workflow/rules/graph/* and *workflow/scripts/graph/*, respectively.


+------------------------+-------------------+----------+---------+----------+--------+
| Method                 | Module id         | Library  | Version | Language | Graph  |
+------------------------+-------------------+----------+---------+----------+--------+
| randDAG                | pcalg_randdag_    | pcalg    | 2.7-3   | R        | DAG,UG |
+------------------------+-------------------+----------+---------+----------+--------+
| graph.sim              | bdgraph_graphsim_ | BDgraph  | 2.64    | R        | DG,UG  |
+------------------------+-------------------+----------+---------+----------+--------+
| CTA [24]               | trilearn_cta_     | trilearn | 1.2.3   | Python   | DG     |
+------------------------+-------------------+----------+---------+----------+--------+
| AR                     | bandmat_          | trilearn | 1.2.3   | Python   | DG     |
+------------------------+-------------------+----------+---------+----------+--------+
| AR random lag          | rand_bandmat_     | trilearn | 1.2.3   | Python   | DG     |
+------------------------+-------------------+----------+---------+----------+--------+
| Fixed adjacency matrix | -                 | -        | -       | .csv     | *      |
+------------------------+-------------------+----------+---------+----------+--------+

.. _pcalg_randdag:

``pcalg_randdag``
-------------------------

+----------------+-------------------+
| Module name    | pcalg_randdag     |
+----------------+-------------------+
| Package        | pcalg             |
+----------------+-------------------+
| Version        | 2.7-3             |
+----------------+-------------------+
| JSON object    | See JSON schema   |
+----------------+-------------------+
| Documentation  | pcalg docs        |
+----------------+-------------------+
| Paper          | -                 |
+----------------+-------------------+
| Snakemake rule | pcalg_randdag.smk |
+----------------+-------------------+
| Script         | pcalg_randdag.R   |
+----------------+-------------------+

This is the *randDAG* from the R package `pcalg <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`_  with the extra feature that the maximum average number of parents can be set by ``max_parents``.

An object of the pcalg_randdag module specifies a graph generated using the randDAG
function from the pcalg package (Kalisch et al. 2012), with the extra functionality of restricting
the maximal number of parents per node (max_parents). It samples a random graph with n
nodes and d neighbours per node on average, using the algorithm specified by method with
parameters par1 and par2, for further details see Kalisch et al.

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

.. _trilearn_cta:

``trilearn_cta``
-------------------

+----------------+------------------+
| Module name    | ``trilearn_cta`` |
+----------------+------------------+
| Package        | trilearn         |
+----------------+------------------+
| Version        | 1.2.3            |
+----------------+------------------+
| JSON object    | See JSON schema  |
+----------------+------------------+
| Documentation  | -                |
+----------------+------------------+
| Paper          | [OPR2022]_       |
+----------------+------------------+
| Snakemake rule | trilearn_cta.smk |
+----------------+------------------+
| Script         | trilearn_cta.R   |
+----------------+------------------+

This is the Christmas tree algorithm (CTA) for generating decomposable graph implemented in the PyPi package `trilearn <https://pypi.org/project/trilearn/>`_.
This algortihm generates a decomposable graph iteratively one node at a time by making use of the junction tree represenantation.
``alpha`` and ``beta`` are sparsity parameters, where
``beta`` is the probabilty of creatinging a new node in each iteration isolated. 
``alpha`` is the probabilty of connecting the new node in each iteration to another clique in a random tree traversal, given that is is not isolated (which is controlled by ``beta``).
In summary, high values of ``alpha``, ``beta`` give denser graphs.

.. rubric:: Example


.. code-block:: json

    {
        "id": "trilearn_cta",
        "order": 50,
        "alpha": 0.5,
        "beta": 0.7
    }


.. _bdgraph_graphsim:

``bdgraph_graphsim``
--------------------

+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Module name    | `bdgraph_graphsim <jsjs>`__                                                                                                        |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Package        | `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_                                                            |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Version        | 2.64                                                                                                                               |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Language       | R                                                                                                                                  |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Documentation  | `BDgraph docs <https://cran.r-project.org/web/packages/BDgraph/BDgraph.pdf>`_                                                      |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Paper          | [MW2019]_                                                                                                                          |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Snakemake rule | `bdgraph_graphsim.smk <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/sample_adjmat.smk>`_                 |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Script         | `bdgraph_graphsim.R <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/graph_sampling/bdgraph_graphsim.R>`_ |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Docker image   | `onceltuca/bdgraph:2.64 <https://hub.docker.com/repository/docker/onceltuca/bdgraph>`_                                             |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+
| Graph type     | Undirected                                                                                                                         |
+----------------+------------------------------------------------------------------------------------------------------------------------------------+


This is the *graph.sim* method from the `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_ package.

.. rubric:: Example


.. code-block:: json

    {
        "id": "circle",
        "p": 50,
        "graph": "circle",
        "class": null,
        "size": null,
        "prob": 0.2
    }


.. _trilearn_bandmat:

``trilearn_bandmat``
---------------------

+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Module name    | `trilearn_bandmat <jsjs>`__                                                                                                         |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Package        | `trilearn <https://cran.r-project.org/web/packages/BDgraph/index.html>`_                                                            |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Version        | 1.2.3                                                                                                                               |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Language       | Python                                                                                                                              |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Documentation  | -                                                                                                                                   |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Paper          | -                                                                                                                                   |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Snakemake rule | `trilearn_bandmat.smk <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/sample_adjmat.smk>`_                  |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Script         | `trilearn_bandmat.py <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/graph_sampling/bdgraph_graphsim.R>`_ |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Docker image   | `onceltuca/trilearn:1.2.3 <https://hub.docker.com/repository/docker/onceltuca/bdgraph>`_                                            |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+
| Graph type     | Decomposable                                                                                                                        |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------+


An object of this module specifies a decomposable graphs with adjacency matrix
with given bandwidth (*bandwith*).

.. rubric:: Example


.. code-block:: json

    {
        "id": "AR2",
        "bandwidth": 2,
        "dim": 50
    }
    

.. _trilearn_rand_bandmat:

``trilearn_rand_bandmat``
---------------------------

+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Module name    | `trilearn_rand_bandmat <jsjs>`__                                                                                                         |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Package        | `trilearn <https://cran.r-project.org/web/packages/BDgraph/index.html>`_                                                                 |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Version        | 1.2.3                                                                                                                                    |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Language       | Python                                                                                                                                   |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Documentation  | -                                                                                                                                        |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Paper          | -                                                                                                                                        |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Snakemake rule | `trilearn_rand_bandmat.smk <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/sample_adjmat.smk>`_                  |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Script         | `trilearn_rand_bandmat.py <https://github.com/felixleopoldo/benchpress/blob/master/workflow/scripts/graph_sampling/bdgraph_graphsim.R>`_ |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Docker image   | `onceltuca/trilearn:1.2.3 <https://hub.docker.com/repository/docker/onceltuca/bdgraph>`_                                                 |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Graph type     | Decomposable                                                                                                                             |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------+

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

Fixed graphs are stored as adjacency matrices of in ``.csv`` format in the directory *resources/adjmats/myadjmats* along with the `existing ones <https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats>`_.
A fixed graph is referenced by the corresponding filename instead of `id` as with the other modules.

A graph :math:`G` is represented as adjacency matrix :math:`M`, where :math:`M_{ij}=1` if :math:`(i,j)\in E` and  :math:`M_{ij}=0` if :math:`(i,j)\notin E`.

.. * The first row contains the labels of the variables.
.. * The columns are separated by a comma (,).
.. * 1 (0) at row i, column j indicates an (no) edge from variable i to j. 


.. rubric:: Example (undirected graph)

Below is an example undirected graph :math:`G=(V, E)`, where :math:`E = \{(a,b), (a,c), (c,d)\}` are interpreted as un-ordered pairs (un-directed edges).
Undirected graphs have symmetric matrices.

.. code-block:: text

    a,b,c,d
    0,1,1,0
    1,0,0,0
    1,0,0,1
    0,0,1,0


.. rubric:: Example (DAG)

If :math:`G` is directed the adjacency matrix is asymmetric as below.

.. code-block:: text

    a,b,c,d
    0,1,1,0
    0,0,0,0
    0,0,0,1
    0,0,0,0

.. .. important:: 

..     If a CSV file is specified as ``data_id`` then ``parameters_id`` and ``seed_range`` should be *null* whereas ``graph_id`` should be the true graphs that generated the dataset.
    

.. [AH2005] A. Atay-Kayis and H. Massam. A Monte Carlo method for computing the marginal likelihood in non decomposable Gaussian graphical models. Biometrika, 92(2):317–335, 2005.
.. [Len2013] A. Lenkoski. A direct sampler for g-wishart variates. Stat, 2(1):119–128, 2013
.. [OPR2022] Olsson, J., Pavlenko, T. & Rios, F.L. Sequential sampling of junction trees for decomposable graphs. Stat Comput 32, 80 (2022).
.. [MW2019] Mohammadi and E. C. Wit. BDgraph: An R package for Bayesian structure learning in graphical models. Journal of Statistical Software, Articles, 89(3):1–30, 2019.