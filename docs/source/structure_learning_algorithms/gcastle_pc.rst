


:og:description: A classic causal discovery algorithm based on conditional independence tests.  .. rubric:: Example   Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_  Command:  .. code:: bash      snakemake --cores all --use-apptainer --configfile config/gcastle.json  :numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`). The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5).  Each dataset contains 300 standardized samples.  The SEM parameters are uniformly sampled from [0.25, 1].  .. _gcastleplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms     :align: center      FP/P vs. TP/P for gCastle algorithms.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: PC (gCastle)
 
.. meta::
    :title: PC (gCastle)
    :description: A classic causal discovery algorithm based on conditional independence tests.  .. rubric:: Example   Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_  Command:  .. code:: bash      snakemake --cores all --use-apptainer --configfile config/gcastle.json  :numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`). The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5).  Each dataset contains 300 standardized samples.  The SEM parameters are uniformly sampled from [0.25, 1].  .. _gcastleplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms     :align: center      FP/P vs. TP/P for gCastle algorithms.


.. _gcastle_pc: 

PC (gCastle) 
*************



.. list-table:: 

   * - Module name
     - `gcastle_pc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_pc>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-3>`__
   * - Paper
     - :footcite:t:`kalisch2007estimating`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - No
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/gcastle:1.0.3 <https://hub.docker.com/r/bpimages/gcastle/tags>`__




PC 
------


A classic causal discovery algorithm based on conditional independence tests.

.. rubric:: Example 

Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-apptainer --configfile config/gcastle.json

:numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`).
The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5). 
Each dataset contains 300 standardized samples. 
The SEM parameters are uniformly sampled from [0.25, 1].

.. _gcastleplot:

.. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms
    :align: center

    FP/P vs. TP/P for gCastle algorithms.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_pc",
        "variant": "original",
        "alpha": 0.05,
        "ci_test": "fisherz",
        "timeout": null
      }
    ]

.. footbibliography::

