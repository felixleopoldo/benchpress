


:og:description: Ordering-based Reinforcement Learning
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Ordering-based Reinforcement Learning (CORL)
 
.. meta::
    :title: Ordering-based Reinforcement Learning 
    :description: Ordering-based Reinforcement Learning


.. _gcastle_corl: 

CORL (gCastle) 
***************



.. list-table:: 

   * - Module name
     - `gcastle_corl <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_corl>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`wang2021ordering`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




Ordering-based Reinforcement Learning 
-----------------------------------------


A RL- and order-based algorithm that improves the efficiency and scalability of previous RL-based approach.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_corl",
        "batch_size": 64,
        "input_dim": 100,
        "embed_dim": 256,
        "normalize": false,
        "encoder_name": "transformer",
        "encoder_heads": 8,
        "encoder_blocks": 3,
        "encoder_dropout_rate": 0.1,
        "decoder_name": "lstm",
        "reward_mode": "episodic",
        "reward_score_type": "BIC",
        "reward_regression_type": "LR",
        "reward_gpr_alpha": 1.0,
        "iteration": 10,
        "actor_lr": "1e-4",
        "critic_lr": "1e-3",
        "alpha": 0.99,
        "init_baseline": -1.0,
        "random_seed": 0,
        "device_type": "cpu",
        "device_ids": 0,
        "timeout": null
      }
    ]

.. footbibliography::

