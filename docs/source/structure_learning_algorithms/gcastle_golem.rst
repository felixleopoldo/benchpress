


:og:description: Gradient-based Optimization of dag-penalized Likelihood for learning linEar dag Models
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: GOLEM (gCastle)
 
.. meta::
    :title: GOLEM (gCastle)
    :description: Gradient-based Optimization of dag-penalized Likelihood for learning linEar dag Models


.. _gcastle_golem: 

GOLEM (gCastle) 
****************



.. list-table:: 

   * - Module name
     - `gcastle_golem <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_golem>`__
   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.algorithms.html#module-12>`__
   * - Paper
     - :footcite:t:`NEURIPS2020_d04d42cd`
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




Gradient-based Optimization of dag-penalized Likelihood for learning linEar dag Models 
------------------------------------------------------------------------------------------


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

.. figure:: ../../../../../docs/source/_static/gcastle_benchmarks.png
    :width: 640
    :alt: FP/P vs. TP/P for gCastle algorithms
    :align: center

    FP/P vs. TP/P for gCastle algorithms.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gcastle_golem",
        "lambda_1": "2e-2",
        "lambda_2": 5.0,
        "equal_variances": true,
        "non_equal_variances": true,
        "learning_rate": "1e-3",
        "num_iter": "1e+5",
        "checkpoint_iter": 5000,
        "graph_thres": 0.3,
        "device_type": "cpu",
        "device_ids": 0,
        "timeout": null
      }
    ]

.. footbibliography::

