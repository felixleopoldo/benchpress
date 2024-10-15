

.. _pcalg_pc: 

pcalg_pc 
------------

.. rubric:: PC

.. list-table:: 

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
   * - Docker 
     - `bpimages/pcalg:2.7-8 <https://hub.docker.com/r/bpimages/pcalg/tags>`__

   * - Module folder
     - `pcalg_pc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/pcalg_pc>`__



.. rubric:: Description

The Peter and Clark (PC) algorithm :footcite:t:`doi:10.1177/089443939100900106`, is a constraint based method
consisting of two main steps. The first step is called the adjacency search and amounts to
finding the undirected skeleton of the DAG. The second step amounts to estimating a CPDAG.

.. rubric:: Adding Background Knowledge
pcalg_pc allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges`` and ``forbidden_edges``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

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

.. rubric:: Example edgeConstraints.json 

.. code-block:: json

    {
        "forbidden_edges": [["1", "2"], ["3", "4"]],
        "required_edges": [["2", "3"], ["4", "5"]]
    }

.. footbibliography::

