``structure_learning_algorithms``
=======================================

For explanations of the parametrisations of each algorithm see the documentation for the corresponding algorithms.
Most of the parameters can be given as either a single value or a list.
However, some parametrers might be missing for some algorithms, to see which parameters are available please review the JSON schema.
Dots (.) in the original parameter names are omitted for implementational reasons.

.. list-table:: 
   :header-rows: 1 

   * - Algorithm
     - Graph
     - Package
     - Module
   * - BDgraph
     - UG
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - bdgraph_ 
   * - Iterative MCMC
     - DAG, CPDAG
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - bidag_itsearch_ 
   * - Order MCMC
     - DAG, CPDAG
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - bidag_order_mcmc_ 
   * - Partition MCMC
     - DAG, CPDAG
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - bidag_partition_mcmc_ 
   * - Fast IAMB
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_fastiamb_ 
   * - Grow-shrink
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_gs_ 
   * - H2PC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_h2pc_ 
   * - HC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_hc_ 
   * - HPC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_hpc_ 
   * - IAMB
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_iamb_ 
   * - IAMB-FDR
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_iambfdr_ 
   * - INTER-IAMB
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_interiamb_ 
   * - MMHC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_mmhc_ 
   * - MMPC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_mmpc_ 
   * - PC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_pcstable_ 
   * - RSMAX2
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_rsmax2_ 
   * - S-I HITON-PC
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_sihitonpc_ 
   * - Tabu
     - DAG
     - `bnlearn <https://www.bnlearn.com/>`__
     - bnlearn_tabu_ 
   * - GSP
     - DAG
     - `CausalDAG <https://github.com/uhlerlab/causaldag>`__
     - causaldag_gsp_ 
   * - Dual PC
     - CG, CPDAG
     - `dualPC <https://github.com/enricogiudice/dualPC>`__
     - dualpc_ 
   * - ANM
     - DAG
     - `gCastle <http>`__
     - gcastle_anm_ 
   * - CORL
     - DAG
     - `gCastle <http>`__
     - gcastle_corl_ 
   * - Direct LINGAM
     - DAG
     - `gCastle <http>`__
     - gcastle_direct_lingam_ 
   * - GAE
     - DAG
     - `gCastle <http>`__
     - gcastle_gae_ 
   * - GOLEM
     - DAG
     - `gCastle <http>`__
     - gcastle_golem_ 
   * - GraNDAG
     - DAG
     - `gCastle <http>`__
     - gcastle_grandag_ 
   * - ICALiNGAM
     - DAG
     - `gCastle <http>`__
     - gcastle_ica_lingam_ 
   * - MCSL
     - DAG
     - `gCastle <http>`__
     - gcastle_mcsl_ 
   * - NO TEARS
     - DAG
     - `gCastle <http>`__
     - gcastle_notears_ 
   * - NO TEARS low rank
     - DAG
     - `gCastle <http>`__
     - gcastle_notears_low_rank_ 
   * - NO TEARS non-linear
     - DAG
     - `gCastle <http>`__
     - gcastle_notears_nonlinear_ 
   * - PC
     - DAG
     - `gCastle <http>`__
     - gcastle_pc_ 
   * - RL
     - DAG
     - `gCastle <http>`__
     - gcastle_rl_ 
   * - GG99
     - DG
     - 
     - gg99_singlepair_ 
   * - GOBNILP
     - DAG
     - `GOBNILP (BitBucket) <https://bitbucket.org/jamescussens/gobnilp>`__
     - gobnilp_ 
   * - GT13
     - DG
     - 
     - gt13_multipair_ 
   * - Parallel DG
     - DG
     - `parallelDG <https://github.com/melmasri/parallelDG>`__
     - parallelDG_ 
   * - PC
     - CPDAG, CG
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - pcalg_pc_ 
   * - ASOBS
     - DAG
     - `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`__
     - rblip_asobs_ 
   * - Graphical Lasso
     - UG
     - `scikit-learn <https://scikit-learn.org/0.22/>`__
     - sklearn_glasso_ 
   * - FAS
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_fas_ 
   * - FASK
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_fask_ 
   * - GFCI
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_fci_ 
   * - FGES
     - CPDAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_fges_ 
   * - FOFC
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_fofc_ 
   * - FTFC
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_ftfc_ 
   * - GFCI
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_gfci_ 
   * - IMGSCONT
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_imgscont_ 
   * - LINGAM
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_lingam_ 
   * - PC-ALL
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_pc-all_ 
   * - RFCI
     - DAG
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - tetrad_rfci_ 
   * - Particle Gibbs
     - DG
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - trilearn_pgibbs_ 





