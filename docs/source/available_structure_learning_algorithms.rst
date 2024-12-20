.. _structure_learning_algorithms: 

Algorithms
=======================================

.. toctree::
    :hidden:
    :glob:
    :maxdepth: 1
    :name: Structure learning algorithms
    :caption: Structure learning algorithms
    
    structure_learning_algorithms/athomas_jtsamplers
    structure_learning_algorithms/bdgraph
    structure_learning_algorithms/bidag_itsearch
    structure_learning_algorithms/bidag_order_mcmc
    structure_learning_algorithms/bidag_partition_mcmc
    structure_learning_algorithms/bips_tpc
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
    structure_learning_algorithms/mice
    structure_learning_algorithms/mvpc
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

   * - Algorithm (source)
     - Graph
     - Package
     - Module
   * - :ref:`athomas_jtsamplers`
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `Alun Thomas <https://medicine.utah.edu/faculty/alun-thomas>`__
     -  :ref:`athomas_jtsamplers <athomas_jtsamplers>`
   * - :ref:`bdgraph`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     -  :ref:`bdgraph <bdgraph>`
   * - :ref:`bidag_itsearch`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     -  :ref:`bidag_itsearch <bidag_itsearch>`
   * - :ref:`bidag_order_mcmc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     -  :ref:`bidag_order_mcmc <bidag_order_mcmc>`
   * - :ref:`bidag_partition_mcmc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`__
     -  :ref:`bidag_partition_mcmc <bidag_partition_mcmc>`
   * - :ref:`bips_tpc`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `tpc <https://github.com/bips-hb/tpc>`__
     -  :ref:`bips_tpc <bips_tpc>`
   * - :ref:`bnlearn_fastiamb`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_fastiamb <bnlearn_fastiamb>`
   * - :ref:`bnlearn_gs`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_gs <bnlearn_gs>`
   * - :ref:`bnlearn_h2pc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_h2pc <bnlearn_h2pc>`
   * - :ref:`bnlearn_hc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_hc <bnlearn_hc>`
   * - :ref:`bnlearn_hpc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_hpc <bnlearn_hpc>`
   * - :ref:`bnlearn_iamb`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_iamb <bnlearn_iamb>`
   * - :ref:`bnlearn_iambfdr`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_iambfdr <bnlearn_iambfdr>`
   * - :ref:`bnlearn_interiamb`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_interiamb <bnlearn_interiamb>`
   * - :ref:`bnlearn_mmhc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_mmhc <bnlearn_mmhc>`
   * - :ref:`bnlearn_mmpc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_mmpc <bnlearn_mmpc>`
   * - :ref:`bnlearn_pcstable`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_pcstable <bnlearn_pcstable>`
   * - :ref:`bnlearn_rsmax2`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_rsmax2 <bnlearn_rsmax2>`
   * - :ref:`bnlearn_sihitonpc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_sihitonpc <bnlearn_sihitonpc>`
   * - :ref:`bnlearn_tabu`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `bnlearn <https://www.bnlearn.com/>`__
     -  :ref:`bnlearn_tabu <bnlearn_tabu>`
   * - :ref:`causaldag_gsp`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `CausalDAG <https://github.com/uhlerlab/causaldag>`__
     -  :ref:`causaldag_gsp <causaldag_gsp>`
   * - :ref:`causallearn_grasp`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-learn <https://causal-learn.readthedocs.io/en/latest/index.html>`__
     -  :ref:`causallearn_grasp <causallearn_grasp>`
   * - :ref:`corr_thresh`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
     -  :ref:`corr_thresh <corr_thresh>`
   * - :ref:`dualpc`
     - `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `dualPC <https://github.com/enricogiudice/dualPC>`__
     -  :ref:`dualpc <dualpc>`
   * - :ref:`equsa_psilearner`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `equSA <https://rdrr.io/cran/equSA/>`__
     -  :ref:`equsa_psilearner <equsa_psilearner>`
   * - :ref:`gcastle_anm`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_anm <gcastle_anm>`
   * - :ref:`gcastle_corl`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_corl <gcastle_corl>`
   * - :ref:`gcastle_direct_lingam`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_direct_lingam <gcastle_direct_lingam>`
   * - :ref:`gcastle_gae`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_gae <gcastle_gae>`
   * - :ref:`gcastle_golem`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_golem <gcastle_golem>`
   * - :ref:`gcastle_grandag`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_grandag <gcastle_grandag>`
   * - :ref:`gcastle_ica_lingam`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_ica_lingam <gcastle_ica_lingam>`
   * - :ref:`gcastle_mcsl`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_mcsl <gcastle_mcsl>`
   * - :ref:`gcastle_notears`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_notears <gcastle_notears>`
   * - :ref:`gcastle_notears_low_rank`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_notears_low_rank <gcastle_notears_low_rank>`
   * - :ref:`gcastle_notears_nonlinear`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_notears_nonlinear <gcastle_notears_nonlinear>`
   * - :ref:`gcastle_pc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_pc <gcastle_pc>`
   * - :ref:`gcastle_rl`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     -  :ref:`gcastle_rl <gcastle_rl>`
   * - :ref:`gobnilp`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `GOBNILP (BitBucket) <https://bitbucket.org/jamescussens/gobnilp>`__
     -  :ref:`gobnilp <gobnilp>`
   * - :ref:`grues`
     - `UDG <https://arxiv.org/pdf/2210.00822.pdf#subsection.2.2>`__
     - `gues <https://pypi.org/project/gues/>`__
     -  :ref:`grues <grues>`
   * - :ref:`huge_glasso`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     -  :ref:`huge_glasso <huge_glasso>`
   * - :ref:`huge_mb`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     -  :ref:`huge_mb <huge_mb>`
   * - :ref:`huge_tiger`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
     -  :ref:`huge_tiger <huge_tiger>`
   * - :ref:`mice`
     - 
     - `mice <https://amices.org/mice/>`__
     -  :ref:`mice <mice>`
   * - :ref:`mvpc`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `MVPC <https://github.com/felixleopoldo/MVPC>`__
     -  :ref:`mvpc <mvpc>`
   * - :ref:`paralleldg`
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `parallelDG <https://github.com/melmasri/parallelDG>`__
     -  :ref:`paralleldg <paralleldg>`
   * - :ref:`pcalg_gies`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     -  :ref:`pcalg_gies <pcalg_gies>`
   * - :ref:`pcalg_pc`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__, `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
     -  :ref:`pcalg_pc <pcalg_pc>`
   * - :ref:`prec_thresh`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `Benchpress <https://github.com/felixleopoldo/benchpress>`__
     -  :ref:`prec_thresh <prec_thresh>`
   * - :ref:`rblip_asobs`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`__
     -  :ref:`rblip_asobs <rblip_asobs>`
   * - :ref:`sklearn_glasso`
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `scikit-learn <https://scikit-learn.org/0.22/>`__
     -  :ref:`sklearn_glasso <sklearn_glasso>`
   * - :ref:`tetrad_boss`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_boss <tetrad_boss>`
   * - :ref:`tetrad_fask`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_fask <tetrad_fask>`
   * - :ref:`tetrad_fges`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_fges <tetrad_fges>`
   * - :ref:`tetrad_fofc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_fofc <tetrad_fofc>`
   * - :ref:`tetrad_ftfc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_ftfc <tetrad_ftfc>`
   * - :ref:`tetrad_grasp`
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_grasp <tetrad_grasp>`
   * - :ref:`tetrad_ica-lingam`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_ica-lingam <tetrad_ica-lingam>`
   * - :ref:`tetrad_pc`
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
     -  :ref:`tetrad_pc <tetrad_pc>`
   * - :ref:`trilearn_pgibbs`
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     -  :ref:`trilearn_pgibbs <trilearn_pgibbs>`



