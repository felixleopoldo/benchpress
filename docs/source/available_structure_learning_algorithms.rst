``structure_learning_algorithms``
==================================

For explanations of the parametrisations of each algorithm see the corresponding documentations.
However, some parametrers might be missing for some algorithms though.
Most of the parameters can be given as either a single value or a list.
To see which parameters are available review the JSON schemas.
Dots (.) in the original parameter names are omitted for implementational reasons.


+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Algorithm        | Graph | Language | Library                                                                                                                                      | Version  | JSON key          | JSON schema                                                                                                                                                                                 |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GOBNILP          | DAG   | C        | `GOBNILP <https://bitbucket.org/jamescussens/gobnilp/src/master/>`_                                                                          | #e60ef14 | gobnilp           | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gobnilp-algorithm.md>`_                                                           |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ASOBS            | DAG   | R/Java   | `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`_                                                                        | 1.1      | rblip_asobs       | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-blip-instantiation.md>`_                                                          |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FGES             | CPDAG | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | tetrad_fges       | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-fast-greedy-equivalent-search-fges.md>`_                                          |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FCI              | DAG   | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | tetrad_fci        | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-fci.md>`_                                                                         |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RFCI             | DAG   | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | tetrad_rfci       | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-rfci.md>`_                                                                        |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GFCI             | DAG   | Java     | `TETRAD (causal-cmd) <https://www.ccd.pitt.edu/data-science/>`_                                                                              | 1.1.3    | tetrad_gfci       | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gfci-parameter-setting.md>`_                                                      |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| PC               | CPDAG | R        | `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`_                                                                          | 2.6-10   | pcalg_pc          | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-pc-algorithm.md>`_                                                                |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| No tears         | DAG   | Python   | `jmoss20/notears <https://github.com/jmoss20/notears>`_                                                                                      | #0c032a0 | notears           | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-notears.md>`_                                                                     |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| HC               | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.5      | bnlearn_hc        | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-hc-algorithm-parameter-setting.md>`_                                              |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| MMHC             | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.5      | bnlearn_mmhc      | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-max-min-hill-climbing-algorithm-mmhc.md>`_                                        |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Inter-IAMB       | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.5      | bnlearn_interiamb | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-inter-iamb-algorithm.md>`_                                                        |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GS               | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.5      | bnlearn_gs        | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-inter-iamb-algorithm.md>`_                                                        |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Tabu             | DAG   | R        | `bnlearn <https://www.bnlearn.com/>`_                                                                                                        | 4.5      | bnlearn_tabu      | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-tabu-search-parameter-setting.md>`_                                               |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Iterative MCMC   | DAG   | R        | `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_                                                                          | 2.0.2    | bidag_itsearch    | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-iterative-search-paramter-setting.md>`_                                           |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Order MCMC       | DAG   | R        | `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_                                                                          | 2.0.2    | bidag_order_mcmc  | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-order-mcmc-parameter-setting.md>`_                                                |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| PGibbs           | DG    | Python   | `Trilearn <https://github.com/felixleopoldo/trilearn>`_                                                                                      | 1.2.3    | trilearn_pgibbs   | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-trilearn.md>`_                                                                    |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GG99 single pair | DG    | Java     | A. Thomas                                                                                                                                    | -        | gg99_singlepair   | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions.md>`_ |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GT13 multi pair  | DG    | Java     | A. Thomas                                                                                                                                    | -        | gt13_multipair    | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions.md>`_  |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GLasso           | UG    | Python   | `scikit-learn <https://scikit-learn.org/stable/modules/generated/sklearn.covariance.GraphicalLasso.html#sklearn.covariance.GraphicalLasso>`_ | 0.22.1   | sklearn_glasso    | `link <https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-glasso-algorithm.md>`_                                                            |
+------------------+-------+----------+----------------------------------------------------------------------------------------------------------------------------------------------+----------+-------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

``gobnilp``
------------

