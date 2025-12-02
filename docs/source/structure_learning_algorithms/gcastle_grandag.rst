


:og:description: A gradient-based algorithm using neural network modeling for non-linear additive noise data.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: GraNDAG (gCastle)
 
.. meta::
    :title: GraNDAG (gCastle)
    :description: A gradient-based algorithm using neural network modeling for non-linear additive noise data.


.. _gcastle_grandag: 

GraNDAG (gCastle) 
******************



.. list-table:: 

   * - Module name
     - `gcastle_grandag <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_grandag>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-8>`__
   * - Paper
     - :footcite:t:`https://doi.org/10.48550/arxiv.1906.02226`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - No
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




Gradient-based Neural DAG Learner 
-------------------------------------


A gradient-based algorithm using neural network modeling for non-linear additive noise data.

.. rubric:: Example 

Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-apptainer --configfile config/gcastle.json

:numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with BOSS from TETRAD and BiDAG iterative search).
The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5). 
Each dataset contains 300 standardized samples. 
The SEM parameters are uniformly sampled from [0.25, 1].

.. _gcastleplot:

.. figure:: ../../../../../docs/source/_static/gcastle_benchmarks.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms
    :align: center

    FP/P vs. TP/P for gCastle algorithms.



.. rubric:: Example JSON


.. code-block:: json


    [
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
    ]

.. footbibliography::

