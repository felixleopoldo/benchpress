


    .. meta::
        :title: GOLEM 
        :description: A more efficient version of NOTEARS that can reduce number of optimization iterations.
    

.. _gcastle_golem: 

gcastle_golem 
-----------------

.. rubric:: GOLEM

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
     - :footcite:t:`NEURIPS2020_d04d42cd`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_golem <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_golem>`__



.. rubric:: Description

A more efficient version of NOTEARS that can reduce number of optimization iterations.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_golem",
        "lambda_1": "2e-2",
        "lambda_2": 5.0,
        "equal_variances": true,
        "non_equal_variances": true,
        "learning_rate": "1e-3",
        "num_iter": "1e+5",
        "checkpoint_iter": 5000,
        "graph_thres": 0.3,
        "device_type": "cpu",
        "device_ids": 0,
        "timeout": null
      }
    ]

.. footbibliography::

