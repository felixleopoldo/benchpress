


:og:description: Abstract: We propose a new procedure for optimally estimating high dimensional Gaussian graphical models. Our approach is asymptotically tuning-free and non-asymptotically tuning-insensitive: It requires very little effort to choose the tuning parameter in finite sample settings. Computationally, our procedure is significantly faster than existing methods due to its tuning-insensitive property. Theoretically, the obtained estimator simultaneously achieves minimax lower bounds for precision matrix estimation under different norms. Empirically, we illustrate the advantages of the proposed method using simulated and real examples. The R package camel implementing the proposed methods is also available on the Comprehensive R Archive Network.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: TIGER (huge)
 
.. meta::
    :title: TIGER (huge)
    :description: Abstract: We propose a new procedure for optimally estimating high dimensional Gaussian graphical models. Our approach is asymptotically tuning-free and non-asymptotically tuning-insensitive: It requires very little effort to choose the tuning parameter in finite sample settings. Computationally, our procedure is significantly faster than existing methods due to its tuning-insensitive property. Theoretically, the obtained estimator simultaneously achieves minimax lower bounds for precision matrix estimation under different norms. Empirically, we illustrate the advantages of the proposed method using simulated and real examples. The R package camel implementing the proposed methods is also available on the Comprehensive R Archive Network.


.. _huge_tiger: 

TIGER (huge) 
*************



.. list-table:: 

   * - Module name
     - `huge_tiger <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/huge_tiger>`__
   * - Package
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
   * - Version
     - 1.3.5
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/huge/huge.pdf>`__
   * - Paper
     - :footcite:t:`liu2017tiger`, :footcite:t:`zhao2012huge`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
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
     - `bpimages/huge:1.3.5 <https://hub.docker.com/r/bpimages/huge/tags>`__




Tuning-Insensitive Graph Estimation and Regression 
------------------------------------------------------


Abstract: We propose a new procedure for optimally estimating high dimensional Gaussian graphical models. Our approach is asymptotically tuning-free and non-asymptotically tuning-insensitive: It requires very little effort to choose the tuning parameter in finite sample settings. Computationally, our procedure is significantly faster than existing methods due to its tuning-insensitive property. Theoretically, the obtained estimator simultaneously achieves minimax lower bounds for precision matrix estimation under different norms. Empirically, we illustrate the advantages of the proposed method using simulated and real examples. The R package camel implementing the proposed methods is also available on the Comprehensive R Archive Network.

.. rubric:: Some fields described 
* ``lambda`` A positive number to control the regularization. Typical usage is to leave the input lambda: null and have the program compute its own. 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "huge_tiger",
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
        ]
      }
    ]

.. footbibliography::