``bdgraph`` 
-----------

.. rubric:: BDgraph

.. list-table:: 

   * - Package
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
   * - Version
     - 2.64
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BDgraph/BDgraph.pdf>`__
   * - Paper
     - `BDgraph: An R Package for Bayesian Structure Learning in Graphical Models <https://www.jstatsoft.org/article/view/v089i03>`_
   * - Graph type
     - UG
   * - Docker 
     - `onceltuca/bdgraph:2.64 <https://hub.docker.com/r/onceltuca/bdgraph/tags>`__

   * - Module
     - `bdgraph/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bdgraph>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "bdgraph",
        "method": "ggm",
        "algorithm": "bdmcmc",
        "iter": 1000,
        "gprior": 0.5,
        "dfprior": 3,
        "gstart": "empty",
        "timeout": null,
        "mcmc_seed": 1,
        "thresh": 0.5,
        "burnin": 0
      }
    ]

``bidag_itsearch`` 
------------------

.. rubric:: Iterative MCMC

.. list-table:: 

   * - Package
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
   * - Version
     - 2.0.3
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BiDAG/BiDAG.pdf>`__
   * - Paper
     - `Jack Kuipers, Polina Suter & Giusi Moffa (2022). Efficient Sampling and Structure Learning of Bayesian Networks <https://www.tandfonline.com/doi/full/10.1080/10618600.2021.2020127>`_
   * - Graph type
     - DAG, CPDAG
   * - Docker 
     - `onceltuca/bidag:2.0.3 <https://hub.docker.com/r/onceltuca/bidag/tags>`__

   * - Module
     - `bidag_itsearch/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bidag_itsearch>`__



.. rubric:: Description

This is a hybrid score-based optimisation technique based on Markov chain Monte Carlo
schemes (Suter et al. 2021; Kuipers et al. 2021). The algorithm starts from a skeleton obtained
through a fast method (e.g. a constraint based method, or GES). Then it performs score and
search on the DAGs belonging to the space defined by the starting skeleton. To correct for
edges which may be missed, the search space is iteratively expanded to include one additional
parent for each variable from outside the current search space. The score and search phase relies
on an MCMC scheme producing a chain of DAGs from their posterior probability given the data

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "itsearch_map-bge",
        "estimate": "map",
        "MAP": true,
        "plus1it": null,
        "posterior": null,
        "scoretype": "bge",
        "chi": null,
        "edgepf": null,
        "am": [
          0.000248,
          0.0223,
          0.1,
          0.448,
          0.739
        ],
        "aw": null,
        "softlimit": 9,
        "hardlimit": 15,
        "alpha": 0.05,
        "gamma": 1,
        "cpdag": false,
        "mergetype": "skeleton",
        "timeout": null
      }
    ]

``bidag_order_mcmc`` 
--------------------

.. rubric:: Order MCMC

.. list-table:: 

   * - Package
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
   * - Version
     - 2.0.3
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BiDAG/BiDAG.pdf>`__
   * - Paper
     - `Jack Kuipers, Polina Suter & Giusi Moffa (2022). Efficient Sampling and Structure Learning of Bayesian Networks <https://www.tandfonline.com/doi/full/10.1080/10618600.2021.2020127>`_
   * - Graph type
     - DAG, CPDAG
   * - Docker 
     - `onceltuca/bidag:2.0.3 <https://hub.docker.com/r/onceltuca/bidag/tags>`__

   * - Module
     - `bidag_order_mcmc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bidag_order_mcmc>`__



.. rubric:: Description