*GOBNILP C implementation (https://bitbucket.org/jamescussens/gobnilp/src/master/ commit #e60ef14).

`https://www.cs.york.ac.uk/aig/sw/gobnilp/ <https://www.cs.york.ac.uk/aig/sw/gobnilp/>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "gobnilp-bde",
        "continuous": false,
        "score_type": "BDeu",
        "plot": false,
        "palim": 3,
        "alpha_mu": null,
        "alpha_omega_minus_nvars": null,
        "alpha": [
            0.001,
            0.01,
            0.1
        ],
        "prune": true
    }

``rblip``
-----------

*r.blip v1.1* package in R.


.. rubric:: Example


.. code-block:: json

    {
        "id": "asobs-bdeu",
        "scorermethod": "is",
        "solvermethod": "asobs",
        "indeg": 80,
        "time": 180 ,
        "allocated": 80,
        "scorefunction": "bdeu",
        "alpha": [
            0.001,
            0.01,
            0.1
        ],
        "cores": 1,
        "verbose": 0
    }

``notears``
------------

*No tears* Python implementation.


.. rubric:: Example


.. code-block:: json

    {
        "id": "notears",
        "min_rate_of_progress": 0.25,
        "penalty_growth_rate": 10,
        "optimation_accuracy": 0.00000001,
        "loss": "least_squares_loss",
        "loss_grad": "least_squares_loss_grad"
    }


``tetrad_fges``
----------------


*Fast greedy equivalence search* (FGES) method from command line interface of *Tetrad (causal-cmd v1.1.3)*.



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
        ]
    }

``tetrad_fci``
---------------

*Fast causal inferece* (FCI) method from command line interface of *Tetrad (causal-cmd v1.1.3)*.

`https://www.ccd.pitt.edu/ <https://www.ccd.pitt.edu/>`_

`https://bd2kccd.github.io/docs/causal-cmd/ <https://bd2kccd.github.io/docs/causal-cmd/>`_



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
        "datatype": "continuous"
    }

``tetrad_gfci``
-----------------

*Greedy fast causal inference* (GFCI) method from command line interface of *Tetrad (causal-cmd v1.1.3)*.


`https://www.ccd.pitt.edu/ <https://www.ccd.pitt.edu/>`_

`https://bd2kccd.github.io/docs/causal-cmd/ <https://bd2kccd.github.io/docs/causal-cmd/>`_


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
        "structurePrior": 1
    }

``tetrad_rcfi``
----------------

*Re-sample fast causal inference* (RFCI) method from command line interface of Tetrad (causal-cmd v1.1.3).


`https://www.ccd.pitt.edu/ <https://www.ccd.pitt.edu/>`_

`https://bd2kccd.github.io/docs/causal-cmd/ <https://bd2kccd.github.io/docs/causal-cmd/>`_



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
        "datatype": "discrete"
    }

``pcalg_pc``
--------------

PC algorithm from the *pcalg v2.6-10* package R.


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
        "indepTest": "binCItest"
    }

``bnlearn_hc``
-------------------

*Hill-climbing* implementation in bnlearn 4.5  R.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_


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
        "perturb": 1
    }

``bnlearn_mmhc``
-------------------

*Max-min hill-climbing* implementation in bnlearn R.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_




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
        "beta": 1
    }

``bnlearn_interiamb``
------------------------

*Incremental association Markov blanket* (Inter-IAMB) from *bnlearn R*.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_



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
        "undirected": false
    }


``bnlearn_gs``
----------------

*Greedy search* (GS) from  *bnlearn R*.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-inter-iamb-algorithm.md>`_


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
        "undirected": false
    }

``bnlearn_tabu``
------------------

*Tabu* search from *bnlearn R*.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_



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
        "beta": 1
    }


``bidag_itsearch``
-------------------

*Iterative MCMC* implementation in *BiDAG v2.0.2 R*.

`https://cran.r-project.org/web/packages/BiDAG/index.html <https://cran.r-project.org/web/packages/BiDAG/index.html>`_


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
        "mergetype": "skeleton"
    }

``bidag_order_mcmc``
-----------------------

*Order MCMC* implementation in *BiDAG v2.0.2 R*.

`https://cran.r-project.org/web/packages/BiDAG/index.html <https://cran.r-project.org/web/packages/BiDAG/index.html>`_



.. rubric:: Example


.. code-block:: json

    {
        "id": "omcmc_itsample-bde",
        "startspace_algorithm": [
            "itsearch_sample-bde_chi01_endspace"
        ],
        "plus1": true,
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
        "burnin": 0
    }