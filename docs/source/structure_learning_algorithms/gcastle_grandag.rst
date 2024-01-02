

.. _gcastle_grandag: 

gcastle_grandag 
-------------------

.. rubric:: GraNDAG

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
     - :footcite:t:`https://doi.org/10.48550/arxiv.1906.02226`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_grandag <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_grandag>`__



.. rubric:: Description

A gradient-based algorithm using neural network modeling for non-linear additive noise data.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_grandag",
        "hidden_num": 2,
        "hidden_dim": 10,
        "batch_size": 64,
        "lr": 0.001,
        "iterations": 1000,
        "model_name": "NonLinGaussANM",
        "nonlinear": "leaky-relu",
        "optimizer": "rmsprop",
        "h_threshold": "1e-8",
        "device_type": "cpu",
        "use_pns": false,
        "pns_thresh": 0.75,
        "num_neighbors": null,
        "normalize": false,
        "precision": false,
        "random_seed": 42,
        "jac_thresh": true,
        "lambda_init": 0.0,
        "mu_init": 0.001,
        "omega_lambda": 0.0001,
        "omega_mu": 0.9,
        "stop_crit_win": 100,
        "edge_clamp_range": 0.0001,
        "norm_prod": "paths",
        "square_prod": false,
        "timeout": null
      }
    ]

.. footbibliography::

