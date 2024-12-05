


    .. meta::
        :title: Parallel DG 
        :keywords: causal discovery, causal discovery algorithm, Benchpress, graphical models, probabilistic graphical models, structure learning, benchmarking, graph estimation, graph learning, graph structure, structure learning algorithms, Parallel DG, parallelDG
    
    

.. _paralleldg: 

paralleldg 
--------------

.. rubric:: Parallel DG

.. list-table:: 

   * - Package
     - `parallelDG <https://github.com/melmasri/parallelDG>`__
   * - Version
     - 0.9.5
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://github.com/melmasri/parallelDG>`__
   * - Paper
     - :footcite:t:`https://doi.org/10.48550/arxiv.2209.02008`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `hallawalla/paralleldg:0.9.5 <https://hub.docker.com/r/hallawalla/paralleldg/tags>`__

   * - Module folder
     - `paralleldg <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/paralleldg>`__



.. rubric:: Description

Abstract: Bayesian inference for undirected graphical models is mostly restricted to
the class of decomposable graphs, as they enjoy a rich set of properties making them amenable to high-dimensional problems. While parameter inference is
straightforward in this setup, inferring the underlying graph is a challenge driven
by the computational difficultly in exploring the space of decomposable graphs.
This work makes two contributions to address this problem. First, we provide
sufficient and necessary conditions for when multi-edge perturbations maintain
decomposability of the graph. Using these, we characterize a simple class of
partitions that efficiently classify all edge perturbations by whether they maintain decomposability. Second, we propose a new parallel non-reversible Markov
chain Monte Carlo sampler for distributions over junction tree representations
of the graph, where at every step, all edge perturbations within a partition are
executed simultaneously. Through simulations, we demonstrate the efficiency of
our new edge perturbation conditions and class of partitions. We find that our
parallel sampler yields improved mixing properties in comparison to the single-
move variate, and outperforms current methods.

.. important:: 

  This module only works on the AMD64 architecture.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "pdg",
        "M": 10000,
        "R": [
          100,
          200
        ],
        "datatype": "continuous",
        "mcmc_seed": 1,
        "graph_prior": "uniform",
        "graph_prior_param": 1.0,
        "graph_prior_param1": 3.0,
        "pseudo_obs": 2,
        "delta": 5.0,
        "threshold": 0.5,
        "burnin_frac": 0.5,
        "mcmc_estimator": "map",
        "timeout": null,
        "parallel": true
      }
    ]

.. footbibliography::

