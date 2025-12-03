


:og:description: The proposed method generalizes the recent gradient-based methods to a graph autoencoder framework that allows nonlinear structural equation models and is easily applicable to vector-valued variables.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: GAE (gCastle)
 
.. meta::
    :title: GAE (gCastle)
    :description: The proposed method generalizes the recent gradient-based methods to a graph autoencoder framework that allows nonlinear structural equation models and is easily applicable to vector-valued variables.


.. _gcastle_gae: 

GAE (gCastle) 
**************



.. list-table:: 

   * - Module name
     - `gcastle_gae <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_gae>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-7>`__
   * - Paper
     - :footcite:t:`https://doi.org/10.48550/arxiv.1911.07420`
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




Graph Autoencoder 
---------------------


A gradient-based algorithm using graph autoencoder to model non-linear causal relationships.

.. rubric:: Example 

Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-apptainer --configfile config/gcastle.json

:numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`).
The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5). 
Each dataset contains 300 standardized samples. 
The SEM parameters are uniformly sampled from [0.25, 1].

.. _gcastleplot:

.. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms
    :align: center

    FP/P vs. TP/P for gCastle algorithms.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_gae",
        "input_dim": 1,
        "hidden_layers": 1,
        "hidden_dim": 4,
        "epochs": 10,
        "update_freq": 3000,
        "init_iter": 3,
        "lr": "1e-3",
        "alpha": 0.0,
        "beta": 2.0,
        "init_rho": 1.0,
        "rho_thresh": "1e+30",
        "gamma": 0.25,
        "penalty_lambda": 0.0,
        "h_thresh": 0.25,
        "graph_thresh": 0.3,
        "early_stopping": false,
        "early_stopping_thresh": 1.0,
        "device_type": "cpu",
        "device_ids": "0",
        "timeout": null
      }
    ]

.. footbibliography::

