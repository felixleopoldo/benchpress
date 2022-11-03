Installation and usage
#######################


See also `this <https://medium.com/@felixleopoldorios/structure-learning-using-benchpress-826847db0aa8>`_ `Medium <https://medium.com/>`_ story on how to get started.

Installation
************

Linux
******

1. Download Benchpress

    .. code-block:: bash

        $ git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress

2. Install `Anaconda <https://www.anaconda.com/>`_ (or miniconda) from `here <https://docs.conda.io/en/main/miniconda.html>`_
3. Install `Snakemake >= 7.14 <https://snakemake.readthedocs.io/en/stable/>`_ following the `installation instructions <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>`_
4. Install `Apptainer (former Singularity) <https://apptainer.org/>`_  following the `installation instructions <https://apptainer.org/docs/admin/main/installation.html#installation-on-linux>`_

.. note:: 

    Some systems require explicit installation of *squash-tools*, which can be installed by conda as

        $ conda install -c conda-forge squash-tools


macOS/Windows
***************

Benchpress cannot run directly on macOS/Windows as it requires Apptainer which is only supported by Linux systems. However, Linux can be installed (and the requirements above) on a virtual machine via e.g. VirtualBox.

1. Download Benchpress 

    .. code-block:: bash

        $ git clone https://github.com/felixleopoldo/benchpress.git path/to/benchpress  

2. Install Ubuntu on `VirtualBox <https://www.virtualbox.org/>`_ following `these instructions <https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview>`_. Create a dynamic hard drive with about 40 GB of space. 
3. Share *path/to/benchpress* on macOS/Windows folder to the virtual machine at *path/to/sharedfolder* using `this guide <https://carleton.ca/scs/tech-support/troubleshooting-guides/creating-a-shared-folder-in-virtualbox/>`_ and change the permission using `this <https://dev.to/rahedmir/virtualbox-cannot-access-shared-folder-items-permission-denied-fixed-59mi>`_ guide 
4. Do steps 2-4 for Linux on the virtual Ubuntu machine.

Usage
**********

To run the config file `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`_ type

.. code-block:: bash

    (base) $ conda activate snakemake
    (snakemake) $ cd path/to/benchpress
    (snakemake) $ snakemake --cores all --use-singularity --configfile config/config.json


If you are using VirtualBox, this command should run in the shared benchpress folder *path/to/sharedfolder* instead of *path/to/benchpress*. 

The output files are stored in *path/to/benchpress/results/output*.

