This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available. Our implementation is a modified version of pc from the pcalg package (Kalisch et al. 2012) with the following additional options:

It also supports the Multiple Imputation for Causal Graph Discovery (micd) package.
Which is and add-on to the R package pcalg for handling missing data in contrataint-based causal graph discovery. Supports continuous, discrete and mixed data. Two options are available: 1) gaussCItwd, disCItwd and mixCItwd perform test-wise deletion, where missing observations are deleted as necessary on a test-by-test basis; 2) [not in Benchpress yet] gaussMItest, disMItest and mixedMItest perform conditional independence tests on multiply imputed data. 


.. rubric:: Example 

Config file: `tpc.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/bips_tpc/config/tpc.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/bips_tpc/config/tpc.json
