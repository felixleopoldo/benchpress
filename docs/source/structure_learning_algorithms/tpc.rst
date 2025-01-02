


    .. meta::
        :title: tPC 
        :description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.
    

.. _tpc: 

tpc 
*******



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
     - :footcite:t:`mykey`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Docker 
     - `bpimages/tpc:137e18b <https://hub.docker.com/r/bpimages/tpc/tags>`__

   * - Module folder
     - `tpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tpc>`__



tPC 
-------


This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available. Our implementation is a modified version of pc from the pcalg package (Kalisch et al. 2012) with the following additional options:

It also supports the Multiple Imputation for Causal Graph Discovery (micd) package.
Which is and add-on to the R package pcalg for handling missing data in contrataint-based causal graph discovery. Supports continuous, discrete and mixed data. Two options are available: 1) gaussCItwd, disCItwd and mixedCItwd perform test-wise deletion, where missing observations are deleted as necessary on a test-by-test basis; 2) gaussMItest, disMItest and mixedMItest perform conditional independence tests on multiply imputed data. Each of these functions can be used as a plug-in to pcalg::skeleton, pcalg::pc or pcalg::fci.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "myalg",
        "cutoff": 0.5,
        "timeout": null
      }
    ]

.. footbibliography::

