.. role:: bash(code)
   :language: bash


Overview
#########

.. Benchpress is a Snakemake workflow based on a collection of modules which stem from various different packages, libraries, and open-source software.

Benchpress is a `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ workflow based on a collection packages, libraries, and open-source software related to structure learning for graphical models.
It is designed in a modular way separating, graph (:ref:`graph`), parameterization (:ref:`parameters`) and data sampling (:ref:`data`), from structure learning (:ref:`structure_learning_algorithms`) and performance evaluation (:ref:`evaluation`), so that it *"..can be seamlessly scaled to server, cluster, grid and cloud environments, without the need to modify the workflow definition."*, following the `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ principles.
In order to maintain reproducibility and to save the user from manually installing each of the used software, Benchpress relies on `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_'s support for `Apptainer <https://apptainer.org/>`_ and runs by default each of the modules in separate containers.

Installation
#######################

.. The first alternative is to use the official `Snakemake Docker image <https://hub.docker.com/r/snakemake/snakemake/tags>`_, where `Apptainer <https://apptainer.org/>`_ is installed, and run Benchpress through an interactive `Docker <https://www.docker.com/>`_ container.
.. The second alternative is to install `Apptainer <https://apptainer.org/>`_ natively on a `Linux <https://en.wikipedia.org/wiki/Linux>`_ system.

.. For either of the alternatives, 

The first step is to install `git <https://git-scm.com/downloads>`_ and clone the Benchpress  repository to a directory of choice (*path/to/benchpress*)

.. Ones `Apptainer <https://apptainer.org/>`_ and Snakemake is in place, there is no further installtion of the workflow as such.


.. prompt:: bash

    git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

Note that, git is not a requirement but it is highly recommended as it will make it easier to keep you updated with the latest updates using the command *git pull* and to add new modules.

As soon as `Apptainer <https://apptainer.org/>`_ and `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ are available, no further installation is required and you are ready to run Benchpress.
Here we describe two ways to get these in place on your server or local machine.

Docker (Linux/macOS/Win)
-----------------------------

For this alternative, you only have to install `Docker <https://www.docker.com/>`_, following the instructions for your specific system.
This is usually the easiest way to get started and it works for any platform supporting `Docker <https://www.docker.com/>`_.
You may configure the amount of resources (memory, cores, disk,... ) to be used through the `Docker <https://www.docker.com/>`_ interface.

.. _linuxx:

Without Docker (Linux)
----------------------

This alternative is preferred e.g. if you will add new modules or if you are working on a server that doesn't support `Docker <https://www.docker.com/>`_ (typically for security reasons).

1. Install `Anaconda <https://www.anaconda.com/>`_ (or miniconda) from `here <https://docs.conda.io/en/main/miniconda.html>`_.
2. Install `Snakemake >= 7.14 <https://snakemake.readthedocs.io/en/stable/>`_ following the `installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_.
3. Install `Apptainer (former Singularity) <https://apptainer.org/>`_  following the `installation instructions <https://apptainer.org/docs/admin/main/installation.html#install-from-pre-built-packages>`_.

.. note:: 

    Some systems require explicit installation of *squashfs-tools*, which can be installed by conda as

        $ conda install -c conda-forge squashfs-tools

.. note::

    For cloud or cluster execution however, softwares such as `Kubernetes <https://kubernetes.io/>`_ or `Slurm <https://slurm.schedmd.com/documentation.html>`_ may also be required.
    See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/>`_  for further information.
