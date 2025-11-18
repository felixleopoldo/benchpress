


:og:description: Non-combinatorial Optimization via Trace Exponential and Augmented lagRangian for Structure learning
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: NO TEARS (gCastle)
 
.. meta::
    :title: NO TEARS (gCastle)
    :description: Non-combinatorial Optimization via Trace Exponential and Augmented lagRangian for Structure learning


.. _gcastle_notears: 

NO TEARS (gCastle) 
*******************



.. list-table:: 

   * - Module name
     - `gcastle_notears <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-10>`__
   * - Paper
     - :footcite:t:`NEURIPS2018_e347c514`
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
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




Non-combinatorial Optimization via Trace Exponential and Augmented lagRangian for Structure learning 
--------------------------------------------------------------------------------------------------------


This score-based method recasts the combinatorial problem of estimating a DAG into a purely
continuous non-convex optimization problem over real matrices with a smooth constraint to
ensure acyclicity.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_notears",
        "lambda1": 0.1,
        "loss_type": "l2",
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": [
          0.05,
          0.1,
          0.25
        ],
        "timeout": null
      }
    ]

.. footbibliography::

