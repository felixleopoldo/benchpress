


    .. meta::
        :title: Direct LINGAM 
        :keywords: causal discovery, causal discovery algorithm, Benchpress, graphical models, probabilistic graphical models, structure learning, benchmarking, graph estimation, graph learning, graph structure, structure learning algorithms, Direct LINGAM, gCastle
    
    

.. _gcastle_direct_lingam: 

gcastle_direct_lingam 
-------------------------

.. rubric:: Direct LINGAM

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
     - :footcite:t:`shimizu2011directlingam`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module folder
     - `gcastle_direct_lingam <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_direct_lingam>`__



.. rubric:: Description

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

