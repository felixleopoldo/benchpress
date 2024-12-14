.. Benchpress documentation master file, created by
   sphinx-quickstart on Mon Oct 26 10:03:54 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


.. meta::
    :title: Benchpress: Open-Source Causal Discovery Suite
    :description: Benchpress is a platform-independent open-source software to develop, execute, and benchmark causal discovery algorithms.
.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Getting started
    :caption: Getting started

    installation
    examples

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Configuration
    :caption: Configuration
    
    json_overview    
    data_formats
    available_background_knowledge

.. toctree::
    :hidden:
    :maxdepth: 1
    :name: Modules
    :caption: Modules
        
    available_graphs
    available_parameters
    available_data
    available_structure_learning_algorithms
    available_evaluations

.. toctree::
    :hidden:
    :maxdepth: 1
    :name: Development
    :caption: Development
    
    module_add

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Project info
    :caption: Project info

    dev_guide
    
|GPLv2 license| |GitHub stars| 

.. |GPLv2 license| image:: https://img.shields.io/badge/License-GPLv2-blue.svg
   :target: http://www.gnu.org/licenses/gpl-2.0.html

.. |GitHub stars| image:: https://img.shields.io/github/stars/felixleopoldo/benchpress.svg?style=social&label=Star&maxAge=2592000
   :target: https://GitHub.com/felixleopoldo/benchpress/stargazers/   


------------------------

#############################################################
Open-source causal discovery platform
#############################################################

Describing the relationship between the variables in a study domain and modelling
the data generating mechanism is a fundamental problem in many empirical sciences.
`Probabilistic graphical models <https://en.wikipedia.org/wiki/Graphical_model>`_ are one common approach to tackle the problem. 
Learning the graphical structure for such models, referred to as **causal discovery** and **structure learning** in general, is computationally challenging and a fervent
area of current research with a plethora of algorithms being developed. 
To facilitate the access to the different methods we present Benchpress, a scalable and platform-independent `Snakemake <https://snakemake.github.io/>`_ workflow to **run**, **develop**, and to create reproducible **benchmarks**
of **structure learning algorithms** for probabilistic graphical models.
Benchpress is interfaced via a simple `JSON <https://www.json.org/json-en.html>`_-file, which makes it accessible for all users, while the code is
designed in a fully modular fashion to enable researchers to contribute additional methodologies. 
Benchpress  provides an interface to a large number of state-of-the-art
algorithms from libraries such as `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_, `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_, `bnlearn <https://www.bnlearn.com/>`_, `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`_, `GOBNILP <https://bitbucket.org/jamescussens/gobnilp/src/master/>`_, `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`_, `scikit-learn <https://scikit-learn.org>`_, `TETRAD <https://www.ccd.pitt.edu/>`_, and `trilearn <https://github.com/felixleopoldo/trilearn>`_    as well as a variety of methods for data generating models and performance evaluation. 
Alongside user-defined models and randomly
generated datasets, the workflow also includes a number of standard datasets and graphical models from the literature.

.. rubric:: See also

* The paper :footcite:t:`rios2021benchpress` (to appear in the `Journal of Statistical Software <https://www.jstatsoft.org/index>`_)
* The `GitHub <https://github.com/felixleopoldo/benchpress>`_ repository
* This `Medium story <https://medium.com/@felixleopoldorios/structure-learning-using-benchpress-826847db0aa8>`_
* This video tutorial `UAI 2023 Tutorial: Structure Learning Using Benchpress - YouTube <https://www.youtube.com/watch?v=tx3hIH3b9Hg>`_
.. * The `Discord <https://discord.com/channels/1007933286724685824/1007933287215411284>`_ chat for any kind of discussions etc.

.. .. note::

..     If you have any questions, suggestions, or contributions, please feel free to contact us. Either raise an issue at the `GitHub <https://github.com/felixleopoldo/benchpress>`_, or join the `Discord <https://discord.com/channels/1007933286724685824/1007933287215411284>`_ chat. 
..     Or simply send an email to felix leopoldo rios at gmail dot com.

.. rubric:: News

* 2024-11-30: Benchpress 2.10.0. This version includes algorithms from the MVPC package for sampling (:ref:`mvpc_gen_data`) and causal discovery (:ref:`mvpc`) in the presence of missing data.
* 2024-11-24: Benchpress 2.9.0. This version comes with three new major features. 

    I) The ability to incorporate background knowledge in terms of :ref:`edge_constraints`. Thanks to `Gomathi Lakshmanan <https://www.linkedin.com/in/gomathi-l/>`_ for this great feature. 
    II) The ability to specify multiple benchmark setups in the same config file (See :ref:`json_config`). To convert the old config format to this new one run 
        
        .. prompt:: bash

            chmod +x scripts/utils/reformat_conf_files.py 
            workflow/scripts/utils/reformat_conf_files.py
            
    III) Generating DAGs using the `gCastle <https://github.com/huawei-noah/trustworthyAI/blob/master/gcastle/README.md>`_  package (:ref:`gcastle_dag`). Thanks to `Damian Machlanski <https://dmachlanski.com/>`_.
