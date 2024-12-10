


    .. meta::
        :title: Corrmat thresh 
        :description: Thresholding the estimated correlation matrix. Assuming Gaussian data, absense of an edge between a pair of nodes corresponds to marginal independence.
    

.. _corr_thresh: 

corr_thresh 
***************



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
     - :footcite:t:`lauritzen1996graphical`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/datascience-python:1.1 <https://hub.docker.com/r/bpimages/datascience-python/tags>`__

   * - Module folder
     - `corr_thresh <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/corr_thresh>`__



Corrmat thresh 
------------------


Thresholding the estimated correlation matrix.
Assuming Gaussian data, absense of an edge between a pair of nodes corresponds to marginal independence.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "ct",
        "thresh": 0.5,
        "timeout": null
      }
    ]

.. footbibliography::

