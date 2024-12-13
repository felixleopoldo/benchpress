


    .. meta::
        :title: tPC 
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



tPC 
-------


This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available. Our implementation is a modified version of pc from the pcalg package (Kalisch et al. 2012) with the following additional options:

It also supports the Multiple Imputation for Causal Graph Discovery (micd) package.
Which is and add-on to the R package pcalg for handling missing data in contrataint-based causal graph discovery. Supports continuous, discrete and mixed data. Two options are available: 1) gaussCItwd, disCItwd and mixedCItwd perform test-wise deletion, where missing observations are deleted as necessary on a test-by-test basis; 2) gaussMItest, disMItest and mixedMItest perform conditional independence tests on multiply imputed data. Each of these functions can be used as a plug-in to pcalg::skeleton, pcalg::pc or pcalg::fci.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


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
        "indepTest": "gaussCItwd",
        "mmax": "Inf",
        "conservative": false,
        "majrule": false,
        "solveconfl": false,
        "verbose": false,
        "timeout": null,
        "edgeConstraints": null
      }
    ]

.. footbibliography::

