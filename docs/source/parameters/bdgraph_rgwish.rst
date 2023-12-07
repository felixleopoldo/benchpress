

.. _bdgraph_rgwish: 

bdgraph_rgwish 
------------------

.. rubric:: G-Wishart

.. list-table:: 

   * - Package
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
   * - Version
     - 2.64
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/BDgraph/BDgraph.pdf>`__
   * - Paper
     - :footcite:t:`lenkoski2013direct`, :footcite:t:`JSSv089i03`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/bdgraph:2.72.0 <https://hub.docker.com/r/bpimages/bdgraph/tags>`__
   * - Module
     - `bdgraph_rgwish <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/bdgraph_rgwish>`__



.. rubric:: Description

Provided that :math:`G` is undirected, an object of this module defines a zero-mean Gaussian graphical model by sampling the precision matrix from the *G-Wishart* distribution  using the *rgwish* function from the R package `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__.
The inverted precision matrix is saved, serving as covariance matrix in a Gaussian distribution.


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gwi",
        "b": 3,
        "threshold_conv": 1e-08
      }
    ]

.. footbibliography::

