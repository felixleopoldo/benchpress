

.. _gcastle_dag: 

gcastle_dag 
---------------

.. rubric:: gCastleDAG

.. list-table:: 

   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://github.com/huawei-noah/trustworthyAI/blob/master/gcastle/castle/datasets/simulator.py>`__
   * - Paper
     - :footcite:t:`zhang2021gcastle`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__

   * - Module
     - `gcastle_dag <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/gcastle_dag>`__



.. rubric:: Description

A graph (DAG) generation module from the gCastle package by :footcite:t:`zhang2021gcastle`. It allows to set the desired number of graph nodes (``n_nodes``) and edges (``n_edges``). Two types of simulated graph types (``method``) are available: Erdos-Renyi (er) and Scale-Free (sf).

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "er_10_10",
        "n_nodes": 10,
        "n_edges": 10,
        "method": "er"
      }
    ]

.. footbibliography::

