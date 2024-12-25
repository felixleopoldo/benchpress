


:og:description: 
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: NO TEARS non-linear (gCastle)
 
.. meta::
    :title: NO TEARS non-linear (gCastle)
    :description: 


.. _gcastle_notears_nonlinear: 

NO TEARS non-linear (gCastle) 
******************************



.. list-table:: 

   * - Module name
     - `gcastle_notears_nonlinear <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears_nonlinear>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`pmlr-v108-zheng20a`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - :ref:`Yes <edge_constraints>`
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




NO TEARS non-linear 
-----------------------




.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_notears_mlp",
        "lambda1": 0.01,
        "lambda2": 0.01,
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.3,
        "bias": true,
        "model_type": "mlp",
        "device_type": "cpu",
        "device_ids": null,
        "timeout": null
      },
      {
        "id": "gcastle_notears_sob",
        "lambda1": 0.01,
        "lambda2": 0.01,
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.3,
        "bias": true,
        "model_type": "sob",
        "device_type": "cpu",
        "device_ids": null,
        "timeout": null
      }
    ]

.. footbibliography::

