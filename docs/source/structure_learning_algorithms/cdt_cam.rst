

.. _cdt_cam: 

cdt_cam 
-----------

.. rubric:: CAM

.. list-table:: 

   * - Package
     - `cdt <https://fentechsolutions.github.io/CausalDiscoveryToolbox/html/index.html>`__
   * - Version
     - 0.6.0
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://fentechsolutions.github.io/CausalDiscoveryToolbox/html/causality.html#cam>`__
   * - Paper
     - :footcite:t:`camBuhlmann2014`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `fentechai/cdt:0.6.0 <https://hub.docker.com/r/fentechai/cdt/tags>`__

   * - Module folder
     - `cdt_cam <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/cdt_cam>`__



.. rubric:: Description

Fits a causal additive model using the CAM algorithm.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "cdt_cam",
        "timeout": null,
        "score": "nonlinear",
        "cutoff": 0.001,
        "variablesel": true,
        "selmethod": "gamboost",
        "pruning": true,
        "prunmethod": "gam"
      }
    ]

.. footbibliography::

