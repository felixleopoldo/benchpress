The names of the fields of the modules are directly transferred or translated from the original libraries or code. 
Thus, for further details of each field see the documentation of the original sources.
Most of the parameters can be given as either a single value or a list.
However, some parametrers might be missing for some modules, to see which parameters are available please review the JSON schemas.
Dots (.) in the original parameter names are omitted for implementational reasons.


.. _graph: 

Graphs
===============

.. Several possibilities exist for defining the graph component, depending on whether we wish to draw random graphs from a given distribution, or maybe provide a given structure on which we wish to perform a benchmarking study. 
Below is a list of available modules.


.. list-table:: 
   :header-rows: 1 

   * - Method
     - Graph type
     - Package
     - Version
     - Module
   * - graph.sim function
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - 2.64
     - bdgraph_graphsim_ 
   * - Fixed graph
     - 
     - 
     - 
     - fixed_graph_ 
   * - Some title
     - 
     - 
     - v0.0.1
     - new_graph_ 
   * - randDAG
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - 2.7-3
     - pcalg_randdag_ 
   * - Band matrix
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_bandmat_ 
   * - CTA
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_cta_ 
   * - Random bandmatrix
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_rand_bandmat_ 





.. _bdgraph_graphsim: 

bdgraph_graphsim 
--------------------

.. rubric:: graph.sim function

.. list-table:: 

   * - Package
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
   * - Version
     - 2.64
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BDgraph/BDgraph.pdf>`__
   * - Paper
     - :footcite:t:`JSSv089i03`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/bdgraph:2.64 <https://hub.docker.com/r/bpimages/bdgraph/tags>`__

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



.. _fixed_graph: 

fixed_graph 
---------------

.. rubric:: Fixed graph

.. rubric:: Description


Fixed graphs are stored as adjacency matrices of in ``.csv`` format in the directory *resources/adjmats/myadjmats* along with the `existing ones <https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats>`_.
A fixed graph is referenced by the corresponding filename instead of `id` as with the other modules.

.. footbibliography::



.. _new_graph: 

new_graph 
-------------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <>`__
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - 
   * - Docker 
     - `bpimages/sandbox # Change to None for local execution <https://hub.docker.com/r/bpimages/sandbox # Change to None for local execution/tags>`__

   * - Module
     - `new_graph <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/new_graph>`__



.. rubric:: Description

Info about this graph generating module.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "test",
        "p": 10,
        "cutoff": 0.8
      }
    ]

.. footbibliography::



.. _pcalg_randdag: 

pcalg_randdag 
-----------------

.. rubric:: randDAG

.. list-table:: 

   * - Package
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
   * - Version
     - 2.7-3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`__
   * - Paper
     - :footcite:t:`JSSv047i11`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/bidag:2.1.4 <https://hub.docker.com/r/bpimages/bidag/tags>`__

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



.. _trilearn_bandmat: 

trilearn_bandmat 
--------------------

.. rubric:: Band matrix

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/trilearn:1.25 <https://hub.docker.com/r/bpimages/trilearn/tags>`__

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



.. _trilearn_cta: 

trilearn_cta 
----------------

.. rubric:: CTA

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`olsson2022sequential`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/trilearn:1.25 <https://hub.docker.com/r/bpimages/trilearn/tags>`__

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



.. _trilearn_rand_bandmat: 

trilearn_rand_bandmat 
-------------------------

.. rubric:: Random bandmatrix

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/trilearn:1.25 <https://hub.docker.com/r/bpimages/trilearn/tags>`__

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

