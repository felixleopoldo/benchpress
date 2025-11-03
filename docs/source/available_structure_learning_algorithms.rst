

.. _structure_learning_algorithms: 

Algorithms
=======================================

.. toctree::
    :hidden:
    :glob:
    :maxdepth: 1
    :name: Structure learning algorithms
    :caption: Structure learning algorithms
    
    structure_learning_algorithms/gcastle_anm
    structure_learning_algorithms/rblip_asobs
    structure_learning_algorithms/bdgraph
    structure_learning_algorithms/tetrad_boss
    structure_learning_algorithms/gcastle_corl
    structure_learning_algorithms/athomas_jtsamplers
    structure_learning_algorithms/corr_thresh
    structure_learning_algorithms/gcastle_direct_lingam
    structure_learning_algorithms/dualpc
    structure_learning_algorithms/tetrad_fas
    structure_learning_algorithms/tetrad_fask
    structure_learning_algorithms/tetrad_fges
    structure_learning_algorithms/tetrad_fofc
    structure_learning_algorithms/tetrad_ftfc
    structure_learning_algorithms/bnlearn_fastiamb
    structure_learning_algorithms/gcastle_gae
    structure_learning_algorithms/pcalg_gies
    structure_learning_algorithms/sklearn_glasso
    structure_learning_algorithms/huge_glasso
    structure_learning_algorithms/gobnilp
    structure_learning_algorithms/gcastle_golem
    structure_learning_algorithms/causallearn_grasp
    structure_learning_algorithms/tetrad_grasp
    structure_learning_algorithms/bnlearn_gs
    structure_learning_algorithms/causaldag_gsp
    structure_learning_algorithms/grues
    structure_learning_algorithms/gcastle_grandag
    structure_learning_algorithms/bnlearn_h2pc
    structure_learning_algorithms/bnlearn_hc
    structure_learning_algorithms/bnlearn_hpc
    structure_learning_algorithms/bnlearn_iamb
    structure_learning_algorithms/bnlearn_iambfdr
    structure_learning_algorithms/gcastle_ica_lingam
    structure_learning_algorithms/tetrad_ica-lingam
    structure_learning_algorithms/bnlearn_interiamb
    structure_learning_algorithms/bidag_itsearch
    structure_learning_algorithms/huge_mb
    structure_learning_algorithms/gcastle_mcsl
    structure_learning_algorithms/mice
    structure_learning_algorithms/bnlearn_mmhc
    structure_learning_algorithms/bnlearn_mmpc
    structure_learning_algorithms/mvpc
    structure_learning_algorithms/causallearn_ges
    structure_learning_algorithms/gcastle_notears
    structure_learning_algorithms/gcastle_notears_low_rank
    structure_learning_algorithms/gcastle_notears_nonlinear
    structure_learning_algorithms/bidag_order_mcmc
    structure_learning_algorithms/pcalg_pc
    structure_learning_algorithms/bnlearn_pcstable
    structure_learning_algorithms/tetrad_pc
    structure_learning_algorithms/gcastle_pc
    structure_learning_algorithms/paralleldg
    structure_learning_algorithms/trilearn_pgibbs
    structure_learning_algorithms/bidag_partition_mcmc
    structure_learning_algorithms/prec_thresh
    structure_learning_algorithms/equsa_psilearner
    structure_learning_algorithms/pyagrum
    structure_learning_algorithms/gcastle_rl
    structure_learning_algorithms/bnlearn_rsmax2
    structure_learning_algorithms/bnlearn_sihitonpc
    structure_learning_algorithms/huge_tiger
    structure_learning_algorithms/bips_tpc
    structure_learning_algorithms/bnlearn_tabu


Benchpress provides access to a wide range of open-source packages for causal discovery and structure learning such as `pcalg <https://cran.r-project.org/web/packages/pcalg/>`__, `BDgraph <https://cran.r-project.org/web/packages/BDgraph/>`__, `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__, `TETRAD <https://github.com/cmu-phil/tetrad>`__, `bnlearn <https://www.bnlearn.com/>`__, `causal-learn <https://github.com/cmu-phil/causal-learn>`__, and many others, making it easy to use and compare different algorithms within a unified framework.
The algorithms are accesed through their corresponding modules, which are listed below. 
To use an algorithm module, a section with the corresponding name is simply added to the ``structure_learning_algorithms`` section of the JSON config file. 
Sample JSON snippets are provided for each module and you may also review :ref:`json_config` to see how it works.

The algorithm parameters used in the modules are inherited from the underlying packages as much as possible, maintaining consistency with the original implementations.
This means that users familiar with the original packages can easily transfer their knowledge and existing configurations to Benchpress. 
Users can also refer to the documentation of the underlying packages (linked to in each module) to better understand the parameters and their effects.
Apart from the original parameters, each algorithm module is equipped with an additional parameter, ``timeout``, which is the maximum time in seconds allowed for the algorithm to run.
After the timeout, the algorithm will be terminated and either an empty file will be created or the current best graph will be saved (if the algorithm supports that).

Modules for MCMC algorithms can be used seamlessly with the other modules. However, apart from the original parameters and ``timeout``, these modules have four additional fields:

* ``mcmc_seed`` is the random seed for the algorithm. 
* ``mcmc_estimator`` specifies which estimator to use (*threshold* or *map*). 
* ``threshold`` specifies the threshold for the posterior edge probabilities if ``mcmc_estimator`` is set to *threshold*. 
* ``burnin_frac`` is a value in (0, 1) that specifies the fraction of the samples at the beginning of the graph trajectory to be discarded as burn-in.


