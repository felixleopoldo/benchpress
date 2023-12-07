

.. _gcastle_pc: 

gcastle_pc 
--------------

.. rubric:: PC

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
     - :footcite:t:`kalisch2007estimating`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_pc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_pc>`__



.. rubric:: Description

A classic causal discovery algorithm based on conditional independence tests.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_pc",
        "variant": "original",
        "alpha": 0.05,
        "ci_test": "fisherz",
        "timeout": null
      }
    ]

.. footbibliography::