This technique relies on a Bayesian perspective on structure learning, where the score of a DAG
is defined as its posterior distribution. To overcome the limitation of simple structure-based
MCMC schemes, Friedman and Koller (2003) turned to a score defined as the sum of the
posterior scores of all DAG which are consistent with a given topological ordering of the
nodes. One can then run a Metropolis-Hasting algorithm to sample from the distribution
induced by the order score, and later draw a DAG consistent with the order. This strategy
substantially improves convergence with respect to earlier structure MCMC scheme, though it
unfortunately produces a biased sample on the space of DAGs. The implementation considered
in Benchpress is a hybrid version with the sampling performed on a restricted search space
initialised with constraint-based testing and improved with a score-based search (Kuipers et al.
2021).

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "omcmc_itmap-bge",
        "startspace_algorithm": "itsearch_map-bge_am01_endspace",
        "plus1": true,
        "scoretype": "bge",
        "chi": null,
        "edgepf": null,
        "aw": null,
        "am": [
          0.01,
          0.1,
          0.05
        ],
        "alpha": 0.01,
        "gamma": 1,
        "stepsave": null,
        "iterations": null,
        "MAP": true,
        "cpdag": false,
        "timeout": null,
        "mcmc_seed": 1,
        "threshold": 0.5,
        "mcmc_estimator": "threshold",
        "burnin_frac": 0.5
      }
    ]

``bidag_partition_mcmc`` 
------------------------

.. rubric:: Partition MCMC

.. list-table:: 

   * - Package
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
   * - Version
     - 2.0.3
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BiDAG/BiDAG.pdf>`__
   * - Paper
     - `Jack Kuipers & Giusi Moffa (2015). Partition MCMC for Inference on Acyclic Digraphs <https://www.tandfonline.com/doi/full/10.1080/01621459.2015.1133426>`_
   * - Graph type
     - DAG, CPDAG
   * - Docker 
     - `onceltuca/bidag:2.0.3 <https://hub.docker.com/r/onceltuca/bidag/tags>`__

   * - Module
     - `bidag_partition_mcmc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bidag_partition_mcmc>`__



.. rubric:: Description

Abstract: 
Acyclic digraphs are the underlying representation of Bayesian networks, a widely used class of probabilistic graphical models. Learning the underlying graph from data is a way of gaining insights about the structural properties of a domain. Structure learning forms one of the inference challenges of statistical graphical models. Markov chain Monte Carlo (MCMC) methods, notably structure MCMC, to sample graphs from the posterior distribution given the data are probably the only viable option for Bayesian model averaging. Score modularity and restrictions on the number of parents of each node allow the graphs to be grouped into larger collections, which can be scored as a whole to improve the chain’s convergence. Current examples of algorithms taking advantage of grouping are the biased order MCMC, which acts on the alternative space of permuted triangular matrices, and nonergodic edge reversal moves. Here, we propose a novel algorithm, which employs the underlying combinatorial structure of DAGs to define a new grouping. As a result convergence is improved compared to structure MCMC, while still retaining the property of producing an unbiased sample. Finally, the method can be combined with edge reversal moves to improve the sampler further. Supplementary materials for this article are available online.

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``bnlearn_fastiamb`` 
--------------------

.. rubric:: Fast IAMB

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - `Margaritis D (2003). Learning Bayesian network model structure from data. <https://apps.dtic.mil/sti/pdfs/ADA461103.pdf>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_fastiamb/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_fastiamb>`__



.. rubric:: Description

Fast incremental association Markov blanket

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "fastiamb-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_gs`` 
--------------

.. rubric:: Grow-shrink

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - `Tsamardinos, I., Aliferis, C. F., Statnikov, A. R., & Statnikov, E. (2003). Algorithms for large scale Markov blanket discovery <https://www.aaai.org/Papers/FLAIRS/2003/Flairs03-073.pdf?ref=https://githubhelp.com>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_gs/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_gs>`__



.. rubric:: Description

The grow-shrink (GS) algorithm is based on the Markov blanket of the nodes in a DAG. For
a specific node, the Markov blanket it the set of nodes which conditioning upon renders it
conditionally independent from all other variables (Margaritis 2003). It is a constraint-based
method which estimates the Markov blanket of a node in a two-stage forward-backward proce-
dure using conditional independence tests. The Markov blankets are used to first estimate an
undirected graph and then estimate a DAG in a four-step procedure.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gs-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_h2pc`` 
----------------

.. rubric:: H2PC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_h2pc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_h2pc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "h2pc-bge-zf",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "score": "bge",
        "test": "zf",
        "iss": 1,
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": null,
        "timeout": null
      }
    ]

