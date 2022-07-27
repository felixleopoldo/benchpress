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


Benchpress [1]_ is a `Snakemake <https://snakemake.readthedocs.io>`_ workflow for reproducible and scalable benchmarking of algorithms for learning graphical models.
It provides a simple interface via a `JSON <https://www.json.org/json-en.html>`_ configuration file in a probabilistic programming fashion.
Benchpress implements a number of the state-of-the-art algorithms available in the literature, as well as data, parameter sampling algorithms and benchmarking metrics.

`View on Github <https://github.com/felixleopoldo/benchpress>`_.


.. [1] Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and versatile workflow for benchmarking structure learning algorithms for graphical models. ArXiv eprints., 2107.03863, 2021.