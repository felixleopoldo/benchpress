

.. _sem_params: 

sem_params 
--------------

.. rubric:: SEM parameters

.. list-table:: 

   * - Package
     - Benchpress
   * - Version
     - 
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`rios2021benchpress`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bidag:2.1.4 <https://hub.docker.com/r/bpimages/bidag/tags>`__
   * - Module
     - `sem_params <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/sem_params>`__



.. rubric:: Description

An object of this module defines a Bayesian network by generating the weight matrix :math:`W` of a Gaussian linear structural equation model (SEM) of the form

.. math::

    Y_i=\sum_{j:Y_j\in pa(Y)} W_{ij}Y_j + Z_i,


where :math:`Z_i\sim \mathcal N(\mu, \sigma^2)` and elements of :math:`W` are distributed as
    
.. math::

    W_{ij} \sim 
    \begin{cases}
    \mathrm{Unif}([a, b])\mathrm{Unif}(\{-1,1\}) & \text{ if }(i, j) \in E\\
    0 & \text{ otherwise.}
    \end{cases}
    


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "SEM",
        "min": 0.25,
        "max": 1
      }
    ]

.. footbibliography::