``bnlearn_hc`` 
--------------

.. rubric:: HC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_hc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_hc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "hc-bge",
        "score": "bge",
        "iss": 1,
        "issmu": [
          0.0001,
          0.001,
          0.01,
          0.05
        ],
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "restart": 0,
        "perturb": 1,
        "timeout": null
      }
    ]

``bnlearn_hpc`` 
---------------

.. rubric:: HPC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_hpc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_hpc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "hpc-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_iamb`` 
----------------

.. rubric:: IAMB

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_iamb/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_iamb>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "iamb-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_iambfdr`` 
-------------------

.. rubric:: IAMB-FDR

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_iambfdr/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_iambfdr>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "iambfdr-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_interiamb`` 
---------------------

.. rubric:: INTER-IAMB

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_interiamb/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_interiamb>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "interiamb-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_mmhc`` 
----------------

.. rubric:: MMHC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_mmhc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_mmhc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "mmhc-bge-zf",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "score": "bge",
        "test": "zf",
        "iss": 1,
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": null,
        "timeout": null
      }
    ]

``bnlearn_mmpc`` 
----------------

.. rubric:: MMPC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_mmpc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_mmpc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "mmpc-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_pcstable`` 
--------------------

.. rubric:: PC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_pcstable/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_pcstable>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "pcstable-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_rsmax2`` 
------------------

.. rubric:: RSMAX2

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_rsmax2/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_rsmax2>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "rsmax2-bge-zf",
        "restrict": "si.hiton.pc",
        "maximize": "hc",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "score": "bge",
        "test": "zf",
        "iss": 1,
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": null,
        "timeout": null
      }
    ]

``bnlearn_sihitonpc`` 
---------------------

.. rubric:: S-I HITON-PC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_sihitonpc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_sihitonpc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "sihitonpc-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null
      }
    ]

``bnlearn_tabu`` 
----------------

.. rubric:: Tabu

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.7
   * - Language
     - R
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/bnlearn:4.7 <https://hub.docker.com/r/onceltuca/bnlearn/tags>`__

   * - Module
     - `bnlearn_tabu/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_tabu>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "tabu-bge",
        "score": "bge",
        "iss": 1,
        "issmu": [
          0.0001,
          0.001,
          0.01,
          0.05
        ],
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "timeout": null
      }
    ]

``causaldag_gsp`` 
-----------------

.. rubric:: GSP

.. list-table:: 

   * - Package
     - `CausalDAG <https://github.com/uhlerlab/causaldag>`__
   * - Version
     - 0.1a163
   * - Language
     - Python
   * - Docs
     - `here <https://uhlerlab.github.io/causaldag/>`__
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causaldag:0.1a163 <https://hub.docker.com/r/onceltuca/causaldag/tags>`__

   * - Module
     - `causaldag_gsp/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/causaldag_gsp>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
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
        "alpha": [
          0.05,
          0.001
        ],
        "invert": true,
        "timeout": null
      }
    ]

``dualpc`` 
----------

.. rubric:: Dual PC

.. list-table:: 

   * - Package
     - `dualPC <https://github.com/enricogiudice/dualPC>`__
   * - Version
     - 
   * - Language
     - R
   * - Docs
     - 
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - CG, CPDAG
   * - Docker 
     - `onceltuca/dualpc:latest <https://hub.docker.com/r/onceltuca/dualpc/tags>`__

   * - Module
     - `dualpc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/dualpc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "dualpc",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "skeleton": false,
        "max_ord": null,
        "timeout": null
      }
    ]

``gcastle_anm`` 
---------------

.. rubric:: ANM

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Patrik O. Hoyer et al. (2008). Nonlinear causal discovery with additive noise models. <https://webdav.tuebingen.mpg.de/causality/NIPS2008-Hoyer.pdf>`_,      - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_anm/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_anm>`__



.. rubric:: Description

Nonlinear causal discovery with additive noise models.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gcastle_anm",
        "alpha": 0.05,
        "timeout": null
      }
    ]

``gcastle_corl`` 
----------------

.. rubric:: CORL

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_corl/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_corl>`__



.. rubric:: Description

A RL- and order-based algorithm that improves the efficiency and scalability of previous RL-based approach.

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gcastle_direct_lingam`` 
-------------------------

