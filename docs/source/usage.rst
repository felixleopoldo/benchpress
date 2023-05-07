Usage 
**********************

Here we describe some basic commands to get you started using Benchpress. 
Depending on if you use  `Docker <https://www.docker.com/>`_ or if you have installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_  and `Apptainer <https://apptainer.org/>`_ natively, follow one of the alternatives below.

Docker
######

Start an interactive `Docker <https://www.docker.com/>`_ container (based on the `official Snakemake docker image <https://hub.docker.com/r/snakemake/snakemake>`_) in privileged mode, where the benchpress folder (absolute path) is shared as a volume, here to the folder /mnt which is also set to the working directory.

.. prompt:: bash

    docker run -it -w /mnt --privileged -v /absolute/path/to/benchpress:/mnt snakemake/snakemake:stable

Depending on your system, you may have to prepend the above command by *sudo*. 
On Windows, you may have to escape spaces in the benchpress path using ^ or \`.

Linux without Docker
#####################

If you installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ by using `Conda <https://www.anaconda.com/>`_ as suggested by `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_, you first need to activate the conda environment called *snakemake*.
First head into the benchpress folder by

.. prompt:: bash

    cd path/to/benchpress

then run

.. prompt:: bash

    conda activate snakemake
    

Run config file 
################

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
