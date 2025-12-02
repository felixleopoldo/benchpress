Abstract: In recent years, several methods have been proposed for the discovery of causal structure from non-experimental data. Such methods make various assumptions on the data generating process to facilitate its identification from purely observational data. Continuing this line of research, we show how to discover the complete causal structure of continuous-valued data, under the assumptions that (a) the data generating process is linear, (b) there are no unobserved confounders, and (c) disturbance variables have non-Gaussian distributions of non-zero variances. The solution relies on the use of the statistical method known as independent component analysis, and does not require any pre-specified time-ordering of the variables.

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

.. figure:: ../../../../../docs/source/_static/gcastle_benchmarks.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms
    :align: center

    FP/P vs. TP/P for gCastle algorithms.