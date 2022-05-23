``structure_learning_algorithms``
==================================

For explanations of the parametrisations of each algorithm see the documentation for the corresponding algorithms.
Most of the parameters can be given as either a single value or a list.
However, some parametrers might be missing for some algorithms, to see which parameters are available please review the JSON schema.
Dots (.) in the original parameter names are omitted for implementational reasons.

.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | Algorithm        | Graph | Language | Library                                                                                                                                      | Version  | JSON key/schema                                                                                                                                                                                        |
.. +==================+=======+==========+==============================================================================================================================================+==========+========================================================================================================================================================================================================+
.. | GOBNILP          | DAG   | C        | `GOBNILP <https://bitbucket.org/jamescussens/gobnilp/src/master/>`_                                                                          | #e60ef14 | `gobnilp <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gobnilp-algorithm.md>`_                                                                   |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | ASOBS            | DAG   | R/Java   | `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`_                                                                        | 1.1      | `rblip_asobs <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-blip-instantiation.md>`_                                                              |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | FGES             | CPDAG | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | `tetrad_fges <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-fast-greedy-equivalent-search-fges.md>`_                                              |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | FCI              | DAG   | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | `tetrad_fci <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-fci.md>`_                                                                              |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | RFCI             | CPDAG | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | `tetrad_rfci <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-rfci.md>`_                                                                            |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | GFCI             | DAG   | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | `tetrad_gfci <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gfci-parameter-setting.md>`_                                                          |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | PC               | CPDAG | R        | `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`_                                                                          | 2.7-3    | `pcalg_pc <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-pc-algorithm.md>`_                                                                       |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | No tears         | DAG   | Python   | `jmoss20/notears <https://github.com/jmoss20/notears>`_                                                                                      | #0c032a0 | `notears <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-notears.md>`_                                                                             |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | HC               | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.7      | `bnlearn_hc <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-hc-algorithm-parameter-setting.md>`_                                                   |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | MMHC             | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.7      | `bnlearn_mmhc <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-max-min-hill-climbing-algorithm-mmhc.md>`_                                           |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | Inter-IAMB       | CPDAG | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.7      | `bnlearn_interiamb <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-inter-iamb-algorithm.md>`_                                                      |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | GS               | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.7      | `bnlearn_gs <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-inter-iamb-algorithm.md>`_                                                             |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | Tabu             | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.7      | `bnlearn_tabu <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-tabu-search-parameter-setting.md>`_                                                  |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | Iterative MCMC   | DAG   | R        | `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_                                                                          | 2.0.3    | `bidag_itsearch <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-iterative-search-paramter-setting.md>`_                                            |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | Order MCMC       | DAG   | R        | `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_                                                                          | 2.0.3    | `bidag_order_mcmc <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-order-mcmc-parameter-setting.md>`_                                               |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | PGibbs           | DG    | Python   | `Trilearn <https://github.com/felixleopoldo/trilearn>`_                                                                                      | 1.2.3    | `trilearn_pgibbs <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-trilearn.md>`_                                                                    |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | GG99 single pair | DG    | Java     | A. Thomas                                                                                                                                    | -        | `gg99_singlepair <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions.md>`_ |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | GT13 multi pair  | DG    | Java     | A. Thomas                                                                                                                                    | -        | `gt13_multipair <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions.md>`_   |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
.. | GLasso           | UG    | Python   | `scikit-learn <https://scikit-learn.org/stable/modules/generated/sklearn.covariance.GraphicalLasso.html#sklearn.covariance.GraphicalLasso>`_ | 0.22.1   | `sklearn_glasso <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-glasso-algorithm.md>`_                                                             |
.. +------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

``gobnilp``
------------

*Globally optimal Bayesian network learning using integer linear programming (GOBNILP)*



.. important::

    GOBNILP uses SCIP optimization suite 7.0.1. From `SCIPs homepage <https://www.scipopt.org/index.php#license>`_:

    *SCIP is distributed under the ZIB Academic License. You are allowed to retrieve SCIP for research purposes as a member of a non-commercial or academic institution.*
    
    *If you want to use SCIP commercially or if you are interested in maintenance and support, please contact licenses@zib.de.*



.. rubric:: Example


.. code-block:: json

    {
        "id": "gobnilp-bde",
        "continuous": false,
        "score_type": "BDeu",
        "extra_args": null,
        "constraints": null,
        "plot": false,
        "palim": 3,
        "alpha_mu": null,
        "alpha_omega_minus_nvars": null,
        "alpha": [
            0.001,
            0.01,
            0.1
        ],
        "time_limit": null,
        "gap_limit": null,
        "prune": true,
        "timeout": null
    }

