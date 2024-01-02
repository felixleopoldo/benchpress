.. _structure_learning_algorithms: 

Algorithms
=======================================

.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Structure learning algorithms
    :caption: Structure learning algorithms
    
    structure_learning_algorithms/athomas_jtsamplers
    structure_learning_algorithms/bdgraph
    structure_learning_algorithms/bidag_itsearch
    structure_learning_algorithms/bidag_order_mcmc
    structure_learning_algorithms/bidag_partition_mcmc
    structure_learning_algorithms/bnlearn_fastiamb
    structure_learning_algorithms/bnlearn_gs
    structure_learning_algorithms/bnlearn_h2pc
    structure_learning_algorithms/bnlearn_hc
    structure_learning_algorithms/bnlearn_hpc
    structure_learning_algorithms/bnlearn_iamb
    structure_learning_algorithms/bnlearn_iambfdr
    structure_learning_algorithms/bnlearn_interiamb
    structure_learning_algorithms/bnlearn_mmhc
    structure_learning_algorithms/bnlearn_mmpc
    structure_learning_algorithms/bnlearn_pcstable
    structure_learning_algorithms/bnlearn_rsmax2
    structure_learning_algorithms/bnlearn_sihitonpc
    structure_learning_algorithms/bnlearn_tabu
    structure_learning_algorithms/causaldag_gsp
    structure_learning_algorithms/causallearn_ges
    structure_learning_algorithms/causallearn_grasp
    structure_learning_algorithms/corr_thresh
    structure_learning_algorithms/dualpc
    structure_learning_algorithms/equsa_psilearner
    structure_learning_algorithms/gcastle_anm
    structure_learning_algorithms/gcastle_corl
    structure_learning_algorithms/gcastle_direct_lingam
    structure_learning_algorithms/gcastle_gae
    structure_learning_algorithms/gcastle_golem
    structure_learning_algorithms/gcastle_grandag
    structure_learning_algorithms/gcastle_ica_lingam
    structure_learning_algorithms/gcastle_mcsl
    structure_learning_algorithms/gcastle_notears
    structure_learning_algorithms/gcastle_notears_low_rank
    structure_learning_algorithms/gcastle_notears_nonlinear
    structure_learning_algorithms/gcastle_pc
    structure_learning_algorithms/gcastle_rl
    structure_learning_algorithms/gobnilp
    structure_learning_algorithms/grues
    structure_learning_algorithms/huge_glasso
    structure_learning_algorithms/huge_mb
    structure_learning_algorithms/huge_tiger
    structure_learning_algorithms/paralleldg
    structure_learning_algorithms/pcalg_gies
    structure_learning_algorithms/pcalg_pc
    structure_learning_algorithms/prec_thresh
    structure_learning_algorithms/rblip_asobs
    structure_learning_algorithms/sklearn_glasso
    structure_learning_algorithms/tetrad_boss
    structure_learning_algorithms/tetrad_fas
    structure_learning_algorithms/tetrad_fask
    structure_learning_algorithms/tetrad_fges
    structure_learning_algorithms/tetrad_fofc
    structure_learning_algorithms/tetrad_ftfc
    structure_learning_algorithms/tetrad_grasp
    structure_learning_algorithms/tetrad_ica-lingam
    structure_learning_algorithms/tetrad_pc
    structure_learning_algorithms/trilearn_pgibbs


Apart from the original parameters of the underlying software, each algorithm module is equipped with an additional parameter, ``timeout``, which is the maximum time in seconds allowed for the algorithm to run.
After the timeout, the algorithm will be terminated and either an empty file will be created or the current best graph will be saved (if the algorithm supports that).

Modules for MCMC algorithms can be used seamlessly with the other modules. However, apart from the original parameters and ``timeout``, these modules have four additional fields:

* ``mcmc_seed`` is the random seed for the algorithm. 
* ``mcmc_estimator`` specifies which estimator to use (*threshold* or *map*). 
* ``threshold`` specifies the threshold for the posterior edge probabilities if ``mcmc_estimator`` is set to *threshold*. 
* ``burnin_frac`` is a value in (0, 1) that specifies the fraction of the samples at the beginning of the graph trajectory to be discarded as burn-in.

