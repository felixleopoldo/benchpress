.. role:: bash(code)
   :language: bash


Overview
#########

.. Benchpress is a Snakemake workflow based on a collection of modules which stem from various different packages, libraries, and open-source software.

Benchpress is a `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ workflow based on a collection of packages, libraries, and open-source software related to structure learning for graphical models.
It is designed in a modular way, separating graph (:ref:`graph`), parameterization (:ref:`parameters`), and data sampling (:ref:`data`), from structure learning (:ref:`structure_learning_algorithms`) and performance evaluation (:ref:`evaluation`), so that it *"..can be seamlessly scaled to server, cluster, grid and cloud environments, without the need to modify the workflow definition."*, following the `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ principles.
In order to maintain reproducibility and to save the user from manually installing each of the used software, Benchpress relies on `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_'s support for `Apptainer <https://apptainer.org/>`_ and runs by default each of the modules in separate containers.

Installation
#######################

.. The first alternative is to use the official `Snakemake Docker image <https://hub.docker.com/r/snakemake/snakemake/tags>`_, where `Apptainer <https://apptainer.org/>`_ is installed, and run Benchpress through an interactive `Docker <https://www.docker.com/>`_ container.
.. The second alternative is to install `Apptainer <https://apptainer.org/>`_ natively on a `Linux <https://en.wikipedia.org/wiki/Linux>`_ system.

.. For either of the alternatives, 

The first step is to install `git <https://git-scm.com/downloads>`_ and to clone the Benchpress repository to a directory of choice (*path/to/benchpress*)

.. Ones `Apptainer <https://apptainer.org/>`_ and Snakemake is in place, there is no further installation of the workflow as such.


.. prompt:: bash

    git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

To keep you up-to-date with the latest updates you simply do the *git pull* command in the benchpress directory.

.. Note that, `git <https://git-scm.com/downloads>`_ is not a requirement but it is highly recommended as it will make it easier to keep you updated with the latest updates using the command *git pull* and to add new modules.

As soon as `Apptainer <https://apptainer.org/>`_ and `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ are available, no further installation is required and you are ready to run Benchpress.
Here we describe two ways to get these in place. 

..  on your server or local machine.

Docker (Linux/macOS/Win)
--------------------------------

For this alternative, you only need to install `Docker <https://www.docker.com/>`_, following the instructions for your specific system.
This is usually the easiest way to get started and it works for any platform supporting `Docker <https://www.docker.com/>`_.
You may configure the resources (memory, cores, disk,... ) to be used through the `Docker <https://www.docker.com/>`_ interface.

.. _linuxx:

Without Docker (Linux)
-----------------------------

This alternative is preferred e.g. if you will add new modules or if you are working on a server that doesn't support `Docker <https://www.docker.com/>`_ (typically for security reasons).

1. Install `Anaconda <https://www.anaconda.com/>`_ (or miniconda) from `here <https://docs.conda.io/en/main/miniconda.html>`_.
2. Install `Snakemake >= 7.30.1 <https://snakemake.readthedocs.io/en/stable/>`_ following the `installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_.
3. Install `Apptainer (former Singularity) <https://apptainer.org/>`_  following the `installation instructions <https://apptainer.org/docs/admin/main/installation.html#install-from-pre-built-packages>`_.

.. note::

    If `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ was installed with `Mamba <https://anaconda.org/conda-forge/mamba>`_ (as suggested on `Snakemakes' <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_ homepage) you may update it to the latest version by running

    .. prompt:: bash

        mamba update snakemake

.. note:: 

    Some systems require explicit installation of *squashfs-tools*, which can be installed by conda as

    .. prompt:: bash

        conda install -c conda-forge squashfs-tools

.. note::

    For cloud or cluster execution however, software such as `Kubernetes <https://kubernetes.io/>`_ or `Slurm <https://slurm.schedmd.com/documentation.html>`_ may also be required.
    See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/>`_  for further information.


Usage 
######

Here we describe some basic commands to get you started using Benchpress. 
Depending on if you use  `Docker <https://www.docker.com/>`_ or if you have installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_  and `Apptainer <https://apptainer.org/>`_ natively, follow one of the alternatives below.

Docker
--------

Start an interactive `Docker <https://www.docker.com/>`_ container (based on the `official Snakemake docker image <https://hub.docker.com/r/snakemake/snakemake>`_) in privileged mode, where the benchpress folder (absolute path) is shared as a volume, here to the folder /mnt which is also set to the working directory.

.. prompt:: bash

    docker run -it -w /mnt --privileged -v /absolute/path/to/benchpress:/mnt bpimages/snakemake:v7.32.3

Depending on your system, you may have to prepend the above command by *sudo*. 
On Windows, you may have to escape spaces in the benchpress path using ^ or \`.

Linux without Docker
----------------------

If you installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ by using `Conda <https://www.anaconda.com/>`_ as suggested by `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_, you first need to activate the conda environment called *snakemake*.
First head into the benchpress folder by

.. prompt:: bash

    cd path/to/benchpress

then run

.. prompt:: bash

    conda activate snakemake
    

Run config file 
----------------

Benchpress is designed to handle all the user interaction through a `JSON <https://www.json.org/json-en.html>`__ config file, on a specific format that is described in :ref:`json_config`. 
The following command runs the config file `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`_, whether you use `Docker <https://www.docker.com/>`_ or run natively on your machine, using *all* available cores

.. prompt:: bash

    snakemake --cores all --use-singularity --configfile config/config.json

The output is stored in subfolders of *path/to/benchpress/results/output* named by the evaluation modules.
Note that the first run will take some longer time, as about 5-10 GB of `Docker <https://www.docker.com/>`_ images will be downloaded.

To use other modules, you may copy the `JSON <https://www.json.org/json-en.html>`__ snippets from the documentation (:ref:`graph`, :ref:`parameters`, :ref:`data`, :ref:`structure_learning_algorithms`, :ref:`evaluation`) and paste them into your config file.
It may also be helpful to look into the other config files in `config/ <https://github.com/felixleopoldo/benchpress/blob/master/config/>`_.

.. note::

    For `cluster <https://snakemake.readthedocs.io/en/stable/executing/cluster.html>`__ and `cloud <https://snakemake.readthedocs.io/en/stable/executing/cloud.html>`__ execution, please review the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/index.html>`__ for the commands to use.


.. Depending on if you are using `Docker <https://www.docker.com/>`_ or run directly on `Linux <https://en.wikipedia.org/wiki/Linux>`_ you need to perform one of the initial steps below.

