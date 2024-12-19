This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available. Our implementation is a modified version of pc from the pcalg package (Kalisch et al. 2012) with the following additional options:

It also supports the Multiple Imputation for Causal Graph Discovery (micd) package.
Which is and add-on to the R package pcalg for handling missing data in contrataint-based causal graph discovery. Supports continuous, discrete and mixed data. Two options are available: 1) gaussCItwd, disCItwd and mixCItwd perform test-wise deletion, where missing observations are deleted as necessary on a test-by-test basis; 2) gaussMItest, disMItest and mixMItest perform conditional independence tests on multiply imputed data. 


.. rubric:: Example 

Config file: `bips_tpc.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/bips_tpc/bips_tpc.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/bips_tpc/bips_tpc.json

:numref:`bips_tpcplot` and :numref:`bips_tpcplot2`  show FP/P vs. TP/P for pattern graphs and skeletons based on 3 datsets corresponding to 3 realisations of a 20-variables random Gaussian SEM, with an average indegree of 4.
Each dataset contains 10000 samples and has values that are missing not at random (MNAR), sampled using :ref:`mvpc_gen_data`.


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

