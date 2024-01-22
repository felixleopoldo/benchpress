

.. _trilearn_intra-class: 

trilearn_intra-class 
------------------------

.. rubric:: Graph intra-class

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 1.25
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/trilearn:2.0.5 <https://hub.docker.com/r/bpimages/trilearn/tags>`__
   * - Module
     - `trilearn_intra-class <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/trilearn_intra-class>`__



.. rubric:: Description


An object of the intraclass module defines a zero mean multivariate Gaussian distribution by its covariance matrix :math:`\Sigma` as 

.. math::
    
    \Sigma_{ij} = \begin{cases}
        \sigma^2, &\text{ if } i=j\\
        \rho\sigma^2, &\text{ if } (i,j) \in E \\
    \end{cases}



and :math:`\Sigma^{−1}_{ij} = 0 \text{ if } (i, j) \in  E \text{, where } \sigma^2 > 0  \text{ and } \rho \in [0, 1]` denote the variance and correlation coefficient, respectively.
Using an object id of this module in the ``parameters_id`` field of the ``data`` section requires that ``graph_id`` represents a decomposable graph.



.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "intra-class",
        "rho": 0.4,
        "sigma2": 1.0
      }
    ]

.. footbibliography::

