


:og:description: This technique relies on a Bayesian perspective on structure learning, where the score of a DAG is defined as its posterior distribution. To overcome the limitation of simple structure-based MCMC schemes, :footcite:t:`friedman2003being` turned to a score defined as the sum of the posterior scores of all DAG which are consistent with a given topological ordering of the nodes. One can then run a Metropolis-Hasting algorithm to sample from the distribution induced by the order score, and later draw a DAG consistent with the order. This strategy substantially improves convergence with respect to earlier structure MCMC scheme, though it unfortunately produces a biased sample on the space of DAGs. The implementation considered in Benchpress is a hybrid version with the sampling performed on a restricted search space initialised with constraint-based testing and improved with a score-based search :footcite:t:`doi:10.1080/10618600.2021.2020127`.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Order MCMC (Order MCMC)
 
.. meta::
    :title: Order MCMC 
    :description: This technique relies on a Bayesian perspective on structure learning, where the score of a DAG is defined as its posterior distribution. To overcome the limitation of simple structure-based MCMC schemes, :footcite:t:`friedman2003being` turned to a score defined as the sum of the posterior scores of all DAG which are consistent with a given topological ordering of the nodes. One can then run a Metropolis-Hasting algorithm to sample from the distribution induced by the order score, and later draw a DAG consistent with the order. This strategy substantially improves convergence with respect to earlier structure MCMC scheme, though it unfortunately produces a biased sample on the space of DAGs. The implementation considered in Benchpress is a hybrid version with the sampling performed on a restricted search space initialised with constraint-based testing and improved with a score-based search :footcite:t:`doi:10.1080/10618600.2021.2020127`.


.. _bidag_order_mcmc: 

Order MCMC (BiDAG) 
*******************



.. list-table:: 

   * - Module name
     - `bidag_order_mcmc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bidag_order_mcmc>`__
   * - Package
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
   * - Version
     - 2.1.4
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BiDAG/BiDAG.pdf>`__
   * - Paper
     - :footcite:t:`friedman2003being`, :footcite:t:`doi:10.1080/10618600.2021.2020127`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Data type
     - 
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/bidag:2.1.4 <https://hub.docker.com/r/bpimages/bidag/tags>`__




Order MCMC 
--------------


This technique relies on a Bayesian perspective on structure learning, where the score of a DAG
is defined as its posterior distribution. To overcome the limitation of simple structure-based
MCMC schemes, :footcite:t:`friedman2003being` turned to a score defined as the sum of the
posterior scores of all DAG which are consistent with a given topological ordering of the
nodes. One can then run a Metropolis-Hasting algorithm to sample from the distribution
induced by the order score, and later draw a DAG consistent with the order. This strategy
substantially improves convergence with respect to earlier structure MCMC scheme, though it
unfortunately produces a biased sample on the space of DAGs. The implementation considered
in Benchpress is a hybrid version with the sampling performed on a restricted search space
initialised with constraint-based testing and improved with a score-based search :footcite:t:`doi:10.1080/10618600.2021.2020127`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 
* ``input_algorithm_id`` Algorithm to use for initial search space. This should be the ID of another algorithm object. It corresponds to the original startspace parameter in the R package. 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "omcmc_itmap-bge",
        "input_algorithm_id": "itsearch_map-bge_am01_endspace",
        "plus1": true,
        "scoretype": "bge",
        "chi": null,
        "edgepf": null,
        "aw": null,
        "am": [
          0.01,
          0.1,
          0.05
        ],
        "alpha": 0.01,
        "gamma": 1,
        "stepsave": null,
        "iterations": null,
        "MAP": true,
        "cpdag": false,
        "timeout": null,
        "mcmc_seed": 1,
        "threshold": 0.5,
        "mcmc_estimator": "threshold",
        "burnin_frac": 0.5,
        "edgeConstraints": "edgeConstraints.json"
      },
      {
        "id": "omcmc_itmap-bde",
        "plus1": true,
        "input_algorithm": "itsearch_map-bde",
        "scoretype": "bde",
        "chi": [
          0.01,
          0.1,
          1,
          2
        ],
        "edgepf": 2,
        "aw": null,
        "am": null,
        "alpha": 0.05,
        "gamma": 1,
        "stepsave": null,
        "iterations": null,
        "MAP": true,
        "cpdag": false,
        "mcmc_seed": 1,
        "threshold": [
          0.5
        ],
        "burnin_frac": 0,
        "mcmc_estimator": "threshold",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

