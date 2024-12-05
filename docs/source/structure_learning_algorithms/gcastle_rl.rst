


    .. meta::
        :title: RL 
        :description: A RL-based algorithm that can work with flexible score functions (including non-smooth ones).
    

.. _gcastle_rl: 

gcastle_rl 
--------------

.. rubric:: RL

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
     - :footcite:t:`https://doi.org/10.48550/arxiv.1906.04477`, :footcite:t:`zhang2021gcastle`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_rl <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_rl>`__



.. rubric:: Description

A RL-based algorithm that can work with flexible score functions (including non-smooth ones).



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_rl",
        "encoder_type": "TransformerEncoder",
        "hidden_dim": 64,
        "num_heads": 16,
        "num_stacks": 6,
        "residual": false,
        "decoder_type": "SingleLayerDecoder",
        "decoder_activation": "tanh",
        "decoder_hidden_dim": 16,
        "use_bias": false,
        "use_bias_constant": false,
        "bias_initial_value": false,
        "batch_size": 64,
        "input_dimension": 64,
        "normalize": false,
        "transpose": false,
        "score_type": "BIC",
        "reg_type": "LR",
        "lambda_iter_num": 1000,
        "lambda_flag_default": true,
        "score_bd_tight": false,
        "lambda2_update": 10,
        "score_lower": 0.0,
        "score_upper": 0.0,
        "nb_epoch": 20,
        "lr1_start": 0.001,
        "lr1_decay_step": 5000,
        "lr1_decay_rate": 0.96,
        "alpha": 0.99,
        "init_baseline": -1.0,
        "l1_graph_reg": 0.0,
        "verbose": false,
        "device_type": "cpu",
        "device_ids": 0,
        "timeout": null
      }
    ]

.. footbibliography::

