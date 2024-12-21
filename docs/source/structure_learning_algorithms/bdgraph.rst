


:og:description: BDgraph performs Bayesian structure learning for general undirected graphical models (decomposable and non-decomposable) with continuous, discrete, and mixed variables using MCMC.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: BDgraph (BDgraph)
 
.. meta::
    :title: BDgraph 
    :description: BDgraph performs Bayesian structure learning for general undirected graphical models (decomposable and non-decomposable) with continuous, discrete, and mixed variables using MCMC.


.. _bdgraph: 

BDgraph (BDgraph) 
******************



.. list-table:: 

   * - Module name
     - `bdgraph <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bdgraph>`__
   * - Package
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
   * - Version
     - 2.72
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BDgraph/BDgraph.pdf>`__
   * - Paper
     - :footcite:t:`JSSv089i03`, :footcite:t:`mohammadi2015bayesian`, :footcite:t:`doi:10.1080/01621459.2021.1996377`, :footcite:t:`10.1214/18-AOAS1164`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Data type
     - C, D, M
   * - Data missingness
     - `MCAR <https://en.wikipedia.org/wiki/Missing_data#Missing_completely_at_random>`__
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/bdgraph:2.72.0 <https://hub.docker.com/r/bpimages/bdgraph/tags>`__




BDgraph 
-----------


Abstract: Graphical models provide powerful tools to uncover complicated patterns in multivariate data and are commonly used in Bayesian statistics and machine learning. In this
paper, we introduce the R package BDgraph which performs Bayesian structure learning for general undirected graphical models (decomposable and non-decomposable) with
continuous, discrete, and mixed variables. The package efficiently implements recent improvements in the Bayesian literature, including that of Mohammadi and Wit (2015) :footcite:p:`mohammadi2015bayesian` and 
Dobra and Mohammadi (2018) :footcite:p:`10.1214/18-AOAS1164`. To speed up computations, the computationally intensive tasks have been implemented in C++ and interfaced with R, and the package has
parallel computing capabilities. In addition, the package contains several functions for
simulation and visualization, as well as several multivariate datasets taken from the literature and used to describe the package capabilities. The paper includes a brief overview
of the statistical methods which have been implemented in the package. The main part
of the paper explains how to use the package. Furthermore, we illustrate the package’s
functionality in both real and artificial examples.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "bdgraph",
        "method": "ggm",
        "algo": "bdmcmc",
        "iter": 3000,
        "gprior": 0.5,
        "dfprior": 3,
        "gstart": "empty",
        "timeout": null,
        "mcmc_seed": 1,
        "thresh": 0.5,
        "mcmc_estimator": "threshold",
        "threshold": [
          0.1,
          0.3,
          0.5,
          0.7,
          0.9,
          1.0
        ],
        "burnin_frac": 0.3
      }
    ]

.. footbibliography::

