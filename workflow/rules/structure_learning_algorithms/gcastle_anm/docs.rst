Nonlinear causal discovery with additive noise models.

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

.. figure:: ../../../../../docs/source/_static/gcastle_benchmarks_nonlinear_anm.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data
    :align: left

    FP/P vs. TP/P for gCastle algorithms on nonlinear MLP data.

.. _gcastlenonlinearquadplot:

.. figure:: ../../../../../docs/source/_static/gcastle_benchmarks_nonlinear_quadratic.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data
    :align: right

    FP/P vs. TP/P for gCastle algorithms on nonlinear quadratic data.