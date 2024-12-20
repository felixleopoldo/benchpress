


:og:description: A direct learning algorithm for linear non-Gaussian acyclic model (LiNGAM).
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Direct LINGAM (gcastle_direct_lingam)
 
.. meta::
    :title: Direct LINGAM 
    :description: A direct learning algorithm for linear non-Gaussian acyclic model (LiNGAM).


.. _gcastle_direct_lingam: 

Direct LINGAM (gCastle) 
************************



.. list-table:: 

   * - Module name
     - `gcastle_direct_lingam <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_direct_lingam>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`shimizu2011directlingam`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




Direct LINGAM 
-----------------


A direct learning algorithm for linear non-Gaussian acyclic model (LiNGAM).



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_direct_lingam",
        "measure": "pwling",
        "thresh": 0.3,
        "timeout": null
      }
    ]

.. footbibliography::