The available modules are listed below. 
To add new modules, see :ref:`new_modules`.

.. list-table:: 
   :header-rows: 1 

   * - Algorithm
     - Graph
     - Package
     - Module
   * - Chordal graph samplers
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `Alun Thomas <https://medicine.utah.edu/faculty/alun-thomas>`__
     - :ref:`athomas_jtsamplers` 
   * - BDgraph
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - :ref:`bdgraph` 
   * - Iterative MCMC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - :ref:`bidag_itsearch` 
   * - Order MCMC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - :ref:`bidag_order_mcmc` 
   * - Partition MCMC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - :ref:`bidag_partition_mcmc` 
   * - Fast IAMB
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_fastiamb` 
   * - Grow-shrink
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_gs` 
   * - H2PC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_h2pc` 
   * - HC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_hc` 
   * - HPC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_hpc` 
   * - IAMB
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_iamb` 
   * - IAMB-FDR
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_iambfdr` 
   * - INTER-IAMB
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_interiamb` 
   * - MMHC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_mmhc` 
   * - MMPC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_mmpc` 
   * - PC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_pcstable` 
   * - RSMAX2
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_rsmax2` 
   * - S-I HITON-PC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_sihitonpc` 
   * - Tabu
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     - :ref:`bnlearn_tabu` 
   * - GSP
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `CausalDAG <https://github.com/uhlerlab/causaldag>`__
     - :ref:`causaldag_gsp` 
   * - GRaSP
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-learn <https://causal-learn.readthedocs.io/en/latest/index.html>`__
     - :ref:`causallearn_grasp` 
   * - Corrmat thresh
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
     - :ref:`corr_thresh` 
   * - Dual PC
     - `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `dualPC <https://github.com/enricogiudice/dualPC>`__
     - :ref:`dualpc` 
   * - Psi-learning
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `equSA <https://rdrr.io/cran/equSA/>`__
     - :ref:`equsa_psilearner` 
   * - ANM
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_anm` 
   * - CORL
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_corl` 
   * - Direct LINGAM
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_direct_lingam` 
   * - GAE
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_gae` 
   * - GOLEM
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_golem` 
   * - GraNDAG
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_grandag` 
   * - ICALiNGAM
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_ica_lingam` 
   * - MCSL
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_mcsl` 
   * - NO TEARS
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_notears` 
   * - NO TEARS low rank
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_notears_low_rank` 
   * - NO TEARS non-linear
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_notears_nonlinear` 
   * - PC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_pc` 
   * - RL
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - :ref:`gcastle_rl` 
   * - GOBNILP
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `GOBNILP (BitBucket) <https://bitbucket.org/jamescussens/gobnilp>`__
     - :ref:`gobnilp` 
   * - GrUES
     - `UDG <https://arxiv.org/pdf/2210.00822.pdf#subsection.2.2>`__
     - `gues <https://pypi.org/project/gues/>`__
     - :ref:`grues` 
   * - Graphical lasso
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     - :ref:`huge_glasso` 
   * - Meinshausen & Buhlmann cov est
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     - :ref:`huge_mb` 
   * - TIGER
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     - :ref:`huge_tiger` 
   * - Parallel DG
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `parallelDG <https://github.com/melmasri/parallelDG>`__
     - :ref:`paralleldg` 
   * - GIES
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - :ref:`pcalg_gies` 
   * - PC
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__, `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - :ref:`pcalg_pc` 
   * - Precmat thresh
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
     - :ref:`prec_thresh` 
   * - ASOBS
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`__
     - :ref:`rblip_asobs` 
   * - Graphical Lasso
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `scikit-learn <https://scikit-learn.org/0.22/>`__
     - :ref:`sklearn_glasso` 
   * - BOSS
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_boss` 
   * - FASK
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_fask` 
   * - FGES
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_fges` 
   * - FOFC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_fofc` 
   * - FTFC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_ftfc` 
   * - GRaSP
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_grasp` 
   * - ICA-LINGAM
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_ica-lingam` 
   * - PC
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     - :ref:`tetrad_pc` 
   * - Particle Gibbs
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - :ref:`trilearn_pgibbs` 



