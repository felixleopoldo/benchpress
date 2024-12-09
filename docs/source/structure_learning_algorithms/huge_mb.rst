


    .. meta::
        :title: Meinshausen & Buhlmann cov est 
        :description: Abstract: The pattern of zero entries in the inverse covariance matrix of a multivariate normal distribution corresponds to conditional independence restrictions between variables. Covariance selection aims at estimating those structural zeros from data. We show that neighborhood selection with the Lasso is a computationally attractive alternative to standard covariance selection for sparse high-dimensional graphs. Neighborhood selection estimates the conditional independence restrictions separately for each node in the graph and is hence equivalent to variable selection for Gaussian linear models. We show that the proposed neighborhood selection scheme is consistent for sparse high-dimensional graphs. Consistency hinges on the choice of the penalty parameter. The oracle value for optimal prediction does not lead to a consistent neighborhood estimate. Controlling instead the probability of falsely joining some distinct connectivity components of the graph, consistent estimation for sparse graphs is achieved (with exponential rates), even when the number of variables grows as the number of observations raised to an arbitrary power.
    

.. _huge_mb: 

huge_mb 
-----------

.. rubric:: Meinshausen & Buhlmann cov est

.. list-table:: 

   * - Package
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
   * - Version
     - 1.3.5
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/huge/huge.pdf>`__
   * - Paper
     - :footcite:t:`zhao2012huge`, :footcite:t:`10.1214/009053606000000281`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/huge:1.3.5 <https://hub.docker.com/r/bpimages/huge/tags>`__

   * - Module folder
     - `huge_mb <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/huge_mb>`__



.. rubric:: Description

Abstract: The pattern of zero entries in the inverse covariance matrix of a multivariate normal distribution corresponds to conditional independence restrictions between variables. Covariance selection aims at estimating those structural zeros from data. We show that neighborhood selection with the Lasso is a computationally attractive alternative to standard covariance selection for sparse high-dimensional graphs. Neighborhood selection estimates the conditional independence restrictions separately for each node in the graph and is hence equivalent to variable selection for Gaussian linear models. We show that the proposed neighborhood selection scheme is consistent for sparse high-dimensional graphs. Consistency hinges on the choice of the penalty parameter. The oracle value for optimal prediction does not lead to a consistent neighborhood estimate. Controlling instead the probability of falsely joining some distinct connectivity components of the graph, consistent estimation for sparse graphs is achieved (with exponential rates), even when the number of variables grows as the number of observations raised to an arbitrary power.

.. rubric:: Some fields described 
* ``lambda`` A positive number to control the regularization. Typical usage is to leave the input lambda: null and have the program compute its own. 
* ``nlambda`` The number of regularization/thresholding parameters. The default value is 10 
* ``select_criterion`` Model selection criterion. ric and stars are available. The default value is ric. 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "huge_mb",
        "timeout": null,
        "lambda": [
          2,
          1,
          0.8,
          0.6,
          0.4,
          0.2,
          0.1,
          0.05,
          0.01
        ],
        "nlambda": null,
        "select_criterion": "stars"
      }
    ]

.. footbibliography::

