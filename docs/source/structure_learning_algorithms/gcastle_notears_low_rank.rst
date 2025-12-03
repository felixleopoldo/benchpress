


:og:description: Adapting NOTEARS for large problems with low-rank causal graphs.  .. rubric:: Example   Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_  Command:  .. code:: bash      snakemake --cores all --use-apptainer --configfile config/gcastle.json  :numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`). The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5).  Each dataset contains 300 standardized samples.  The SEM parameters are uniformly sampled from [0.25, 1].  .. _gcastleplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms     :align: center      FP/P vs. TP/P for gCastle algorithms.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: NO TEARS low rank (gCastle)
 
.. meta::
    :title: NO TEARS low rank (gCastle)
    :description: Adapting NOTEARS for large problems with low-rank causal graphs.  .. rubric:: Example   Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_  Command:  .. code:: bash      snakemake --cores all --use-apptainer --configfile config/gcastle.json  :numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`). The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5).  Each dataset contains 300 standardized samples.  The SEM parameters are uniformly sampled from [0.25, 1].  .. _gcastleplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms     :align: center      FP/P vs. TP/P for gCastle algorithms.


.. _gcastle_notears_low_rank: 

NO TEARS low rank (gCastle) 
****************************



.. list-table:: 

   * - Module name
     - `gcastle_notears_low_rank <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears_low_rank>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-11>`__
   * - Paper
     - :footcite:t:`https://doi.org/10.48550/arxiv.2006.05691`
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




NO TEARS low rank 
---------------------


Adapting NOTEARS for large problems with low-rank causal graphs.

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
        "id": "gcastle_notears_low_rank",
        "rank": 15,
        "w_init": null,
        "max_iter": 15,
        "h_tol": "1e-6",
        "rho_max": "1e+20",
        "w_threshold": 0.3,
        "timeout": null
      }
    ]

.. footbibliography::