.. list-table:: 
   :class: sphinx-datatable
   :header-rows: 1 

   * - Algorithm
     - Package
     - Graph
     - Data
     - MCMC
     - Edge constraints
     - Data missingness
     - Intervention type
   * - :ref:`ANM <gcastle_anm>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`ASOBS <rblip_asobs>`
     - `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - D
     - 
     - 
     - 
     - 
   * - :ref:`BDgraph <bdgraph>`
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C, D, M
     - Yes
     - 
     - `MCAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__
     - 
   * - :ref:`BOSS <tetrad_boss>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`CORL <gcastle_corl>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`Chordal graph samplers <athomas_jtsamplers>`
     - `A. Thomas <https://medicine.utah.edu/faculty/alun-thomas>`__
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - C, D
     - Yes
     - 
     - 
     - 
   * - :ref:`Corrmat thresh <corr_thresh>`
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`Direct LINGAM <gcastle_direct_lingam>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`Dual PC <dualpc>`
     - `dualPC <https://github.com/enricogiudice/dualPC>`__
     - `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`FASK <tetrad_fask>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`FGES <tetrad_fges>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`FOFC <tetrad_fofc>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`FTFC <tetrad_ftfc>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`Fast IAMB <bnlearn_fastiamb>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`GAE <gcastle_gae>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`GIES <pcalg_gies>`
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - hard
   * - :ref:`GLasso <sklearn_glasso>`
     - `scikit-learn <https://scikit-learn.org/0.22/>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`GLasso <huge_glasso>`
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`GOBNILP <gobnilp>`
     - `GOBNILP <https://bitbucket.org/jamescussens/gobnilp>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`GOLEM <gcastle_golem>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`GRaSP <causallearn_grasp>`
     - `causal-learn <https://causal-learn.readthedocs.io/en/latest/index.html>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - 
     - 
     - 
     - 
   * - :ref:`GRaSP <tetrad_grasp>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`GS <bnlearn_gs>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`GSP <causaldag_gsp>`
     - `CausalDAG <https://github.com/uhlerlab/causaldag>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`GrUES <grues>`
     - `gues <https://pypi.org/project/gues/>`__
     - `UDG <https://arxiv.org/pdf/2210.00822.pdf#subsection.2.2>`__
     - C
     - Yes
     - 
     - 
     - 
   * - :ref:`GraNDAG <gcastle_grandag>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`H2PC <bnlearn_h2pc>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`HC <bnlearn_hc>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`HPC <bnlearn_hpc>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`IAMB <bnlearn_iamb>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`IAMB-FDR <bnlearn_iambfdr>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`ICA-LiNGAM <gcastle_ica_lingam>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`ICA-LiNGAM <tetrad_ica-lingam>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`INTER-IAMB <bnlearn_interiamb>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`Iterative MCMC <bidag_itsearch>`
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - Yes
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`M&B cov est <huge_mb>`
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`MCSL <gcastle_mcsl>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`MICE <mice>`
     - `mice <https://amices.org/mice/>`__
     - 
     - C, D, M
     - 
     - 
     - 
     - 
   * - :ref:`MMHC <bnlearn_mmhc>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`MMPC <bnlearn_mmpc>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`MVPC <mvpc>`
     - `MVPC <https://github.com/felixleopoldo/MVPC>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - `MAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__, `MNAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__, `MCAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__
     - 
   * - :ref:`NO TEARS <gcastle_notears>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`NO TEARS low rank <gcastle_notears_low_rank>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`NO TEARS non-linear <gcastle_notears_nonlinear>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`Order MCMC <bidag_order_mcmc>`
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - Yes
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`PC <pcalg_pc>`
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__, `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__
     - C, D
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`PC <bnlearn_pcstable>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`PC <tetrad_pc>`
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`PC <gcastle_pc>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`Parallel DG <paralleldg>`
     - `parallelDG <https://github.com/melmasri/parallelDG>`__
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - C, D
     - Yes
     - 
     - 
     - 
   * - :ref:`Particle Gibbs <trilearn_pgibbs>`
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - C, D
     - Yes
     - 
     - 
     - 
   * - :ref:`Partition MCMC <bidag_partition_mcmc>`
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - C, D
     - Yes
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`Precmat thresh <prec_thresh>`
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`Psi-learning <equsa_psilearner>`
     - `equSA <https://rdrr.io/cran/equSA/>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`PyAgrum <pyagrum>`
     - `pyagrum <https://pyagrum.readthedocs.io/en/latest/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - B
     - 
     - 
     - 
     - 
   * - :ref:`RL <gcastle_rl>`
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`RSMAX2 <bnlearn_rsmax2>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`S-I HITON-PC <bnlearn_sihitonpc>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 
   * - :ref:`TIGER <huge_tiger>`
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - C
     - 
     - 
     - 
     - 
   * - :ref:`TPC <bips_tpc>`
     - `tpc <https://github.com/bips-hb/tpc>`__
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__, `MPDAG <https://auai.org/uai2017/proceedings/papers/120.pdf>`__, `TMPDAG <https://proceedings.mlr.press/v216/bang23a.html>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - `MAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__, `MNAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__, `MCAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__
     - 
   * - :ref:`Tabu <bnlearn_tabu>`
     - `bnlearn <https://www.bnlearn.com/>`__
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - C, D, M
     - 
     - :ref:`Yes <edge_constraints>`
     - 
     - 



