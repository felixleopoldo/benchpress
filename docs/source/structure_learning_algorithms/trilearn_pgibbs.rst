


    .. meta::
        :title: Particle Gibbs 
        :description: Abstract: We present a sequential sampling methodology for weakly structural Markov laws, arising naturally in a Bayesian structure learning context for decomposable graphical models. As a key component of our sug- gested approach, we show that the problem of graph estimation, which in general lacks natural sequential interpretation, can be recast into a sequential setting by proposing a recursive Feynman-Kac model that generates a ﬂow of junction tree distributions over a space of increasing dimensions. We focus on particle McMC methods to provide samples on this space, in particular on particle Gibbs (PG), as it allows for generating McMC chains with global moves on an underlying space of decomposable graphs. To further improve the PG mixing properties, we incorporate a systematic refreshment step implemented through direct sampling from a backward kernel. The theoretical properties of the algorithm are investigated, showing that the proposed refreshment step improves the performance in terms of asymptotic variance of the estimated distribution. The suggested sampling methodology is illustrated through a collection of numerical examples demonstrating high accuracy in Bayesian graph structure learning in both discrete and continuous graphical models.
    

.. _trilearn_pgibbs: 

trilearn_pgibbs 
-------------------

.. rubric:: Particle Gibbs

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 2.0.5
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`10.1214/19-EJS1585`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/trilearn:2.0.5 <https://hub.docker.com/r/bpimages/trilearn/tags>`__

   * - Module folder
     - `trilearn_pgibbs <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/trilearn_pgibbs>`__



.. rubric:: Description

Abstract: We present a sequential sampling methodology for weakly structural Markov laws, arising naturally in a Bayesian structure learning context for decomposable graphical models. As a key component of our sug-
gested approach, we show that the problem of graph estimation, which in
general lacks natural sequential interpretation, can be recast into a sequential setting by proposing a recursive Feynman-Kac model that generates
a ﬂow of junction tree distributions over a space of increasing dimensions.
We focus on particle McMC methods to provide samples on this space,
in particular on particle Gibbs (PG), as it allows for generating McMC
chains with global moves on an underlying space of decomposable graphs.
To further improve the PG mixing properties, we incorporate a systematic
refreshment step implemented through direct sampling from a backward
kernel. The theoretical properties of the algorithm are investigated, showing that the proposed refreshment step improves the performance in terms
of asymptotic variance of the estimated distribution. The suggested sampling methodology is illustrated through a collection of numerical examples
demonstrating high accuracy in Bayesian graph structure learning in both
discrete and continuous graphical models.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "trilearn-cont",
        "datatype": "continuous",
        "alpha": 0.5,
        "beta": 0.5,
        "radii": 80,
        "n_particles": 50,
        "M": 1000,
        "pseudo_obs": 1,
        "mcmc_seed": 1,
        "mcmc_estimator": "threshold",
        "threshold": [
          0.1,
          0.3,
          0.5,
          0.7,
          0.9,
          1.0
        ],
        "burnin_frac": 0.5,
        "timeout": null
      },
      {
        "id": "trilearn-disc",
        "datatype": "discrete",
        "alpha": 0.5,
        "beta": 0.5,
        "radii": 80,
        "n_particles": 50,
        "M": 1000,
        "pseudo_obs": 1,
        "mcmc_seed": 1,
        "mcmc_estimator": "threshold",
        "threshold": [
          0.1,
          0.3,
          0.5,
          0.7,
          0.9,
          1.0
        ],
        "burnin_frac": 0.5,
        "timeout": null
      }
    ]

.. footbibliography::