* 2024-06-27: Benchpress 2.8.0. The new :ref:`graph_estimation` module enables graph estimation and plotting. It will replace the :ref:`graph_plots` module as it is faster an easier to use. 
* 2024-03-20: `Jack Kuipers <https://bsse.ethz.ch/cbg/group/people/person-detail.MjA3Mjc0.TGlzdC81MTYsOTQ0ODM3Mzc2.html>`_ gives a `Zoom seminar <https://ethz.zoom.us/j/65832714361>`_ on Benchpress today at 5 PM CET at `The Swiss Reproducibility Network <https://www.swissrn.org/computational/>`_
* 2024-02-13: Updated :ref:`examples` with timings and the algorithms BOSS (:ref:`tetrad_boss`) and GRaSP (:ref:`tetrad_grasp`).
* 2024-01-03: Benchpress 2.7.0. New algorithm modules from the `huge <https://cran.r-project.org/web/packages/huge/index.html>`_ package for estimating Gaussian graphical models: :ref:`huge_glasso`, :ref:`huge_mb`, and :ref:`huge_tiger`. Thanks `Mohamad Elmasri <https://www.turing.ac.uk/people/mohamad-elmasri/>`_ for the contribution.
* 2023-12-04: New version of the Benchpress paper :footcite:t:`rios2021benchpress`.
* 2023-11-16: Benchpress 2.6.0 released. The new algorithm GrUES (:ref:`grues`) for estimating the unconditional dependence graph (`UDG <https://arxiv.org/pdf/2210.00822.pdf#subsection.2.2>`_) for DAGs is now available. Thanks `Alex Markham <https://causal.dev/>`_ for the contribution.
* 2023-10-13: Benchpress 2.5.0 released. Added the feature to pass the graph estimate of one algorithm as input of another. Added the algorithm module :ref:`athomas_jtsamplers` for MCMC estimating graphs of undirected decomposable graphical models.
* 2023-09-24: Benchpress 2.4.0 released. Added the Psi-learner algorithm for learning graphs of undirected Gaussian graphical models (:ref:`equsa_psilearner`).
* 2023-09-19: Benchpress 2.3.0 released. Updated causal-cmd to version 1.10.0. Added the BOSS algorithm (:ref:`tetrad_boss`).
* 2023-09-08: Benchpress 2.2.0 released. Now supporting the `ARM64 <https://en.wikipedia.org/wiki/AArch64>`_ architecture used e.g. by the recent Apple computers. 
* 2023-08-31: The Grasp algorithm is available through both :ref:`causallearn_grasp` and :ref:`tetrad_grasp`.
* 2023-07-31: Benchpress tutorial at UAI 2023: `Structure learning using Benchpress <https://www.auai.org/uai2023/tutorials>`_ (:download:`slides <_static/Benchpress_Tutorial_UAI23.pdf>`, `YouTube <https://www.youtube.com/watch?v=tx3hIH3b9Hg>`_).
* 2023-06-20: Benchpress tutorial at KTH
* 2022-09-06: `Algorithms for learning Bayesian networks (James Cussens) <https://jcussens.github.io/talks/bias22.pdf>`_. `Interactive AI CDT Summer School (BIAS 22) <https://www.bristol.ac.uk/cdt/interactive-ai/events/bias-summer-school-2022/>`_, University of Bristol
* 2022-05-24: Benchpress talk at the `CATS seminar series at KTH <https://www.kth.se/math/kalender/felix-rios-benchpress-a-scalable-and-versatile-workflow-for-benchmarking-structure-learning-algorithms-for-graphical-models-1.1171995?date=2022-05-24&orgdate=2022-05-24&length=1&orglength=1>`_
* 2022-04-04: Benchpress talk and tutorial at the `Simons Institute, Berkley <https://simons.berkeley.edu/events/causality-reading-group-causal-discovery-5>`_ 
* 2021-12-18: Benchpress talk at the `14th International Conference on Computational and Methodological Statistics (CMStatistics 2021), London <https://www.cmstatistics.org/CMStatistics2021/index.php>`_

.. footbibliography::


.. Note that this version requires that *old config files has to be adapted* to add ``edgeConstraints: null`` for the modules supporting it and change the ``benchmark_setup`` section to contain a list, where each item has a ``title`` key. To do this you may run the script . 