


:og:description: Additive noise models for nonlinear causal discovery
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: ANMNonlinear (gCastle)
 
.. meta::
    :title: ANMNonlinear (gCastle)
    :description: Additive noise models for nonlinear causal discovery


.. _gcastle_anm: 

ANMNonlinear (gCastle) 
***********************



.. list-table:: 

   * - Module name
     - `gcastle_anm <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_anm>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-castle.algorithms>`__
   * - Paper
     - :footcite:t:`hoyer2008nonlinear`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - No
   * - Data type
     - C, D
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




ANMNonlinear 
----------------


Nonlinear causal discovery with additive noise models.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_anm",
        "alpha": 0.05,
        "timeout": null
      }
    ]

.. footbibliography::

