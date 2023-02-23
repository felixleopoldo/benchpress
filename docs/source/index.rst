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
    usage

    

.. toctree::
    :hidden:
    :maxdepth: 3
    :name: Configuration
    :caption: Configuration
    
    json_overview
    examples    
    data_formats

.. toctree::
    :hidden:
    :maxdepth: 3
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

.. .. toctree::
..     :hidden:
..     :maxdepth: 3
..     :name: File formats
..     :caption: File formats

..     data_formats

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


##################################
Benchpress
##################################


Describing the relationship between the variables in a study domain and modelling
the data generating mechanism is a fundamental problem in many empirical sciences.
`Probabilistic graphical models <https://en.wikipedia.org/wiki/Graphical_model>`_ are one common approach to tackle the problem. 
Learning the graphical structure for such models (sometimes called causal discovery) is computationally challenging and a fervent
area of current research with a plethora of algorithms being developed. 
To facilitate the access to the different methods we present Benchpress, a scalable and platform-independent `Snakemake <https://snakemake.github.io/>`_ workflow to **run**, **develop**, and to create reproducible **benchmarks**
of **structure learning algorithms** for probabilistic graphical models. 
Benchpress is interfaced via a simple `JSON <https://www.json.org/json-en.html>`_-file, which makes it accessible for all users, while the code is
designed in a fully modular fashion to enable researchers to contribute additional methodologies. 
Benchpress  provides an interface to a large number of state-of-the-art
algorithms from libraries such as `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_, `BiDAG <https://cran.r-project.org/web/packages/BiDAG/index.html>`_, `bnlearn <https://www.bnlearn.com/>`_, `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`_, `GOBNILP <https://bitbucket.org/jamescussens/gobnilp/src/master/>`_, `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`_, `scikit-learn <https://scikit-learn.org>`_, `TETRAD <https://www.ccd.pitt.edu/>`_, and `trilearn <https://github.com/felixleopoldo/trilearn>`_    as well as a variety of methods for data generating models and performance evaluation. 
Alongside user-defined models and randomly
generated datasets, the workflow also includes a number of standard datasets and graphical models from the literature.

See also :footcite:t:`rios2021benchpress`, the `GitHub <https://github.com/felixleopoldo/benchpress>`_ repository, and `this Medium story <https://medium.com/@felixleopoldorios/structure-learning-using-benchpress-826847db0aa8>`_.

.. note::

    This site is under development.

.. footbibliography::