.. rubric:: Direct LINGAM

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_direct_lingam/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_direct_lingam>`__



.. rubric:: Description

A direct learning algorithm for linear non-Gaussian acyclic model (LiNGAM).

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gcastle_direct_lingam",
        "measure": "pwling",
        "thresh": 0.3,
        "timeout": null
      }
    ]

``gcastle_gae`` 
---------------

.. rubric:: GAE

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_gae/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_gae>`__



.. rubric:: Description

A gradient-based algorithm using graph autoencoder to model non-linear causal relationships.

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gcastle_golem`` 
-----------------

.. rubric:: GOLEM

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_golem/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_golem>`__



.. rubric:: Description

A more efficient version of NOTEARS that can reduce number of optimization iterations.

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gcastle_grandag`` 
-------------------

.. rubric:: GraNDAG

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_grandag/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_grandag>`__



.. rubric:: Description

A gradient-based algorithm using neural network modeling for non-linear additive noise data.

.. rubric:: Example


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

``gcastle_ica_lingam`` 
----------------------

.. rubric:: ICALiNGAM

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_ica_lingam/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_ica_lingam>`__



.. rubric:: Description

An ICA-based learning algorithm for linear non-Gaussian acyclic model (LiNGAM).

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gcastle_direct_lingam",
        "measure": "pwling",
        "thresh": 0.3,
        "timeout": null
      }
    ]

``gcastle_mcsl`` 
----------------

.. rubric:: MCSL

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_mcsl/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_mcsl>`__



.. rubric:: Description

A gradient-based algorithm for non-linear additive noise data by learning the binary adjacency matrix.

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gcastle_notears`` 
-------------------

.. rubric:: NO TEARS

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_notears/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears>`__



.. rubric:: Description

A gradient-based algorithm for linear data models (typically with least-squares loss).

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gcastle_notears_low_rank`` 
----------------------------

.. rubric:: NO TEARS low rank

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_notears_low_rank/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears_low_rank>`__



.. rubric:: Description

Adapting NOTEARS for large problems with low-rank causal graphs.

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gcastle_notears_nonlinear`` 
-----------------------------

.. rubric:: NO TEARS non-linear

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_notears_nonlinear/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears_nonlinear>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
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
      },
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
    ]

``gcastle_pc`` 
--------------

.. rubric:: PC

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_pc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_pc>`__



.. rubric:: Description

A classic causal discovery algorithm based on conditional independence tests.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gcastle_pc",
        "variant": "original",
        "alpha": 0.05,
        "ci_test": "gauss",
        "timeout": null
      }
    ]

``gcastle_rl`` 
--------------

.. rubric:: RL

.. list-table:: 

   * - Package
     - `gCastle <http>`__
   * - Version
     - 1.0.3
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - `Keli Zhang, Shengyu Zhu, Marcus Kalander, Ignavier Ng, Junjian Ye, Zhitang Chen, Lujia Pan (2021). gCastle: A Python Toolbox for Causal Discovery. <https://arxiv.org/abs/2111.15155>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gcastle:1.0.3 <https://hub.docker.com/r/onceltuca/gcastle/tags>`__

   * - Module
     - `gcastle_rl/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_rl>`__



.. rubric:: Description

A RL-based algorithm that can work with flexible score functions (including non-smooth ones).

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``gg99_singlepair`` 
-------------------

.. rubric:: GG99

.. list-table:: 

   * - Package
     - 
   * - Version
     - 
   * - Language
     - Java
   * - Docs
     - 
   * - Paper
     - `P. Giudici & P. Green (1999). Decomposable graphical Gaussian model determination <https://www.jstor.org/stable/pdf/2673585.pdf>`_
   * - Graph type
     - DG
   * - Docker 
     - `onceltuca/thomasgreen:1.19-bp <https://hub.docker.com/r/onceltuca/thomasgreen/tags>`__

   * - Module
     - `gg99_singlepair/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gg99_singlepair>`__



.. rubric:: Description

