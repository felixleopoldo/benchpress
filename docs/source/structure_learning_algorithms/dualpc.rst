


:og:description: The dual PC algorithm is a novel scheme to carry out the conditional independence tests within the PC algorithm for Gaussian data, by leveraging the inverse relationship between covariance and precision matrices. The algorithm exploits block matrix inversions on the covariance and precision matrices to simultaneously perform tests on partial correlations of complementary (or dual) conditioning sets. Simulation studies indicate that the dual PC algorithm outperforms the classic PC algorithm both in terms of run time and in recovering the underlying network structure.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Dual PC (dualPC)
 
.. meta::
    :title: Dual PC (dualPC)
    :description: The dual PC algorithm is a novel scheme to carry out the conditional independence tests within the PC algorithm for Gaussian data, by leveraging the inverse relationship between covariance and precision matrices. The algorithm exploits block matrix inversions on the covariance and precision matrices to simultaneously perform tests on partial correlations of complementary (or dual) conditioning sets. Simulation studies indicate that the dual PC algorithm outperforms the classic PC algorithm both in terms of run time and in recovering the underlying network structure.


.. _dualpc: 

Dual PC (dualPC) 
*****************



.. list-table:: 

   * - Module name
     - `dualpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/dualpc>`__
   * - Package
     - `dualPC <https://github.com/enricogiudice/dualPC>`__
   * - Version
     - 
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`pmlr-v186-giudice22a`
   * - Graph type
     - `CG <https://en.wikipedia.org/wiki/Mixed_graph>`__, `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
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
     - `bpimages/dualpc:585751b <https://hub.docker.com/r/bpimages/dualpc/tags>`__




Dual PC 
-----------


The dual PC algorithm is a novel scheme to carry out the
conditional independence tests within the PC algorithm for Gaussian data, by leveraging the
inverse relationship between covariance and precision matrices. The algorithm exploits block
matrix inversions on the covariance and precision matrices to simultaneously perform tests on
partial correlations of complementary (or dual) conditioning sets. Simulation studies indicate
that the dual PC algorithm outperforms the classic PC algorithm both in terms of run time
and in recovering the underlying network structure.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "dualpc",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "skeleton": false,
        "max_ord": null,
        "timeout": null
      }
    ]

.. footbibliography::

