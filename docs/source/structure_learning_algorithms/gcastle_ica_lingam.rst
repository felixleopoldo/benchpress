


:og:description: Independent component analysis for linear non-Gaussian acyclic models
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: ICA-LiNGAM (gCastle)
 
.. meta::
    :title: ICA-LiNGAM (gCastle)
    :description: Independent component analysis for linear non-Gaussian acyclic models


.. _gcastle_ica_lingam: 

ICA-LiNGAM (gCastle) 
*********************



.. list-table:: 

   * - Module name
     - `gcastle_ica_lingam <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_ica_lingam>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-2>`__
   * - Paper
     - :footcite:t:`10.5555/1248547.1248619`
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




Independent component analysis for linear non-Gaussian acyclic models 
-------------------------------------------------------------------------


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



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_ica_lingam",
        "thresh": 0.3,
        "random_state": null,
        "max_iter": 1000,
        "timeout": null
      }
    ]

.. footbibliography::

