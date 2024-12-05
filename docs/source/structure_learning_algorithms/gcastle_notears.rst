


    .. meta::
        :title: NO TEARS 
        :keywords: causal discovery, causal discovery algorithm, Benchpress, graphical models, probabilistic graphical models, structure learning, benchmarking, graph estimation, graph learning, graph structure, structure learning algorithms, NO TEARS, gCastle
    
    

.. _gcastle_notears: 

gcastle_notears 
-------------------

.. rubric:: NO TEARS

.. list-table:: 

   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`NEURIPS2018_e347c514`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_notears <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears>`__



.. rubric:: Description

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

