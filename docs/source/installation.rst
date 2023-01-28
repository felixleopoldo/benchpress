Installation
#######################

The first step is to clone the Benchpress repository

.. prompt:: bash

    git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

.. You can either run Benchpress in a Docker contaier or directly on a Linux system.
You can either run Benchpress directly on a `Linux <https://en.wikipedia.org/wiki/Linux>`_ system or in a `Docker <https://www.docker.com/>`_ container created from the official `Snakemake Docker image <https://hub.docker.com/r/snakemake/snakemake/tags>`_.


Docker 
-------------

.. Benchpress cannot run directly on `macOS <https://en.wikipedia.org/wiki/MacOS>`_/`Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_ as it requires `Apptainer <https://apptainer.org/>`_ which is only supported by `Linux <https://en.wikipedia.org/wiki/Linux>`_ systems. 


.. 1. Download Benchpress 

..     .. prompt:: bash

..         git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress  

Install `Docker <https://www.docker.com/>`_ following the instructions for your specific OS.

.. 2. Install `Ubuntu <https://ubuntu.com/>`_ on `VirtualBox <https://www.virtualbox.org/>`__ following `these instructions <https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview>`_. Create a dynamic hard drive with about 40 GB of space. 
.. 3. Share *path/to/benchpress* on `macOS <https://en.wikipedia.org/wiki/MacOS>`_/`Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_ folder to the virtual machine at *path/to/sharedfolder* using `this guide <https://carleton.ca/scs/tech-support/troubleshooting-guides/creating-a-shared-folder-in-virtualbox/>`_ and change the permission using `this <https://dev.to/rahedmir/virtualbox-cannot-access-shared-folder-items-permission-denied-fixed-59mi>`_ guide.
.. 4. Do steps 2-4 for :ref:`linuxx` on the virtual `Ubuntu <https://ubuntu.com/>`_ machine.

.. _linuxx:

Linux without Docker
----------------------

.. 1. Download Benchpress

..     .. prompt:: bash

..         git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

1. Install `Anaconda <https://www.anaconda.com/>`_ (or miniconda) from `here <https://docs.conda.io/en/main/miniconda.html>`_.
2. Install `Snakemake >= 7.14 <https://snakemake.readthedocs.io/en/stable/>`_ following the `installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_.
3. Install `Apptainer (former Singularity) <https://apptainer.org/>`_  following the `installation instructions <https://apptainer.org/docs/admin/main/installation.html#installation-on-linux>`_.

.. note:: 

    Some systems require explicit installation of *squash-tools*, which can be installed by conda as

        $ conda install -c conda-forge squash-tools
