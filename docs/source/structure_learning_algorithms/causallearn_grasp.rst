


:og:description: Greedy relaxation of the sparsest permutation (GRaSP) algorithm.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Greedy relaxation of the sparsest permutation (GRaSP)
 
.. meta::
    :title: Greedy relaxation of the sparsest permutation 
    :description: Greedy relaxation of the sparsest permutation (GRaSP) algorithm.


.. _causallearn_grasp: 

GRaSP (causal-learn) 
*********************



.. list-table:: 

   * - Module name
     - `causallearn_grasp <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/causallearn_grasp>`__
   * - Package
     - `causal-learn <https://causal-learn.readthedocs.io/en/latest/index.html>`__
   * - Version
     - v0.1.3.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://causal-learn.readthedocs.io/en/latest/search_methods_index/Permutation-based%20causal%20discovery%20methods/GRaSP.html#id10>`__
   * - Paper
     - :footcite:t:`lam2022greedy`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
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
     - `bpimages/causal-learn:0.1.3.4 <https://hub.docker.com/r/bpimages/causal-learn/tags>`__




Greedy relaxation of the sparsest permutation 
-------------------------------------------------


Greedy relaxation of the sparsest permutation (GRaSP) algorithm.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "grasp",
        "maxP": 2,
        "timeout": null
      }
    ]

.. footbibliography::

