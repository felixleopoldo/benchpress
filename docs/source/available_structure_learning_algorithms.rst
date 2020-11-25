structure_learning_algorithms
==============================


gobnilp
-------

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

blip
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-blip-instantiation.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "blip",
        "scorer.method": "is",
        "solver.method": "winasobs",
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

notears
-------

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

fges
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-fast-greedy-equivalent-search-fges.md>`_


.. rubric:: Example


.. code-block:: json
    
    {
        "id": "fges",
        "faithfulnessAssumed": true,
        "score": "bdeu-score",
        "data-type": "discrete"
    }

fci
---

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-fci.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "fci",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ],
        "test": "chi-square-test",
        "data-type": "discrete"
    }

gfci
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-gfci-parameter-setting.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "gfci",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ],
        "score": "bdeu-score",
        "test": "chi-square-test",
        "data-type": "discrete"
    }

rcfi
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-rfci.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "rfci",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ],
        "test": "chi-square-test",
        "data-type": "discrete"
    }

pcalg
-----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-pc-algorithm.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "pcalg",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ]
    }

mmhc
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-max-min-hill-climbing-algorithm-mmhc.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "mmhc",
        "plot_legend": "MMHC",
        "restrict.args": {
            "alpha": [
                0.01,
                0.05,
                0.1,
                0.2,
                0.35,
                0.45
            ]
        }
    }

h2pc
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-h2pc-algorithm.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "h2pc",
        "restrict.args": {
            "alpha": [
                0.01,
                0.05,
                0.1,
                0.2,
                0.35,
                0.45
            ]
        }
    }

interiamb
---------

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-inter-iamb-algorithm.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "interiamb",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ]
    }

gs
---

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-inter-iamb-algorithm.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "gs",
        "alpha": [
            0.01,
            0.05,
            0.1,
            0.2,
            0.35,
            0.45
        ]
    }

tabu
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-tabu-search-parameter-setting.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "tabu",
        "score": "bde",
        "iss": 1,
        "iss.mu": 1,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1
    }

h2pc
----

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-h2pc-algorithm.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "h2pc",
        "restrict.args": {
            "alpha": [
                0.01,
                0.05,
                0.1,
                0.2,
                0.35,
                0.45
            ]
        }
    }

itsearch
---------

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-iterative-search-paramter-setting.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "itsearch_map",
        "optional": {
            "MAP": true,
            "plus1it": null,
            "posterior": null,
            "scoretype": "bdecat",
            "chi": 0.5,
            "edgepf": 2,
            "am": null,
            "aw": null
        }
    }

order_mcmc
----------

See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-order-mcmc-paramter-setting--.md>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "order_mcmc_itmap",
        "startspace": "itsearch_map",
        "optional": {
            "plus1": true
        },
        "scoretype": "bdecat",
        "chi": 1,
        "edgepf": 1,
        "aw": null,
        "am": null,
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