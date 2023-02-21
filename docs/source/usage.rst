Usage 
**********************

First head into the benchpress folder by

.. prompt:: bash

    cd path/to/benchpress

Depending on if you use  `Docker <https://www.docker.com/>`_ or if you have installed `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_  and `Apptainer (or Singularity) <https://apptainer.org/>`_ on your own machine, proceed as below.

Docker
######

Start an interative `Docker <https://www.docker.com/>`_ container in the priviliged mode, where the benchpress folder is shared as a volume (here to the folder /mnt).

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


To run the config file `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`_ type


.. prompt:: bash

    snakemake --cores all --use-singularity --configfile config/config.json

The output is stored in subfolders of *path/to/benchpress/results/output* named by the evaluation modules.
Note that the first run will take some more time as about 20 GB of `Docker <https://www.docker.com/>`_ images will be downloaded.

.. Depending on if you are using `Docker <https://www.docker.com/>`_ or run directly on `Linux <https://en.wikipedia.org/wiki/Linux>`_ you need to perform one of the initial steps below.
