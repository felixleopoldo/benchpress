


:og:description: Greedy sparsest permutation
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Greedy sparsest permutation (GSP)
 
.. meta::
    :title: Greedy sparsest permutation 
    :description: Greedy sparsest permutation


.. _causaldag_gsp: 

GSP (CausalDAG) 
****************



.. list-table:: 

   * - Module name
     - `causaldag_gsp <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/causaldag_gsp>`__
   * - Package
     - `CausalDAG <https://github.com/uhlerlab/causaldag>`__
   * - Version
     - 0.1a163
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://uhlerlab.github.io/causaldag/>`__
   * - Paper
     - :footcite:t:`10.1093/biomet/asaa104`, :footcite:t:`squires2018causaldag`, :footcite:t:`https://doi.org/10.1002/sta4.183`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - No
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/causaldag:0.1a163 <https://hub.docker.com/r/bpimages/causaldag/tags>`__




Greedy sparsest permutation 
-------------------------------




.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gsp",
        "nruns": 5,
        "depth": 4,
        "verbose": true,
        "initial_undirected": "threshold",
        "use_lowest": true,
        "max_iters": "inf",
        "factor": 2,
        "progress_bar": false,
        "summarize": false,
        "alpha": [
          0.05,
          0.001
        ],
        "invert": true,
        "timeout": null
      }
    ]

.. footbibliography::

