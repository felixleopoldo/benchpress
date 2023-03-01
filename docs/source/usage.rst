Usage 
**********************

Here we describe some basic steps to get you started on your local machine or on a server. 
However, Snakemake workflows *"..can be seamlessly scaled to server, cluster, grid and cloud environments, without the need to modify the workflow definition."*
See the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/index.html>`__ for `cluster <https://snakemake.readthedocs.io/en/stable/executing/cluster.html>`__ and `cloud <https://snakemake.readthedocs.io/en/stable/executing/cloud.html>`__ execution.

First head into the benchpress folder by

.. prompt:: bash

    cd path/to/benchpress

Depending on if you use  `Docker <https://www.docker.com/>`_ or if you have installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_  and `Apptainer (or Singularity) <https://apptainer.org/>`_ natively, proceed as below.

Docker
######

Start an interative `Docker <https://www.docker.com/>`_ container in priviliged mode, where the benchpress folder is shared as a volume (here to the folder /mnt which is also set to the working directory).

.. prompt:: bash

    docker run -it -w /mnt --privileged -v $(pwd):/mnt snakemake/snakemake:stable

Depending on your system, you may have to prepend the above command by *sudo*. 

Linux without Docker
#####################

If you installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ by using `Conda <https://www.anaconda.com/>`_ as suggested by `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_, you first need to activate the conda environment called *snakemake*.


.. prompt:: bash

    conda activate snakemake
    

Run config file 
################

Benchpress built so that all the interation with the user is done through a config file, on a specific format. 
Here we describe the simplest commands to get started to run Benchpress locally using *all* available cores, whether you use Docker or run on directly on your machine.
For info about e.g. cloud or cluster execution, please review the documentation of Snakemake.


To run the config file `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`_ type


.. prompt:: bash

    snakemake --cores all --use-singularity --configfile config/config.json

The output is stored in subfolders of *path/to/benchpress/results/output* named by the evaluation modules.
Note that the first run will take some more time as about 20 GB of `Docker <https://www.docker.com/>`_ images will be downloaded.

.. Depending on if you are using `Docker <https://www.docker.com/>`_ or run directly on `Linux <https://en.wikipedia.org/wiki/Linux>`_ you need to perform one of the initial steps below.
