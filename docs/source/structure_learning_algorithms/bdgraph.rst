


    .. meta::
        :title: BDgraph 
        :description:    
    

.. _bdgraph: 

bdgraph 
***********



.. list-table:: 

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
   * - Docker 
     - `bpimages/bdgraph:2.72.0 <https://hub.docker.com/r/bpimages/bdgraph/tags>`__

   * - Module folder
     - `bdgraph <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bdgraph>`__



BDgraph 
-----------









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

