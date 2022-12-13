.. Benchpress documentation master file, created by
   sphinx-quickstart on Mon Oct 26 10:03:54 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


.. toctree::
    :hidden:
    :glob:
    :maxdepth: 3
    :name: Getting started
    :caption: Getting started

    installation
    roc_example
    

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Configuration
    :caption: Configuration
    
    json_overview

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Adding modules
    :caption: Adding modules
    
    module_add

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Developers guide
    :caption: Developers guide

    dev_guide
    
##################################
Benchpress's documentation
##################################


Describing the relationship between the variables in a study domain and modelling
the data generating mechanism is a fundamental problem in many empirical sciences.
Probabilistic graphical models are one common approach to tackle the problem. Learning the graphical structure for such models is computationally challenging and a fervent
area of current research with a plethora of algorithms being developed. To facilitate
the benchmarking of different methods we present Benchpress, a novel Snakemake workflow for producing scalable, reproducible, and platform-independent benchmarks
of structure learning algorithms for probabilistic graphical models. Benchpress is interfaced via a simple JSON-file, which makes it accessible for all users, while the code is
designed in a fully modular fashion to enable researchers to contribute additional methodologies. Benchpress currently provides an interface to a large number of state-of-the-art
algorithms from libraries such as `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_, `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_, `bnlearn <https://www.bnlearn.com/>`_, `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`_, `GOBNILP <https://bitbucket.org/jamescussens/gobnilp/src/master/>`_, `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`_,
`r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`_, `scikit-learn <https://scikit-learn.org>`_, `TETRAD <https://www.ccd.pitt.edu/>`_, and `trilearn <https://github.com/felixleopoldo/trilearn>`_    as well as a variety of methods for data generating models and performance evaluation. Alongside user-defined models and randomly
generated datasets, the workflow also includes a number of standard datasets and graphical models from the literature, which may be included in a benchmarking study. 

`View on Github <https://github.com/felixleopoldo/benchpress>`_.


.. note::

    The documentation is still under development.


.. [1] Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and versatile workflow for benchmarking structure learning algorithms for graphical models. ArXiv eprints., 2107.03863, 2021.