Abstract: We propose a methodology for Bayesian model determination in decomposable graphical Gaussian models. To achieve this aim we consider a hyper inverse Wishart prior
distribution on the concentration matrix for each given graph. To ensure compatibility
across models, such prior distributions are obtained by marginalisation from the prior
conditional on the complete graph. We explore alternative structures for the hyperparameters of the latter, and their consequences for the model. Model determination is carried
out by implementing a reversible jump Markov chain Monte Carlo sampler. In particular,
the dimension-changing move we propose involves adding or dropping an edge from the
graph. We characterise the set of moves which preserve the decomposability of the graph,
giving a fast algorithm for maintaining the junction tree representation of the graph at
each sweep. As state variable, we use the incomplete variance-covariance matrix, containing only the elements for which the corresponding element of the inverse is nonzero. This
allows all computations to be performed locally, at the clique level, which is a clear
advantage for the analysis of large and complex datasets.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gg99",
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
    ]

``gobnilp`` 
-----------

.. rubric:: GOBNILP

.. list-table:: 

   * - Package
     - `GOBNILP (BitBucket) <https://bitbucket.org/jamescussens/gobnilp>`__
   * - Version
     - #4347c64
   * - Language
     - C
   * - Docs
     - `here <https://www.cs.york.ac.uk/aig/sw/gobnilp/manual.pdf>`__
   * - Paper
     - `M. Bartlett and J. Cussens (2017). Integer linear programming for the bayesian network structure learning problem. <https://www.jair.org/index.php/jair/article/download/11041/26213/>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/gobnilp:4347c64 <https://hub.docker.com/r/onceltuca/gobnilp/tags>`__

   * - Module
     - `gobnilp/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gobnilp>`__



.. rubric:: Description

Globally optimal Bayesian network learning using integer linear programming (GOBNILP) is a score based method using integer linear programming (ILP) for learning an optimal DAG
for a Bayesian network with limit on the maximal number of parents for each node (Cussens
2012). It is a two-stage approach where candidate parent sets for each node are discovered in
the first phase and the optimal sets are determined in a second phase.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gobnilp-bge",
        "continuous": true,
        "score_type": "BGe",
        "plot": false,
        "palim": 2,
        "alpha_mu": 1.0,
        "alpha_omega_minus_nvars": 2,
        "alpha": null,
        "prune": true,
        "timeout": null
      }
    ]

``gt13_multipair`` 
------------------

.. rubric:: GT13

.. list-table:: 

   * - Package
     - 
   * - Version
     - 
   * - Language
     - Java
   * - Docs
     - 
   * - Paper
     - `P. J. Green and A. Thomas (2013). Sampling decomposable graphs using a Markov chain on junction trees. <https://www.jstor.org/stable/43304539>`_
   * - Graph type
     - DG
   * - Docker 
     - `onceltuca/thomasgreen:1.19-bp <https://hub.docker.com/r/onceltuca/thomasgreen/tags>`__

   * - Module
     - `gt13_multipair/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gt13_multipair>`__



.. rubric:: Description

Abstract: Full Bayesian computational inference for model determination in undirected graphical models is currently restricted to decomposable graphs or other special cases, except for small-scale problems, say up to 15 variables. In this paper we develop new, more efficient methodology for such inference, by making two contributions to the computational geometry of decomposable graphs. The first of these provides sufficient conditions under which it is possible to completely connect two disconnected complete subsets of vertices, or perform the reverse procedure, yet maintain decomposability of the graph. The second is a new Markov chain Monte Carlo sampler for arbitrary positive distributions on decomposable graphs, taking a junction tree representing the graph as its state variable. 

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gt13",
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
    ]

``parallelDG`` 
--------------

.. rubric:: Parallel DG

.. list-table:: 

   * - Package
     - `parallelDG <https://github.com/melmasri/parallelDG>`__
   * - Version
     - 0.9.2
   * - Language
     - Python
   * - Docs
     - `here <https://github.com/melmasri/parallelDG>`__
   * - Paper
     - `M. Elmasri (2022). Parallel sampling of decomposable graphs using Markov chain on junction trees. <https://arxiv.org/pdf/2209.02008>`_
   * - Graph type
     - DG
   * - Docker 
     - `hallawalla/paralleldg:0.9.2 <https://hub.docker.com/r/hallawalla/paralleldg/tags>`__

   * - Module
     - `parallelDG/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/parallelDG>`__



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

