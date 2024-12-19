


:og:description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
 
.. meta::
    :title: temporal PC 
    :description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.


.. _bips_tpc: 

bips_tpc 
************



.. list-table:: 

   * - Package
     - `tpc <https://github.com/bips-hb/tpc>`__
   * - Version
     - 137e18b
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://github.com/bips-hb/tpc>`__
   * - Paper
     - :footcite:t:`andrews2023practicalguidecausaldiscovery`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Docker 
     - `bpimages/bips_tpc:137e18b-amd64 <https://hub.docker.com/r/bpimages/bips_tpc/tags>`__

   * - Module folder
     - `bips_tpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bips_tpc>`__



temporal PC 
---------------


This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available. Our implementation is a modified version of pc from the pcalg package (Kalisch et al. 2012) with the following additional options:

It also supports the Multiple Imputation for Causal Graph Discovery (micd) package.
Which is and add-on to the R package pcalg for handling missing data in contrataint-based causal graph discovery. Supports continuous, discrete and mixed data. Two options are available: 1) gaussCItwd, disCItwd and mixCItwd perform test-wise deletion, where missing observations are deleted as necessary on a test-by-test basis; 2) [not in Benchpress yet] gaussMItest, disMItest and mixedMItest perform conditional independence tests on multiply imputed data. 


.. rubric:: Example 

Config file: `bips_tpc.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/bips_tpc/bips_tpc.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/bips_tpc/bips_tpc.json


.. rubric:: Example 

Config file: `bips_tpc.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/bips_tpc/config/bips_tpc.json>`_


:numref:`bips_tpcplot` and :numref:`bips_tpcplot2`  show FP/P vs. TP/P for pattern graphs and skeletons based on 3 datsets corresponding to 3 realisations of a 20-variables random Gaussian SEM, with an average indegree of 4.
Each dataset contains 10000 samples and contains data that is missing not at random (MNAR) and was sampled using :ref:`mvpc_gen_data`.


.. _bips_tpcplot:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/bips_tpc/pattern.png
    :width: 320 
    :alt: FP/P vs. TP/P tPC example
    :align: left

    FP/P vs. TP/P. for pattern graphs

.. _bips_tpcplot2:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/bips_tpc/skeleton.png
    :width: 320 
    :alt: FP/P vs. TP/P tPC example
    :align: right

    FP/P vs. TP/P. for  skeletons



.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing :ref:`edge_constraints` 
* ``indepTest`` gaussCItest, binCItest, disCItest, gaussCItwd, disCItwd, mixCItwd 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "tpc",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "mmax": "Inf",
        "conservative": false,
        "majrule": true,
        "numCores": 1,
        "cl_type": "PSOCK",
        "verbose": false,
        "indepTest": "gaussCItwd",
        "timeout": null,
        "edgeConstraints": null
      }
    ]

.. footbibliography::

