``structure_learning_algorithms``
==================================

For explanations of the parametrisations of each algorithm see the corresponding documentations.
However, some parametrers might be missing for some algorithms though.
Most of the parameters can be given as either a single value or a list.
To see which parameters are available review the JSON schemas.

.. note::
    
    Dots (.) in the original parameter names are omitted for implementational reasons.


``gobnilp``
------------

*GOBNILP C implementation (https://bitbucket.org/jamescussens/gobnilp/src/master/ commit #e60ef14).

`https://www.cs.york.ac.uk/aig/sw/gobnilp/ <https://www.cs.york.ac.uk/aig/sw/gobnilp/>`_


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-gobnilp-algorithm.md>`_


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

`https://cran.r-project.org/web/packages/r.blip/index.html <https://cran.r-project.org/web/packages/r.blip/index.html>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-blip-instantiation.md>`_


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

`https://github.com/jmoss20/notears <https://github.com/jmoss20/notears>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-notears.md>`_


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


`https://www.ccd.pitt.edu/ <https://www.ccd.pitt.edu/>`_

`https://bd2kccd.github.io/docs/causal-cmd/ <https://bd2kccd.github.io/docs/causal-cmd/>`_


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-fast-greedy-equivalent-search-tetrad_fges.md>`_


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


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-tetrad_fci.md>`_


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

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-tetrad_gfci-parameter-setting.md>`_


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


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-tetrad_rfci.md>`_


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

`https://cran.r-project.org/web/packages/pcalg/index.html <https://cran.r-project.org/web/packages/pcalg/index.html>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-pc-algorithm.md>`_


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

*Hill-climbing* implementation in bnlearn R.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-hill-climbing-algorithm-hc.md>`_


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

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-max-min-hill-climbing-algorithm-mmhc.md>`_


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


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-inter-iamb-algorithm.md>`_


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


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-tabu-search-parameter-setting.md>`_


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

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-iterative-search-paramter-setting.md>`_


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


See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-order-mcmc-paramter-setting--.md>`_


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