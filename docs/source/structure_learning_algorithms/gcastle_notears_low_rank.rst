


:og:description: Adapting NOTEARS for large problems with low-rank causal graphs.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: NO TEARS low rank (gcastle_notears_low_rank)
 
.. meta::
    :title: NO TEARS low rank 
    :description: Adapting NOTEARS for large problems with low-rank causal graphs.


.. _gcastle_notears_low_rank: 

gcastle_notears_low_rank 
****************************



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
     - :footcite:t:`https://doi.org/10.48550/arxiv.2006.05691`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_notears_low_rank <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears_low_rank>`__



NO TEARS low rank 
---------------------


Adapting NOTEARS for large problems with low-rank causal graphs.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_notears_low_rank",
        "rank": 15,
        "w_init": null,
        "max_iter": 15,
        "h_tol": "1e-6",
        "rho_max": "1e+20",
        "w_threshold": 0.3,
        "timeout": null
      }
    ]

.. footbibliography::

