


:og:description: The Peter and Clark (PC) algorithm :footcite:t:`doi:10.1177/089443939100900106`, is a constraint based method consisting of two main steps. The first step is called the adjacency search and amounts to finding the undirected skeleton of the DAG. The second step amounts to estimating a CPDAG.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: PC (pcalg)
 
.. meta::
    :title: PC (pcalg)
    :description: The Peter and Clark (PC) algorithm :footcite:t:`doi:10.1177/089443939100900106`, is a constraint based method consisting of two main steps. The first step is called the adjacency search and amounts to finding the undirected skeleton of the DAG. The second step amounts to estimating a CPDAG.


.. _pcalg_pc: 

PC (pcalg) 
***********



.. list-table:: 

   * - Module name
     - `pcalg_pc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/pcalg_pc>`__
   * - Package
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
   * - Version
     - 2.7-8
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`__
   * - Paper
     - :footcite:t:`doi:10.1177/089443939100900106`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__, `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - :ref:`Yes <edge_constraints>`
   * - Data type
     - C, D
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/pcalg:2.7-8 <https://hub.docker.com/r/bpimages/pcalg/tags>`__




PC 
------


The Peter and Clark (PC) algorithm :footcite:t:`doi:10.1177/089443939100900106`, is a constraint based method
consisting of two main steps. The first step is called the adjacency search and amounts to
finding the undirected skeleton of the DAG. The second step amounts to estimating a CPDAG.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "pc-gaussCItest",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "NAdelete": true,
        "mmax": "Inf",
        "u2pd": "relaxed",
        "skelmethod": "stable",
        "conservative": false,
        "majrule": false,
        "solveconfl": false,
        "numCores": 1,
        "verbose": false,
        "indepTest": "gaussCItest",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      },
      {
        "id": "pc-binCItest",
        "alpha": [
          0.01,
          0.05,
          0.1
        ],
        "NAdelete": true,
        "mmax": "Inf",
        "u2pd": "relaxed",
        "skelmethod": "stable",
        "conservative": false,
        "majrule": false,
        "solveconfl": false,
        "numCores": 1,
        "verbose": false,
        "indepTest": "binCItest",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

