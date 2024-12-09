


    .. meta::
        :title: Precmat thresh 
        :keywords: causal discovery, causal discovery algorithm, Benchpress, graphical models, probabilistic graphical models, structure learning, benchmarking, graph estimation, graph learning, graph structure, structure learning algorithms, Precmat thresh, Benchpress
    
    

.. _prec_thresh: 

prec_thresh 
---------------

.. rubric:: Precmat thresh

.. list-table:: 

   * - Package
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
   * - Version
     - 
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/datascience-python:1.1 <https://hub.docker.com/r/bpimages/datascience-python/tags>`__

   * - Module folder
     - `prec_thresh <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/prec_thresh>`__



.. rubric:: Description

Thresholding the estimated precision matrix.
Assuming Gaussian data, absense of an edge between a pair of nodes corresponds to conditional independence given a separating set of nodes.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "pthresh",
        "thresh": 0.5,
        "timeout": null
      }
    ]

.. footbibliography::

