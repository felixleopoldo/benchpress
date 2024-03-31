

.. _trilearn_hyper-dir: 

trilearn_hyper-dir 
----------------------

.. rubric:: Hyper-Dirichlet

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`10.1214/aos/1176349260`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/trilearn:2.0.5 <https://hub.docker.com/r/bpimages/trilearn/tags>`__
   * - Module
     - `trilearn_hyper-dir <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/trilearn_hyper-dir>`__



.. rubric:: Description

An object of this module defines a categorical decomposable model by sampling the parameters from the hyper Dirichlet distribution, with specified equivalent sample size (``pseudo_obs``) and number of levels per variable (``n_levels``).



.. note:: 

    This module currently only supports graphs with up to 15 nodes.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "disc-loglin",
        "n_levels": 2,
        "pseudo_obs": 1.0
      }
    ]

.. footbibliography::

