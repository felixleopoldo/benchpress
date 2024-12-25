


:og:description: Greedy relaxation of the sparsest permutation (GRaSP) algorithm.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: GRaSP (TETRAD)
 
.. meta::
    :title: GRaSP (TETRAD)
    :description: Greedy relaxation of the sparsest permutation (GRaSP) algorithm.


.. _tetrad_grasp: 

GRaSP (TETRAD) 
***************



.. list-table:: 

   * - Module name
     - `tetrad_grasp <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_grasp>`__
   * - Package
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.10.0
   * - Language
     - `Java <https://www.java.com/en/>`__
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - :footcite:t:`lam2022greedy`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - MCMC
     - No
   * - Edge constraints
     - :ref:`Yes <edge_constraints>`
   * - Data type
     - C, D
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__




Greedy relaxation of the sparsest permutation 
-------------------------------------------------


Greedy relaxation of the sparsest permutation (GRaSP) algorithm.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "grasp-bic",
        "score": "sem-bic-score",
        "datatype": "continuous",
        "test": "fisher-z-test",
        "samplePrior": null,
        "semBicStructurePrior": 1,
        "penaltyDiscount": [
          0.8,
          1,
          1.5
        ],
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      },
      {
        "id": "grasp-bdeu",
        "score": "bdeu-score",
        "test": "chi-square-test",
        "datatype": "discrete",
        "samplePrior": [
          1,
          10,
          20
        ],
        "semBicStructurePrior": null,
        "penaltyDiscount": null,
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

