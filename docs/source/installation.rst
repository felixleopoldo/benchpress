Installation
#######################

.. As Benchpress is a Snakemake worlflow, you only have to download the workflow folder and run it, i.e. no extra installation is required.
.. However, 

Benchpress relies on a number of modules from a several packages and libraries so in order to save the user the time from explicitly installing each of them on their own, Benchpress relies on Snakemake's support for running Docker containers through Apptainer.

.. Apptainer, for sequrity reasons runs only on Linux systems.

.. However, for other systems you can run Snakemake through Docker and the official Snakemake container (where Appatainer is installed).

You can either run Benchpress directly on a `Linux <https://en.wikipedia.org/wiki/Linux>`_ system or in a `Docker <https://www.docker.com/>`_ container created from the official `Snakemake Docker image <https://hub.docker.com/r/snakemake/snakemake/tags>`_.
In either of the alternatives, the first step is to clone the Benchpress repository


.. prompt:: bash

    git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

.. You can either run Benchpress in a Docker contaier or directly on a Linux system.



Docker (Linux/macOS/Win)
-----------------------------

.. Benchpress cannot run directly on `macOS <https://en.wikipedia.org/wiki/MacOS>`_/`Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_ as it requires `Apptainer <https://apptainer.org/>`_ which is only supported by `Linux <https://en.wikipedia.org/wiki/Linux>`_ systems. 


.. 1. Download Benchpress 

..     .. prompt:: bash

..         git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress  

For this alternative, you only have to install `Docker <https://www.docker.com/>`_, following the instructions for your specific OS.
This is usually the easiest way to get started using Benchpress and it works for any platform supporting `Docker <https://www.docker.com/>`_.

.. 2. Install `Ubuntu <https://ubuntu.com/>`_ on `VirtualBox <https://www.virtualbox.org/>`__ following `these instructions <https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview>`_. Create a dynamic hard drive with about 40 GB of space. 
.. 3. Share *path/to/benchpress* on `macOS <https://en.wikipedia.org/wiki/MacOS>`_/`Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_ folder to the virtual machine at *path/to/sharedfolder* using `this guide <https://carleton.ca/scs/tech-support/troubleshooting-guides/creating-a-shared-folder-in-virtualbox/>`_ and change the permission using `this <https://dev.to/rahedmir/virtualbox-cannot-access-shared-folder-items-permission-denied-fixed-59mi>`_ guide.
.. 4. Do steps 2-4 for :ref:`linuxx` on the virtual `Ubuntu <https://ubuntu.com/>`_ machine.

.. _linuxx:

Without Docker (Linux)
----------------------

This alternative is preferred e.g. if you will add a new module or if are working on a shared system, since they typically don't support `Docker <https://www.docker.com/>`_ for security reasons.

.. 1. Download Benchpress

..     .. prompt:: bash

..         git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

1. Install `Anaconda <https://www.anaconda.com/>`_ (or miniconda) from `here <https://docs.conda.io/en/main/miniconda.html>`_.
2. Install `Snakemake >= 7.14 <https://snakemake.readthedocs.io/en/stable/>`_ following the `installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_.
3. Install `Apptainer (former Singularity) <https://apptainer.org/>`_  following the `installation instructions <https://apptainer.org/docs/admin/main/installation.html#install-from-pre-built-packages>`_.

.. note:: 

    Some systems require explicit installation of *squashfs-tools*, which can be installed by conda as

        $ conda install -c conda-forge squashfs-tools
