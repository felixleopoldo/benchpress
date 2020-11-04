Getting started
###############


Requirements
************

* `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_ (`installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_)
* `Docker <https://www.docker.com/>`_ (`installation instructions <https://docs.docker.com/engine/install/>`_)
* `Singularity <https://docs.docker.com/engine/install/>`_  (`installation instructions <https://sylabs.io/guides/3.6/admin-guide/installation.html>`_)
* Linux/Unix (Singularity currently only has a Beta release for OSX which is not enough)

.. note:: 

    On some systems, you might also have to explicitly install squash-tools in order to run Docker with singularity. 
    squash-tools can be done using conda as
    
        $ conda install -c conda-forge squash-tools

Cloning the repository
**********************


.. code-block:: bash

    $ git clone git@github.com:felixleopoldo/benchpress.git && cd benchpress