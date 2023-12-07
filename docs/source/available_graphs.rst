The names of the fields of the modules are directly transferred or translated from the original libraries or code. 
Thus, for further details of each field see the documentation of the original sources.
Most of the parameters can be given as either a single value or a list.
However, some parametrers might be missing for some modules, to see which parameters are available please review the JSON schemas.
Dots (.) in the original parameter names are omitted for implementational reasons.


.. _graph: 

Graphs
===============

.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Graph modules
    :caption: Graph modules
    
    graph/bdgraph_graphsim
    graph/fixed_graph
    graph/pcalg_randdag
    graph/trilearn_bandmat
    graph/trilearn_cta
    graph/trilearn_rand_bandmat
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
     - 2.72
     - :ref:`bdgraph_graphsim` 
   * - Fixed graph
     - 
     - 
     - 
     - :ref:`fixed_graph` 
   * - randDAG
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - 2.7-3
     - :ref:`pcalg_randdag` 
   * - Band matrix
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 2.0.4
     - :ref:`trilearn_bandmat` 
   * - CTA
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 2.0.4
     - :ref:`trilearn_cta` 
   * - Random bandmatrix
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 2.0.4
     - :ref:`trilearn_rand_bandmat` 