``rblip_asobs``
-----------


*Acyclic selection ordering-based search (ASOBS)*


.. rubric:: Example


.. code-block:: json

    {
        "id": "asobs-bdeu",
        "scorermethod": "is",
        "solvermethod": "asobs",
        "indeg": 80,
        "timeout": 180 ,
        "allocated": 80,
        "scorefunction": "bdeu",
        "alpha": [
            0.001,
            0.01,
            0.1
        ],
        "cores": 1,
        "verbose_level": 0
    }

``gcastle_notears``
-----------


*No tears from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_notears",
        "lambda1": 0.1,
        "loss_type": "l2",
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.5,
        "timeout": null
    }


``notears``
------------

*No tears from jmoss20 githib*


.. rubric:: Example


.. code-block:: json

    {
        "id": "notears",
        "min_rate_of_progress": 0.25,
        "penalty_growth_rate": 10,
        "optimation_accuracy": 0.00000001,
        "loss": "least_squares_loss",
        "loss_grad": "least_squares_loss_grad",
        "timeout": null
    }


``tetrad_fges``
----------------


*Fast greedy equivalence search* (FGES) 

.. rubric:: Example


.. code-block:: json
    
    {
        "id": "fges-sem-bic",
        "faithfulnessAssumed": true,
        "score": "sem-bic",
        "datatype": "continuous",
        "samplePrior": 1,
        "structurePrior": 1,
        "penaltyDiscount": [
            0.8,
            1,
            1.5
        ],
        "timeout": null
    }

``tetrad_fci``
---------------

*Fast causal inferece* (FCI) 

.. rubric:: Example


.. code-block:: json

    {
        "id": "fci-fisher-z",
        "alpha": [
            0.001,
            0.01,
            0.05
        ],
        "test": "fisher-z-test",
        "datatype": "continuous",
        "timeout": null
    }

``tetrad_gfci``
-----------------

*Greedy fast causal inference* (GFCI) 


.. rubric:: Example


.. code-block:: json

    {
        "id": "gfci-bdeu-chi-square",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "score": "bdeu-score",
        "test": "chi-square-test",
        "datatype": "discrete",
        "penaltyDiscount": null,
        "samplePrior": 1,
        "structurePrior": 1,
        "timeout": null
    }

``tetrad_rcfi``
----------------

*Really fast causal inference* (RFCI) 



.. rubric:: Example


.. code-block:: json

    {
        "id": "rfci-chi-square",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "chi-square-test",
        "datatype": "discrete",
        "timeout": null
    }

``pcalg_pc``
--------------

PC algorithm 


.. rubric:: Example


.. code-block:: json

    {
        "id": "pc-binCItest",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "NAdelete": true,
        "mmax": "Inf",
        "u2pd": "relaxed",
        "skelmethod": "stable",
        "conservative": false,
        "majrule": false,
        "solveconfl": false,
        "numCores": 1,
        "verbose": false,
        "indepTest": "binCItest",
        "timeout": null
    }

``bnlearn_hc``
-------------------

*Hill-climbing* 

.. rubric:: Example


.. code-block:: json

    {
        "id": "hc-bde",
        "score": "bde",
        "iss": [
            0.001,
            0.01,
            0.1
        ],
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "restart": 0,
        "perturb": 1,
        "timeout": null
    }

``bnlearn_mmhc``
-------------------

*Max-min hill-climbing* 

.. rubric:: Example


.. code-block:: json

    {
        "id": "mmhc-bde-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "score": "bde",
        "iss": 0.1,
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "timeout": null
    }

``bnlearn_interiamb``
------------------------

*Incremental association Markov blanket* (Inter-IAMB) 


.. rubric:: Example

An example


