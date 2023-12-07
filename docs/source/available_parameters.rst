.. _parameters: 

Parameters
====================

.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Parameters modules
    :caption: Parameters modules
    
    parameters/bdgraph_rgwish
    parameters/bin_bn
    parameters/fixed_params
    parameters/sem_params
    parameters/trilearn_g_inv_wishart
    parameters/trilearn_hyper-dir
    parameters/trilearn_intra-class
Parameter modules are listed below. 
Make sure that the parameter module is compatible with the graph module you are using.


.. list-table:: 
   :header-rows: 1 

   * - Method
     - Graph
     - Language
     - Package
     - Version
     - Module
   * - G-Wishart
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `R <https://www.r-project.org/>`__
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - 2.64
     - :ref:`bdgraph_rgwish` 
   * - Binary BN
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `R <https://www.r-project.org/>`__
     - Benchpress
     - 
     - :ref:`bin_bn` 
   * - Fixed parameters
     - 
     - 
     - 
     - 
     - :ref:`fixed_params` 
   * - SEM parameters
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `R <https://www.r-project.org/>`__
     - Benchpress
     - 
     - :ref:`sem_params` 
   * - Hyper-Dirichlet
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `Python <https://www.python.org/>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - :ref:`trilearn_hyper-dir` 
   * - Graph intra-class
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `Python <https://www.python.org/>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - :ref:`trilearn_intra-class` 



