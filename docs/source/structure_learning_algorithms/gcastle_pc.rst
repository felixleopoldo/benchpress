


    .. meta::
        :title: PC 
        :description: A classic causal discovery algorithm based on conditional independence tests.
    

.. _gcastle_pc: 

gcastle_pc 
**************



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



PC 
------


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

