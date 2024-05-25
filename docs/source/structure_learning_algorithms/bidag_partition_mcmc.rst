

.. _bidag_partition_mcmc: 

bidag_partition_mcmc 
------------------------

.. rubric:: Partition MCMC

.. list-table:: 

   * - Package
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
   * - Version
     - 2.1.4
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BiDAG/BiDAG.pdf>`__
   * - Paper
     - :footcite:t:`doi:10.1080/01621459.2015.1133426`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Docker 
     - `bpimages/bidag:2.1.4 <https://hub.docker.com/r/bpimages/bidag/tags>`__

   * - Module folder
     - `bidag_partition_mcmc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bidag_partition_mcmc>`__



.. rubric:: Description

Abstract: 
Acyclic digraphs are the underlying representation of Bayesian networks, a widely used class of probabilistic graphical models. Learning the underlying graph from data is a way of gaining insights about the structural properties of a domain. Structure learning forms one of the inference challenges of statistical graphical models. Markov chain Monte Carlo (MCMC) methods, notably structure MCMC, to sample graphs from the posterior distribution given the data are probably the only viable option for Bayesian model averaging. Score modularity and restrictions on the number of parents of each node allow the graphs to be grouped into larger collections, which can be scored as a whole to improve the chain’s convergence. Current examples of algorithms taking advantage of grouping are the biased order MCMC, which acts on the alternative space of permuted triangular matrices, and nonergodic edge reversal moves. Here, we propose a novel algorithm, which employs the underlying combinatorial structure of DAGs to define a new grouping. As a result convergence is improved compared to structure MCMC, while still retaining the property of producing an unbiased sample. Finally, the method can be combined with edge reversal moves to improve the sampler further. Supplementary materials for this article are available online.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "partition_itmap-bge",
        "input_algorithm_id": "itsearch_map-bge_am01_endspace",
        "verbose": true,
        "scoretype": "bge",
        "chi": null,
        "edgepf": null,
        "aw": null,
        "am": [
          0.01,
          0.1,
          0.05
        ],
        "gamma": 1,
        "stepsave": null,
        "iterations": null,
        "timeout": null,
        "mcmc_seed": 1,
        "threshold": 0.5,
        "mcmc_estimator": "threshold",
        "burnin_frac": 0.5
      },
      {
        "id": "partition_itmap-bde",
        "input_algorithm_id": "itsearch_map-bde_endspace",
        "verbose": true,
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
        "gamma": 1,
        "stepsave": null,
        "iterations": null,
        "timeout": null,
        "mcmc_seed": 1,
        "threshold": 0.5,
        "mcmc_estimator": "threshold",
        "burnin_frac": 0.5
      }
    ]

.. footbibliography::