.. rubric:: Example


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
        "mcmc_seed": [
          1,
          2
        ],
        "graph_prior": "uniform",
        "graph_prior_param": 1.0,
        "graph_prior_param1": 3.0,
        "pseudo_obs": 2,
        "delta": 5.0,
        "threshold": 0.5,
        "burnin_frac": 0.5,
        "mcmc_estimator": "map",
        "timeout": null
      }
    ]

``pcalg_pc`` 
------------

.. rubric:: PC

.. list-table:: 

   * - Package
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
   * - Version
     - 2.7-3
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`__
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - CPDAG, CG
   * - Docker 
     - `onceltuca/pcalg:2.7-3 <https://hub.docker.com/r/onceltuca/pcalg/tags>`__

   * - Module
     - `pcalg_pc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/pcalg_pc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "pc-gaussCItest",
        "alpha": [
          0.001,
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
        "indepTest": "gaussCItest",
        "timeout": null
      }
    ]

``rblip_asobs`` 
---------------

.. rubric:: ASOBS

.. list-table:: 

   * - Package
     - `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`__
   * - Version
     - 1.1
   * - Language
     - R
   * - Docs
     - `here <https://cran.r-project.org/web/packages/r.blip/r.blip.pdf>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/benchpress:1.2.0 <https://hub.docker.com/r/onceltuca/benchpress/tags>`__

   * - Module
     - `rblip_asobs/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/rblip_asobs>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "winasobs-bdeu",
        "scorermethod": "is",
        "solvermethod": "winasobs",
        "indeg": 80,
        "timeout": 180,
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
    ]

``sklearn_glasso`` 
------------------

.. rubric:: Graphical Lasso

.. list-table:: 

   * - Package
     - `scikit-learn <https://scikit-learn.org/0.22/>`__
   * - Version
     - 0.22.1
   * - Language
     - Python
   * - Docs
     - `here <https://scikit-learn.org/0.22/modules/generated/sklearn.covariance.graphical_lasso.html?highlight=glasso>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - UG
   * - Docker 
     - `onceltuca/datascience-python <https://hub.docker.com/r/onceltuca/datascience-python/tags>`__

   * - Module
     - `sklearn_glasso/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/sklearn_glasso>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "sklearn_glasso",
        "mode": "cd",
        "alpha": [
          0.05
        ],
        "tol": 0.0004,
        "enet_tol": 0.0004,
        "precmat_threshold": 0.1,
        "max_iter": 100,
        "verbose": false,
        "assume_centered": false
      }
    ]

``tetrad_fas`` 
--------------

.. rubric:: FAS

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_fas/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fas>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "fas-fisher-z",
        "test": "fisher-z-test",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_fask`` 
---------------

.. rubric:: FASK

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_fask/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fask>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "fask-fisher-z",
        "test": "fisher-z-test",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_fci`` 
--------------

.. rubric:: GFCI

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_fci/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fci>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``tetrad_fges`` 
---------------

.. rubric:: FGES

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - Java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - CPDAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_fges/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fges>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
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
    ]

``tetrad_fofc`` 
---------------

.. rubric:: FOFC

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_fofc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fofc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "fofc",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_ftfc`` 
---------------

.. rubric:: FTFC

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_ftfc/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_ftfc>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "ftfc",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_gfci`` 
---------------

.. rubric:: GFCI

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_gfci/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_gfci>`__



.. rubric:: Description

From the TETRAD manual: *GFCI is a combination of the FGES [FGES, 2016] algorithm and the FCI algorithm [Spirtes, 1993] that improves upon the accuracy and efficiency of FCI. In order to understand the basic methodology of GFCI, it is necessary to understand some basic facts about the FGES and FCI algorithms. The FGES algorithm is used to improve the accuracy of both the adjacency phase and the orientation phase of FCI by providing a more accurate initial graph that contains a subset of both the non-adjacencies and orientations of the final output of FCI. The initial set of nonadjacencies given by FGES is augmented by FCI performing a set of conditional independence tests that lead to the removal of some further adjacencies whenever a conditioning set is found that makes two adjacent variables independent. After the adjacency phase of FCI, some of the orientations of FGES are then used to provide an initial orientation of the undirected graph that is then augmented by the orientation phase of FCI to provide additional orientations. A verbose description of GFCI can be found here (discrete variables) and here (continuous variables).*



