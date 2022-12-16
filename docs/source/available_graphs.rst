``graph``
===============

Several possibilities exist for defining the graph component, depending on whether we wish
to draw random graphs from a given distribution, or maybe provide a given structure on
which we wish to perform a benchmarking study. Below is the list of currently available modules.
The rules and corresponding scripts are located in *workflow/rules/graph/* and *workflow/scripts/graph/*, respectively.


.. list-table:: 
   :header-rows: 1 

   * - Method
     - Graph type
     - Package
     - Version
     - Module
   * - graph.sim function
     - UG
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - 2.64
     - bdgraph_graphsim_ 
   * - Fixed graph
     - 
     - 
     - 
     - fixed_graph_ 
   * - randDAG
     - DAG, UG
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - 2.7-3
     - pcalg_randdag_ 
   * - Band matrix
     - DG
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_bandmat_ 
   * - CTA
     - DG
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_cta_ 
   * - Random bandmatrix
     - DG
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_rand_bandmat_ 





``bdgraph_graphsim`` 
--------------------

.. rubric:: graph.sim function

.. list-table:: 

   * - Package
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
   * - Version
     - 2.64
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BDgraph/BDgraph.pdf>`__
   * - Paper
     - :footcite:t:`JSSv089i03`
   * - Graph type
     - UG
   * - Docker 
     - `onceltuca/bdgraph:2.64 <https://hub.docker.com/r/onceltuca/bdgraph/tags>`__

   * - Module
     - `bdgraph_graphsim <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/bdgraph_graphsim>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "circle",
        "p": 50,
        "graph": "circle",
        "class": null,
        "size": null,
        "prob": 0.2
      }
    ]

.. footbibliography::



``fixed_graph`` 
---------------

.. rubric:: Fixed graph

.. rubric:: Description


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

.. footbibliography::



``pcalg_randdag`` 
-----------------

.. rubric:: randDAG

.. list-table:: 

   * - Package
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
   * - Version
     - 2.7-3
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`__
   * - Paper
     - :footcite:t:`JSSv047i11`
   * - Graph type
     - DAG, UG
   * - Docker 
     - `onceltuca/bidag:2.0.3 <https://hub.docker.com/r/onceltuca/bidag/tags>`__

   * - Module
     - `pcalg_randdag <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/pcalg_randdag>`__



.. rubric:: Description

This is the *randDAG* from the R package `pcalg <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`_  with the extra feature that the maximum average number of parents can be set by ``max_parents``.

An object of the pcalg_randdag module specifies a graph generated using the randDAG
function from the pcalg package, with the extra functionality of restricting
the maximal number of parents per node (max_parents). It samples a random graph with n
nodes and d neighbours per node on average, using the algorithm specified by method with
parameters par1 and par2, for further details see :footcite:t:`JSSv047i11`.

.. Source `resources/binarydatagen/generate_DAG.R <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generate_DAG.R>`_

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md>`_ 



.. rubric:: Example


.. code-block:: json


    [
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
    ]

.. footbibliography::



``trilearn_bandmat`` 
--------------------

.. rubric:: Band matrix

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - DG
   * - Docker 
     - `onceltuca/trilearn:1.25 <https://hub.docker.com/r/onceltuca/trilearn/tags>`__

   * - Module
     - `trilearn_bandmat <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/trilearn_bandmat>`__



.. rubric:: Description


An object of this module specifies a decomposable graphs with adjacency matrix
with given bandwidth (*bandwith*).


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "AR2",
        "bandwidth": 2,
        "dim": 50
      }
    ]

.. footbibliography::



``trilearn_cta`` 
----------------

.. rubric:: CTA

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - DG
   * - Docker 
     - `onceltuca/trilearn:1.25 <https://hub.docker.com/r/onceltuca/trilearn/tags>`__

   * - Module
     - `trilearn_cta <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/trilearn_cta>`__



.. rubric:: Description


This is the Christmas tree algorithm (CTA) for generating decomposable graph implemented in the PyPi package `trilearn <https://pypi.org/project/trilearn/>`_.
This algortihm generates a decomposable graph iteratively one node at a time by making use of the junction tree represenantation.
``alpha`` and ``beta`` are sparsity parameters, where
``beta`` is the probabilty of creatinging a new node in each iteration isolated. 
``alpha`` is the probabilty of connecting the new node in each iteration to another clique in a random tree traversal, given that is is not isolated (which is controlled by ``beta``).
In summary, high values of ``alpha``, ``beta`` give denser graphs.


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "trilearn_cta",
        "order": 50,
        "alpha": 0.5,
        "beta": 0.7
      }
    ]

.. footbibliography::



``trilearn_rand_bandmat`` 
-------------------------

.. rubric:: Random bandmatrix

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - DG
   * - Docker 
     - `onceltuca/trilearn:1.25 <https://hub.docker.com/r/onceltuca/trilearn/tags>`__

   * - Module
     - `trilearn_rand_bandmat <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/trilearn_rand_bandmat>`__



.. rubric:: Description

An object of the max bandwith module specifies a decomposable graph with band structured adjacency matrix of a given maximum width (``max_bandwith``).


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "AR1-5",
        "max_bandwidth": 5,
        "dim": 50
      }
    ]

.. footbibliography::

