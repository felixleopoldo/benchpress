A more efficient version of NOTEARS that can reduce number of optimization iterations.

.. rubric:: Example 

Config file: `gcastle.json <https://github.com/felixleopoldo/benchpress/blob/master/config/gcastle.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-apptainer --configfile config/gcastle.json

:numref:`gcastleplot` shows the pattern graph's FP/P vs. TP/P benchmark results for 12 gCastle algorithms (and comparison with BOSS from TETRAD and BiDAG iterative search).
The benchmark is based on 5 datasets corresponding to 5 realisations of a 20-variable random Gaussian SEM with Erdős-Rényi structure (expected degree 4, max parents 5). 
Each dataset contains 300 standardized samples. 
The SEM parameters are uniformly sampled from [0.25, 1].

.. _gcastleplot:

.. figure:: https://raw.githubusercontent.com/felixleopoldo/benchpress/master/docs/source/_static/gcastle_benchmarks.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms
    :align: center

    FP/P vs. TP/P for gCastle algorithms.