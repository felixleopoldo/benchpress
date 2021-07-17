Installation
###############


Requirements
************

* `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ (`installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_)
* `Singularity <https://docs.docker.com/engine/install/>`_  (`installation instructions <https://sylabs.io/guides/3.6/admin-guide/installation.html>`_)
* Linux/Unix (Singularity currently only has a Beta release for OSX which is not enough)

.. note:: 

    Some systems require explicit installation of squash-tools in order to run docker with singularity. 
    This can be done using conda by
    
        $ conda install -c conda-forge squash-tools

Installation and usage
**********************

To download and run benchpress with the config file :download:`config/sec6.1.json <../../config/sec6.1.json>` type

.. code-block:: bash

    $ git clone https://github.com/felixleopoldo/benchpress.git     
    $ cd benchpress
    $ snakemake --cores 70 --use-singularity --configfile config/sec6.1.json


