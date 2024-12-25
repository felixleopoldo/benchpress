


:og:description: Thresholding the estimated precision matrix. Assuming Gaussian data, absense of an edge between a pair of nodes corresponds to conditional independence given a separating set of nodes.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Precmat thresh (Benchpress)
 
.. meta::
    :title: Precmat thresh (Benchpress)
    :description: Thresholding the estimated precision matrix. Assuming Gaussian data, absense of an edge between a pair of nodes corresponds to conditional independence given a separating set of nodes.


.. _prec_thresh: 

Precmat thresh (Benchpress) 
****************************



.. list-table:: 

   * - Module name
     - `prec_thresh <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/prec_thresh>`__
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
   * - MCMC
     - No
   * - Edge constraints
     - No
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/datascience-python:1.1 <https://hub.docker.com/r/bpimages/datascience-python/tags>`__




Precmat thresh 
------------------


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

