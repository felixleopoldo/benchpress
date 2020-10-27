.. Benchpress documentation master file, created by
   sphinx-quickstart on Mon Oct 26 10:03:54 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


.. toctree::

    :maxdepth: 3
    :caption: Contents:


##################################
Benchpress's documentation
###########################################

.. image:: ../../figures/benchpress.jpg
   :width: 600

Systematic benchmarks of structure learning algorithms for graphical models.
A `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ Snakemake based command-line tool for making re-producible benchmarks on graphical model learning algorithms.

Benchpress implements several of the state of the arts structure learning algorithm as well as data and parameter sampling algorithms and benchmarking metrics.
Benchpress is interfaced via the file config.json.
Example figures are generated using `JSON Editor Online <https://jsoneditoronline.org>`_.

Getting started
###############


Requirements
^^^^^^^^^^^^

* `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ (`installation instructions <https://docs.docker.com/engine/install/>`_)
* `Docker <https://www.docker.com/>`_ (`installation instructions <https://docs.docker.com/engine/install/>`_)
* `Singularity <https://docs.docker.com/engine/install/>`_  (`installation instructions <https://sylabs.io/guides/3.6/admin-guide/installation.html>`_)
* Linux/Unix (Singularity currently only has a Beta release for OSX which is not enough)


Cloning the repository
^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: bash

    $ git clone git@github.com:felixleopoldo/benchpress.git && cd benchpress

Example: ROC curve estimation
^^^^^^^^^^^^^^^^^^^^^^^^^^^
This example plots oc curves for some of the available structure learning algorithms is pre-configured in config.sample.json.
The algorithms a ran on fours different types of datasets.
To run the configuration copy :download:`config.sample.json <../../config.sample.json>` to config.json by

.. code-block:: bash

    $ cp config.sample.json config.json

and run the snakemake taget roc with 2 cores and singularity enabled as

.. code-block:: bash

    $ snakemake roc --cores 2 --use-singularity

This will produce the plot below

.. image:: _static/ROC.png
   :width: 600


Available graph sources
###########################################

Random restricted directed acyclic graph
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"""
Key 
"""
    generateDAGMaxParents

""""""""""""
Description
"""""""""""""
Generates a random directed acyclic graph with restricted average number of parents.

Parameters
""""""""""
    av_parents
    dims

Source
""""""

JSON schema
"""""""""""
https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md

Example
"""""""


.. code-block:: json

    {
        "id": "generateDAGMaxParents",
        "av_parents": 2,
        "dims": 80
    }


Adjacency matrix .csv file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^




Available parameter sources
################################################



Available data sources
################################################


Understanding config.json
#############################


config.json is required to consist of six main keys, seen below 

.. image:: _static/maincats.png
   :width: 600


output_dir
==========

This is the directory where all the output will be stored (should be files/ at the moment).



benchmark_setup
===============

This is where the benchmark_setup is made. 


data_sampling_algorithms
=========================

Contains the aviliable data sampling algorithms.


parameters_sampling_algorithms
==============================


graph_sampling_algorithms
=========================

structure_learning_algorithms
=============================

