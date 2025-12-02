


:og:description: Notears Nonlinear. Include notears-mlp and notears-sob. A gradient-based algorithm using neural network or Sobolev space modeling for non-linear causal relationships.  .. rubric:: Example   Config file: `gcastle_nonlinear.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle_nonlinear.json>`_  Command:  .. code:: bash      snakemake --cores all --use-apptainer --configfile config/gcastle_nonlinear.json  :numref:`gcastlenonlinearplot` and :numref:`gcastlenonlinearquadplot` show the pattern graph's FP/P vs. TP/P benchmark results for gCastle algorithms, and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`, tested on nonlinear data. The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random nonlinear Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5).  The nonlinear relationships are modeled using multi-layer perceptrons (MLP) and quadratic functions, see :ref:`gcastle_iidsim`. Each dataset contains 300 standardized samples.  The SEM parameters are uniformly sampled from [0.25, 1].  .. _gcastlenonlinearplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks_nonlinear_anm.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data     :align: left      FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data.  .. _gcastlenonlinearquadplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks_nonlinear_quadratic.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data     :align: right      FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data.  
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: NO TEARS non-linear (gCastle)
 
.. meta::
    :title: NO TEARS non-linear (gCastle)
    :description: Notears Nonlinear. Include notears-mlp and notears-sob. A gradient-based algorithm using neural network or Sobolev space modeling for non-linear causal relationships.  .. rubric:: Example   Config file: `gcastle_nonlinear.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle_nonlinear.json>`_  Command:  .. code:: bash      snakemake --cores all --use-apptainer --configfile config/gcastle_nonlinear.json  :numref:`gcastlenonlinearplot` and :numref:`gcastlenonlinearquadplot` show the pattern graph's FP/P vs. TP/P benchmark results for gCastle algorithms, and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`, tested on nonlinear data. The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random nonlinear Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5).  The nonlinear relationships are modeled using multi-layer perceptrons (MLP) and quadratic functions, see :ref:`gcastle_iidsim`. Each dataset contains 300 standardized samples.  The SEM parameters are uniformly sampled from [0.25, 1].  .. _gcastlenonlinearplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks_nonlinear_anm.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data     :align: left      FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data.  .. _gcastlenonlinearquadplot:  .. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks_nonlinear_quadratic.png     :width: 640     :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data     :align: right      FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data.  


.. _gcastle_notears_nonlinear: 

NO TEARS non-linear (gCastle) 
******************************



.. list-table:: 

   * - Module name
     - `gcastle_notears_nonlinear <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_notears_nonlinear>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-13>`__
   * - Paper
     - :footcite:t:`pmlr-v108-zheng20a`
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




NO TEARS non-linear 
-----------------------


Notears Nonlinear. Include notears-mlp and notears-sob. A gradient-based algorithm using neural network or Sobolev space modeling for non-linear causal relationships.

.. rubric:: Example 

Config file: `gcastle_nonlinear.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle_nonlinear.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-apptainer --configfile config/gcastle_nonlinear.json

:numref:`gcastlenonlinearplot` and :numref:`gcastlenonlinearquadplot` show the pattern graph's FP/P vs. TP/P benchmark results for gCastle algorithms, and comparison with :ref:`tetrad_boss` and :ref:`bidag_itsearch`, tested on nonlinear data.
The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random nonlinear Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5). 
The nonlinear relationships are modeled using multi-layer perceptrons (MLP) and quadratic functions, see :ref:`gcastle_iidsim`.
Each dataset contains 300 standardized samples. 
The SEM parameters are uniformly sampled from [0.25, 1].

.. _gcastlenonlinearplot:

.. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks_nonlinear_anm.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data
    :align: left

    FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data.

.. _gcastlenonlinearquadplot:

.. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks_nonlinear_quadratic.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data
    :align: right

    FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data.





.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_notears_mlp",
        "lambda1": 0.01,
        "lambda2": 0.01,
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.3,
        "bias": true,
        "model_type": "mlp",
        "device_type": "cpu",
        "device_ids": null,
        "timeout": null
      },
      {
        "id": "gcastle_notears_sob",
        "lambda1": 0.01,
        "lambda2": 0.01,
        "max_iter": 100,
        "h_tol": "1e-8",
        "rho_max": "1e+16",
        "w_threshold": 0.3,
        "bias": true,
        "model_type": "sob",
        "device_type": "cpu",
        "device_ids": null,
        "timeout": null
      }
    ]

.. footbibliography::

