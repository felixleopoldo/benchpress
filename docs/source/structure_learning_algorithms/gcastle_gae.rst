


    .. meta::
        :title: GAE 
        :description: A gradient-based algorithm using graph autoencoder to model non-linear causal relationships.
    

.. _gcastle_gae: 

gcastle_gae 
***************



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
     - :footcite:t:`https://doi.org/10.48550/arxiv.1911.07420`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_gae <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_gae>`__



GAE 
-------


A gradient-based algorithm using graph autoencoder to model non-linear causal relationships.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_gae",
        "x_dim": 1,
        "num_encoder_layers": 1,
        "num_decoder_layers": 1,
        "hidden_size": 4,
        "latent_dim": 1,
        "l1_graph_penalty": 0.0,
        "use_float64": false,
        "learning_rate": "1e-3",
        "max_iter": 10,
        "iter_step": 3000,
        "init_iter": 3,
        "h_tol": "1e-8",
        "init_rho": 1.0,
        "rho_thres": "1e+30",
        "h_thres": 0.25,
        "rho_multiply": 2.0,
        "early_stopping": false,
        "early_stopping_thres": 1.0,
        "graph_thres": 0.3,
        "timeout": null
      }
    ]

.. footbibliography::

