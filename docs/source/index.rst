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
    

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Configuration
    :caption: Configuration
    
    json_overview

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Developers guide
    :caption: Developers guide

    dev_guide
    
##################################
Benchpress's documentation
##################################


.. Benchpress [1]_ is a `Snakemake <https://snakemake.readthedocs.io>`_ workflow for reproducible and scalable benchmarking of algorithms for learning graphical models.
.. It provides a simple interface via a `JSON <https://www.json.org/json-en.html>`_ configuration file in a probabilistic programming fashion.
.. Benchpress implements a number of the state-of-the-art algorithms available in the literature, as well as data, parameter sampling algorithms and benchmarking metrics.

Describing the relationship between the variables in a study domain and modelling
the data generating mechanism is a fundamental problem in many empirical sciences.
Probabilistic graphical models are one common approach to tackle the problem. Learning the graphical structure for such models is computationally challenging and a fervent
area of current research with a plethora of algorithms being developed. To facilitate
the benchmarking of different methods, we present created Benchpress [1]_, a novel  `Snakemake <https://snakemake.readthedocs.io>`_ workflow, for producing scalable, reproducible, and platform-independent benchmarks
of structure learning algorithms for probabilistic graphical models. Benchpress is interfaced via a simple JSON-file, which makes it accessible for all users, while the code is
designed in a fully modular fashion to enable researchers to contribute additional methodologies. Benchpress currently provides an interface to a large number of state-of-the-art
algorithms from libraries such as BDgraph, BiDAG, bnlearn, gCastle, GOBNILP, pcalg,
r.blip, scikit-learn, TETRAD, and trilearn as well as a variety of methods for data generating models and performance evaluation. Alongside user-defined models and randomly
generated datasets, is also includes a number of standard datasets and graphical models from the literature, which may be included in a benchmarking study. 


`Check it out on Github <https://github.com/felixleopoldo/benchpress>`_.


.. [1] Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and versatile workflow for benchmarking structure learning algorithms for graphical models. ArXiv eprints., 2107.03863, 2021.