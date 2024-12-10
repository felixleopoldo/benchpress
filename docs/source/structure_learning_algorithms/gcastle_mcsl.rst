


    .. meta::
        :title: MCSL 
        :description: A gradient-based algorithm for non-linear additive noise data by learning the binary adjacency matrix.
    

.. _gcastle_mcsl: 

gcastle_mcsl 
****************



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
     - :footcite:t:`doi:10.1137/1.9781611977172.48`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_mcsl <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_mcsl>`__



MCSL 
--------


A gradient-based algorithm for non-linear additive noise data by learning the binary adjacency matrix.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_mcsl",
        "model_type": "nn",
        "hidden_dim": 16,
        "graph_thresh": 0.5,
        "l1_graph_penalty": "2e-3",
        "learning_rate": "3e-2",
        "max_iter": 5,
        "iter_step": 100,
        "init_iter": 2,
        "h_tol": "1e-10",
        "init_rho": "1e-5",
        "rho_thresh": "1e14",
        "h_thresh": 0.25,
        "rho_multiply": 10,
        "temperature": 0.2,
        "device_type": "cpu",
        "device_ids": "0",
        "timeout": null
      }
    ]

.. footbibliography::