.. code-block:: json

    {
        "id": "interiamb-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }


``bnlearn_gs``
----------------

*Greedy search* (GS)

.. rubric:: Example


.. code-block:: json

    {
        "id": "gs-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_pcstable``
----------------

*Peter-Clark stable* (PC-stable)

.. rubric:: Example


.. code-block:: json

    {
        "id": "pcstable-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_iamb``
----------------

*IA Markov Blanket* (IAMB)

.. rubric:: Example


.. code-block:: json

    {
        "id": "iamb-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_fastiamb``
----------------

*Fast IAMB* (Fast IAMB)

.. rubric:: Example


.. code-block:: json

    {
        "id": "fastiamb-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_iambfdr``
----------------

*IAMG false discovery rate* (IAMB FDR)

.. rubric:: Example


.. code-block:: json

    {
        "id": "iambfdr-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_mmpc``
----------------

*Max-Min PC* (MMPC)

.. rubric:: Example


.. code-block:: json

    {
        "id": "mmpc-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_sihitonpc``
----------------

*SI Hiton PC* (GSI HITON PCS)

.. rubric:: Example


.. code-block:: json

    {
        "id": "sihitonpc-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_hpc``
----------------

*Hybrid PC* (HPC)

.. rubric:: Example


.. code-block:: json

    {
        "id": "hpc-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_h2pc``
----------------

*H2 PC* (H2 PC)

.. rubric:: Example


.. code-block:: json

    {
        "id": "h2pc-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_rsmax2``
----------------

*RSMAX2* (RSMAX2)

.. rubric:: Example


.. code-block:: json

    {
        "id": "rsmax2-mi",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
    }

``bnlearn_tabu``
------------------

*Tabu* 


.. rubric:: Example


.. code-block:: json

    {
        "id": "tabu-bde",
        "score": "bde",
        "iss": [
            0.001,
            0.01,
            0.1
        ],
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "timeout": null
    }

``guidice_dualpc``
------------------

*Dual PC* 


.. rubric:: Example


.. code-block:: json

    {
        "id": "dualpc",
        "alpha": [
            0.001,
            0.01,
            0.05,
            0.1
        ],
        "pattern_graph": false,
        "skeleton": false,
        "max_ord": null,
        "timeout": null
    }



``bidag_itsearch``
-------------------

*Iterative MCMC* 

.. rubric:: Example


.. code-block:: json

    {
        "id": "itsearch_sample-bde",
        "estimate": "map",
        "MAP": false,
        "plus1it": 6,
        "posterior": 0.5,
        "scoretype": "bde",
        "chi": [
            0.01,
            0.1,
            1
        ],
        "edgepf": 2,
        "am": null,
        "aw": null,
        "softlimit": 9,
        "hardlimit": 12,
        "alpha": 0.05,
        "gamma": 1,
        "cpdag": false,
        "mergetype": "skeleton",
        "timeout": null
    }

``bidag_order_mcmc``
-----------------------

*Order MCMC* 


.. rubric:: Example


.. code-block:: json

    {
        "id": "omcmc_itsample-bde",
        "plus1": true,
        "startspace_algorithm": "itsearch_sample-bde_chi01_endspace",
        "scoretype": "bde",
        "chi": [
            0.1
        ],
        "edgepf": 2,
        "aw": null,
        "am": null,
        "alpha": 0.05,
        "gamma": 1,
        "cpdag": false,
        "stepsave": null,
        "iterations": null,
        "MAP": true,
        "mcmc_seed": 1,
        "threshold": [
            0.5
        ],
        "burnin": 0,
        "timeout": null
    }

``bidag_partition_mcmc``
-----------------------

*Partition MCMC* 


.. rubric:: Example


.. code-block:: json

    {
        "id": "partition_itmap-bge",
        "startspace_algorithm": "itsearch_map-bge_am01_endspace",
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
        "burnin": 0
    }


``gg99_singlepair``
------------------------

MCMC algorithm for decomposable models [1]_.

.. rubric:: Example

.. code-block:: json

    {
        "id": "guidicigreen-cont",
        "n_samples": 1000000,
        "datatype": "continuous",
        "randomits": 1000,
        "prior": "bc",
        "ascore": 0.9,
        "bscore": 0.001,
        "clq": 2,
        "sep": 4,
        "penalty": 1.5,
        "mcmc_seed": 1,
        "timeout": null
    }

``gt13_multipair``
--------------------

MCMC algorithm for decomposable models [2]_.

.. rubric:: Example

.. code-block:: json

    {
        "id": "gt13_multipair_bc-cont",
        "n_samples": 1000000,
        "datatype": "continuous",
        "randomits": 1000,
        "prior": "bc",
        "ascore": 0.1,
        "bscore": 0.001,
        "clq": null,
        "sep": null,
        "penalty": null,
        "mcmc_seed": 1,
        "timeout": null
    }


``sklearn_glasso``
--------------------

Graphical lasso from scikit-learn.

.. rubric:: Example

.. code-block:: json

    {
        "id": "sklearn_glasso",
        "mode": "cd",
        "alpha": 0.05,
        "tol": 0.0004,
        "enet_tol": 0.0004,
        "precmat_threshold": 0.1,
        "max_iter": 100,
        "verbose": false,
        "assume_centered": false,
        "timeout": null
    }


.. [1] P. Giudici and P. J. Green. Decomposable graphical Gaussian model determination. Biometrika, 86(4):785–801, 1999.

.. [2] P. J. Green and A. Thomas. Sampling decomposable graphs using a Markov chain on junction trees. Biometrika, 100(1):91–110, 2013.