.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gfci-sem-bic-fisher-z",
        "alpha": 0.05,
        "score": "sem-bic",
        "test": "fisher-z-test",
        "datatype": "continuous",
        "penaltyDiscount": [
          0.5,
          1,
          1.5
        ],
        "samplePrior": null,
        "structurePrior": 1,
        "timeout": null
      }
    ]

``tetrad_imgscont`` 
-------------------

.. rubric:: IMGSCONT

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_imgscont/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_imgscont>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "imgscont",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_lingam`` 
-----------------

.. rubric:: LINGAM

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_lingam/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_lingam>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "lingam",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_pc-all`` 
-----------------

.. rubric:: PC-ALL

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_pc-all/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_pc-all>`__



.. rubric:: Description

From TETRAD docs: PC algorithm (Spirtes and Glymour, Social Science Computer Review, 1991) is a CPDAG search which assumes that the underlying causal structure of the input data is acyclic, and that no two variables are caused by the same latent (unmeasured) variable. In addition, it is assumed that the input data set is either entirely continuous or entirely discrete; if the data set is continuous, it is assumed that the causal relation between any two variables is linear, and that the distribution of each variable is Normal. Finally, the sample should ideally be i.i.d.. Simulations show that PC and several of the other algorithms described here often succeed when these assumptions, needed to prove their correctness, do not strictly hold. The PC algorithm will sometimes output double headed edges. In the large sample limit, double headed edges in the output indicate that the adjacent variables have an unrecorded common cause, but PC tends to produce false positive double headed edges on small samples.

The PC algorithm is correct whenever decision procedures for independence and conditional independence are available. The procedure conducts a sequence of independence and conditional independence tests, and efficiently builds a CPDAG from the results of those tests. As implemented in TETRAD, PC is intended for multinomial and approximately Normal distributions with i.i.d. data. The tests have an alpha value for rejecting the null hypothesis, which is always a hypothesis of independence or conditional independence. For continuous variables, PC uses tests of zero correlation or zero partial correlation for independence or conditional independence respectively. For discrete or categorical variables, PC uses either a chi square or a g square test of independence or conditional independence (see Causation, Prediction, and Search for details on tests). In either case, the tests require an alpha value for rejecting the null hypothesis, which can be adjusted by the user. The procedures make no adjustment for multiple testing. (For PC, CPC, JPC, JCPC, FCI, all testing searches.)

The PC algorithm as given in Causation, Prediction and Search (Spirtes, Glymour, and Scheines, 2000) comes with three heuristics designed to reduce dependence on the order of the variables. The heuristic PC-1 simple sorts the variables in alphabetical order. The heuristic PC-2 and PC-3 sort edges by their p-values in the search. PP-3 further sorts parents of nodes in reverse order by the p-values of the conditional independence facts used to removed edges in the search. Please see Causation, Prediction, and Search for more details for these heuristics.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "pc-fisher-z",
        "test": "fisher-z-test",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``tetrad_rfci`` 
---------------

.. rubric:: RFCI

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.1.3
   * - Language
     - java
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - ` <>`_
   * - Graph type
     - DAG
   * - Docker 
     - `onceltuca/causal-cmd:1.1.3 <https://hub.docker.com/r/onceltuca/causal-cmd/tags>`__

   * - Module
     - `tetrad_rfci/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_rfci>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "rfci-fisher-z",
        "alpha": [
          0.001,
          0.01,
          0.05
        ],
        "test": "fisher-z-test",
        "datatype": "continuous",
        "timeout": null
      }
    ]

``trilearn_pgibbs`` 
-------------------

.. rubric:: Particle Gibbs

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - Python
   * - Docs
     - 
   * - Paper
     - ` <>`_
   * - Graph type
     - DG
   * - Docker 
     - `onceltuca/trilearn:1.25 <https://hub.docker.com/r/onceltuca/trilearn/tags>`__

   * - Module
     - `trilearn_pgibbs/ <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/trilearn_pgibbs>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "trilearn-cont",
        "datatype": "continuous",
        "alpha": 0.5,
        "beta": 0.5,
        "radii": 80,
        "n_particles": [
          50
        ],
        "M": 100,
        "pseudo_obs": 1,
        "mcmc_seed": 1,
        "timeout": null
      }
    ]