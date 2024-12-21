


:og:description: Graphical Lasso
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Graphical Lasso (GLasso)
 
.. meta::
    :title: Graphical Lasso 
    :description: Graphical Lasso


.. _sklearn_glasso: 

GLasso (scikit-learn) 
**********************



.. list-table:: 

   * - Module name
     - `sklearn_glasso <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/sklearn_glasso>`__
   * - Package
     - `scikit-learn <https://scikit-learn.org/0.22/>`__
   * - Version
     - 0.22.1
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://scikit-learn.org/0.22/modules/generated/sklearn.covariance.graphical_lasso.html?highlight=glasso>`__
   * - Paper
     - :footcite:t:`friedman2008sparse`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/datascience-python:1.1 <https://hub.docker.com/r/bpimages/datascience-python/tags>`__




Graphical Lasso 
-------------------




.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "sklearn_glasso",
        "mode": "cd",
        "alpha": [
          0.05
        ],
        "tol": 0.0004,
        "enet_tol": 0.0004,
        "precmat_threshold": 0.1,
        "max_iter": 100,
        "verbose": false,
        "assume_centered": false
      }
    ]

.. footbibliography::

