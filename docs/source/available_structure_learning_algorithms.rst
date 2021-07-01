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
        "id": "gobnilp",
        "plot": false,
        "palim": 2,
        "alpha": 1,
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
        "id": "asobs",
        "scorermethod": "is",
        "solvermethod": "asobs",
        "indeg": 80,
        "time": [
            20,
            60
        ],
        "allocated": 80,
        "scorefunction": "bdeu",
        "alpha": 1,
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
        "id": "tetrad_fges",
        "faithfulnessAssumed": true,
        "score": "bdeu-score",
        "datatype": "discrete",
        "samplePrior": [
                        1,
                        10,
                        50,
                        100
                    ],
        "structurePrior": 1
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
        "id": "tetrad_fci",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ],
        "test": "chi-square-test",
        "datatype": "discrete"
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
        "id": "tetrad_gfci",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "score": "bdeu-score",
        "test": "chi-square-test",
        "datatype": "discrete",
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
        "id": "tetrad_rfci",
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
        "id": "pcalg_pc",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
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

``bnlearn_mmhc``
-------------------

*Max-min hill-climbing* implementation in bnlearn R.

`https://www.bnlearn.com/ <https://www.bnlearn.com/>`_

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-max-min-hill-climbing-algorithm-mmhc.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "bnlearn_mmhc",
        "alpha": [
            0.01,
            0.05,
            0.1
        ],
        "test":"mi"
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
        "id": "bnlearn_interiamb",
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
        "id": "bnlearn_gs",
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
        "id": "bnlearn_tabu",
        "score": "bde",
        "iss": 1,
        "iss.mu": 1,
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
        "id": "itsearch_map",
        "estimate": "map",
        "MAP": true,
        "plus1it": null,
        "posterior": null,
        "scoretype": "bdecat",
        "chi": 0.5,
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
        "id": "order_mcmc_itmap",
        "startspace": "itsearch_map",
        "plus1": true,
        "scoretype": "bdecat",
        "chi": 1,
        "edgepf": 1,
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
            0.99,
            0.95,
            0.9,
            0.8,
            0.7,
            0.6,
            0.5,
            0.4,
            0.3,
            0.2
        ],
        "burnin": 0
    }