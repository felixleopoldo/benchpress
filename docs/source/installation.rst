Installation
#######################

.. As Benchpress is a Snakemake worlflow, you only have to download the workflow folder and run it, i.e. no extra installation is required.
.. However, 

Benchpress is built up of by a collection of modules which stem from a variety of packages, libraries, and open-source software.
In order to maintain reproducibility, and at the same time save the user the time from manually installing each these, Benchpress relies on Snakemake's support for Docker containers through Apptainer and runs the modules in separate containers.

You can either install Apptainer natively on a `Linux <https://en.wikipedia.org/wiki/Linux>`_ system or you can use  the official `Snakemake Docker image <https://hub.docker.com/r/snakemake/snakemake/tags>`_, where Apptainer is installed, and run Benchpress through an interactive `Docker <https://www.docker.com/>`_ container.

Ones Apptainer and Snakemake is in place, there is no further installtion of the workflow as such.
In either of the alternatives, the first step is to clone the Benchpress repository to a directiry of your choice (*path/to/benchpress*)



.. prompt:: bash

    git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress


Docker (Linux/macOS/Win)
-----------------------------

For this alternative, you only have to install `Docker <https://www.docker.com/>`_, following the instructions for your specific OS.
This is usually the easiest way to get started using Benchpress and it works for any platform supporting `Docker <https://www.docker.com/>`_.

.. _linuxx:

Without Docker (Linux)
----------------------

This alternative is preferred e.g. if you will add a new module or if you are working on a shared system that doesn't support `Docker <https://www.docker.com/>`_ (typically for security reasons).

1. Install `Anaconda <https://www.anaconda.com/>`_ (or miniconda) from `here <https://docs.conda.io/en/main/miniconda.html>`_.
2. Install `Snakemake >= 7.14 <https://snakemake.readthedocs.io/en/stable/>`_ following the `installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_.
3. Install `Apptainer (former Singularity) <https://apptainer.org/>`_  following the `installation instructions <https://apptainer.org/docs/admin/main/installation.html#install-from-pre-built-packages>`_.

.. note:: 

    Some systems require explicit installation of *squashfs-tools*, which can be installed by conda as

        $ conda install -c conda-forge squashfs-tools
