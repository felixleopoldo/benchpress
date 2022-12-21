Usage
#######################


To run the config file `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`_ type


.. code-block:: bash

    (base) $ conda activate snakemake
    (snakemake) $ cd path/to/benchpress
    (snakemake) $ snakemake --cores all --use-singularity --configfile config/config.json


If you are using VirtualBox, this command should run in the shared benchpress folder *path/to/sharedfolder* instead of *path/to/benchpress*. 

The output files are stored in *path/to/benchpress/results/output*.

