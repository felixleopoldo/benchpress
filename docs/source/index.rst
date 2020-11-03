.. Benchpress documentation master file, created by
   sphinx-quickstart on Mon Oct 26 10:03:54 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


.. toctree::
    :hidden:
    :glob:
    :maxdepth: 2
    :name: Installation
    :caption: Installation

    installation
    roc_example

.. toctree::
    :hidden:
    :maxdepth: 1
    :name: Configuration
    :caption: Configuration
    :titlesonly:
    
    json_overview

    available_graphs
    
    available_parameters
    
    available_data

    available_structure_learning_algorithms


##################################
Benchpress's documentation
##################################

.. image:: ../../figures/benchpress.jpg
   :width: 600

Benchpress is a  workflow for systematic benchmarking of algorithms for learning graphical models from observed data.
It is based on the workflow managment system `Snakemake <https://snakemake.readthedocs.io>`_  and provides a simple interface via a `JSON <https://www.json.org/json-en.html>`_ configuration file.
Benchpress implements the state of the art structure learning algorithms available in the literature, as well as data, parameter sampling algorithms and benchmarking metrics.



