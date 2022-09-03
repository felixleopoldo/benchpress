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


``causaldag_gsp``
------------------


*Greedy Sparsest Permutations* (GSP) algorithm from the causalDAG package, `<https://uhlerlab.github.io/causaldag/>`_


.. rubric:: Example


.. code-block:: json

    {
        "id": "gsp",
        "nruns": 5,
        "depth": 4,
        "verbose": true,
        "initial_undirected": "threshold",
        "use_lowest": true,
        "max_iters": "inf",
        "factor": 2,
        "progress_bar": false,
        "summarize": false,
        "alpha":[0.05, 0.001],
        "invert": true,
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

``gcastle_pc``
-----------


*PC algorithm from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_pc",
        "variant": "original",
        "alpha": 0.05,
        "ci_test": "gauss",
        "timeout": null
    }

``gcastle_anm``
---------------------


*ANM from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_anm",
        "alpha": 0.05,
        "timeout": null
    }

``gcastle_direct_lingam``
--------------------------


*Direct lingam from the gCastle library*


.. rubric:: Example


.. code-block:: json

   {
        "id": "gcastle_direct_lingam",
        "measure": "pwling",
        "thresh": 0.3,
        "timeout": null
    }

``gcastle_ica_lingam``
-----------


*Ica lingam from the gCastle library*


.. rubric:: Example


.. code-block:: json

   {
        "id": "gcastle_ica_lingam",
        "thresh": 0.3,
        "random_state": null,
        "max_iter": 1000,                    
        "timeout": null
    }
                
                
``gcastle_notears_nonlinear``
-----------


*No tears non-linear from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_notears_mlp",
        "lambda1": 0.01,
        "lambda2": 0.01,
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.3,
        "hidden_layer": 1,
        "hidden_units": 10,
        "bias": true,
        "model_type": "mlp",
        "device_type": "cpu",
        "device_ids": null,
        "timeout": null
    }
    
.. code-block:: json
 
   {
        "id": "gcastle_notears_sob",
        "lambda1": 0.01,
        "lambda2": 0.01,
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.3,
        "hidden_layer": 1,
        "hidden_units": 10,
        "bias": true,
        "model_type": "sob",
        "device_type": "cpu",
        "device_ids": null,
        "timeout": null
    } 
    
``gcastle_notears_low_rank``
------------------------------


*No tears low-rank from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_notears_low_rank",
        "rank": 15,
        "w_init": null,
        "max_iter": 15,
        "h_tol": "1e-6",
        "rho_max": "1e+20",
        "w_threshold": 0.3,
        "timeout": null
    }


``gcastle_golem``
--------------------


*Golem from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_golem",
        "lambda_1": "2e-2",
        "lambda_2": 5.0,
        "equal_variances": true,
        "non_equal_variances": true,
        "learning_rate": "1e-3",
        "num_iter": "1e+5",
        "checkpoint_iter": 5000,
        "graph_thres": 0.3,
        "device_type": "cpu",
        "device_ids": 0,
        "timeout": null
    }


``gcastle_grandag``
---------------------


*GRANDAG from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_grandag",
        "hidden_num": 2,
        "hidden_dim": 10,
        "batch_size": 64,
        "lr": 0.001,
        "iterations": 1000,
        "model_name": "NonLinGaussANM",
        "nonlinear": "leaky-relu",
        "optimizer": "rmsprop",
        "h_threshold": "1e-8",
        "device_type": "cpu",
        "use_pns": false,
        "pns_thresh": 0.75,
        "num_neighbors": null,
        "normalize": false,
        "precision": false,
        "random_seed": 42,
        "jac_thresh": true,
        "lambda_init": 0.0,
        "mu_init": 0.001,
        "omega_lambda": 0.0001,
        "omega_mu": 0.9,
        "stop_crit_win": 100,
        "edge_clamp_range": 0.0001,
        "norm_prod": "paths",
        "square_prod": false,
        "timeout": null
    }

``gcastle_mcsl``
-------------------


*MCSL from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_mcsl",
        "model_type": "nn",
        "hidden_layers": 4,
        "hidden_dim": 16,
        "graph_thresh": 0.5,
        "l1_graph_penalty": "2e-3",
        "learning_rate": "3e-2",
        "max_iter": 5,
        "iter_step": 100,
        "init_iter": 2,
        "h_tol": "1e-10",
        "init_rho": "1e-5",
        "rho_thresh": "1e14",
        "h_thresh": 0.25,
        "rho_multiply": 10,
        "temperature": 0.2,
        "device_type": "cpu",
        "device_ids": "0",
        "timeout": null
    }

``gcastle_gae``
----------------


*GAE from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_gae",
        "x_dim": 1,
        "num_encoder_layers": 1,
        "num_decoder_layers": 1,
        "hidden_size": 4,
        "latent_dim": 1,
        "l1_graph_penalty": 0.0,
        "use_float64": false,
        "learning_rate": "1e-3",
        "max_iter": 10,
        "iter_step": 3000,
        "init_iter": 3,
        "h_tol": "1e-8",
        "init_rho": 1.0,
        "rho_thres": "1e+30",
        "h_thres": 0.25,
        "rho_multiply": 2.0,
        "early_stopping": false,
        "early_stopping_thres": 1.0,
        "graph_thres": 0.3,
        "timeout": null
     }

``gcastle_rl``
----------------


*RL from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_rl",
        "encoder_type": "TransformerEncoder",
        "hidden_dim": 64,
        "num_heads": 16,
        "num_stacks": 6,
        "residual": false,
        "decoder_type": "SingleLayerDecoder",
        "decoder_activation": "tanh",
        "decoder_hidden_dim": 16,
        "use_bias": false,
        "use_bias_constant": false,
        "bias_initial_value": false,
        "batch_size": 64,
        "input_dimension": 64,
        "normalize": false,
        "transpose": false,
        "score_type": "BIC",
        "reg_type": "LR",
        "lambda_iter_num": 1000,
        "lambda_flag_default": true,
        "score_bd_tight": false,
        "lambda1_update": 1.0,
        "lambda2_update": 10,
        "score_lower": 0.0,
        "score_upper": 0.0,
        "lambda2_lower": -1.0,
        "lambda2_upper": -1.0,
        "nb_epoch": 20,
        "lr1_start": 0.001,
        "lr1_decay_step": 5000,
        "lr1_decay_rate": 0.96,
        "alpha": 0.99,
        "init_baseline": -1.0,
        "temperature": 3.0,
        "C": 10.0,
        "l1_graph_reg": 0.0,
        "inference_mode": true,
        "verbose": false,
        "device_type": "cpu",
        "device_ids": 0,
        "timeout": null
    }
    


``gcastle_corl``
-------------------


*CORL from the gCastle library*


.. rubric:: Example


.. code-block:: json

    {
        "id": "gcastle_corl",
        "batch_size": 64,
        "input_dim": 100,
        "embed_dim": 256,
        "normalize": false,
        "encoder_name": "transformer",
        "encoder_heads": 8,
        "encoder_blocks": 3,
        "encoder_dropout_rate": 0.1,
        "decoder_name": "lstm",
        "reward_mode": "episodic",
        "reward_score_type": "BIC",
        "reward_regression_type": "LR",
        "reward_gpr_alpha": 1.0,
        "iteration": 10,
        "actor_lr": "1e-4",
        "critic_lr": "1e-3",
        "alpha": 0.99,
        "init_baseline": -1.0,
        "random_seed": 0,
        "device_type": "cpu",
        "device_ids": 0,
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
