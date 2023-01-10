.. _parameters: 

``parameters``
====================

Parameter modules are listed below. 
Make sure that the parameter module is compatible with the graph module you are using.


.. list-table:: 
   :header-rows: 1 

   * - Method
     - Graph
     - Language
     - Package
     - Version
     - Module
   * - G-Wishart
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `R <https://www.r-project.org/>`__
     - `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__
     - 2.64
     - bdgraph_rgwish_ 
   * - Binary BN
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `R <https://www.r-project.org/>`__
     - Benchpress
     - 
     - bin_bn_ 
   * - Fixed parameters
     - 
     - 
     - 
     - 
     - fixed_params_ 
   * - SEM parameters
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `R <https://www.r-project.org/>`__
     - Benchpress
     - 
     - sem_params_ 
   * - Hyper-Dirichlet
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
     - `Python <https://www.python.org/>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_hyper-dir_ 
   * - Graph intra-class
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
     - `Python <https://www.python.org/>`__
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
     - 1.25
     - trilearn_intra-class_ 





.. _bdgraph_rgwish: 

``bdgraph_rgwish`` 
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
     - `onceltuca/bdgraph:2.64 <https://hub.docker.com/r/onceltuca/bdgraph/tags>`__
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



.. _bin_bn: 

``bin_bn`` 
----------

.. rubric:: Binary BN

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
     - `onceltuca/benchpress:1.2.0 <https://hub.docker.com/r/onceltuca/benchpress/tags>`__
   * - Module
     - `bin_bn <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/bin_bn>`__



.. rubric:: Description


An object of this module defines a binary Bayesian network (where the nodes are binary variables) by sampling its conditional probability tables.
More specifically, the conditional probability tables for each variable :math:`Y_i` and parent configuration :math:`pa(Y_i)` are distributed as

.. math::

    P(Y_i=0 | pa(y_i) ) \sim \mathrm{Unif}([a, b]),

where  :math:`(a,b) \in [0,1]^2, a<b` and :math:`\mathrm{Unif}(c)` denotes the uniform distribution on the set :math:`c`.


.. Source: `resources/binarydatagen/generatebinaryBNf.r <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generatebinaryBNf.r>`_

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatebinarybn.md>`_


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "binbn",
        "min": 0.1,
        "max": 0.9
      }
    ]

.. footbibliography::



.. _fixed_params: 

``fixed_params`` 
----------------

.. rubric:: Fixed parameters

.. rubric:: Description

* Bnlearn objects `bn.fit` objects should be stored in `RDS` format in the directory *resources/myparams/bn.fit_networks*.
* Weight matrices for SEM models should be stored in CSV format in *resources/myparams/sem_params*.


.. rubric:: Example

Example standard networks mostly from the `bnlearn repository <https://www.bnlearn.com/bnrepository/>`_ are found `here <https://github.com/felixleopoldo/benchpress/tree/master/resources/parameters/myparams/bn.fit_networks>`_.


.. important::

    This must be combined with the correct graph of the network. For example, the network of ``asia.rds`` should be used with the graph ``asia.csv``, which happens the be corresponding adjacancy matrix.




.. footbibliography::



.. _sem_params: 

``sem_params`` 
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
     - `onceltuca/bidag:2.0.3 <https://hub.docker.com/r/onceltuca/bidag/tags>`__
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



.. _trilearn_hyper-dir: 

``trilearn_hyper-dir`` 
----------------------

.. rubric:: Hyper-Dirichlet

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
     - :footcite:t:`10.1214/aos/1176349260`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `onceltuca/trilearn:1.25 <https://hub.docker.com/r/onceltuca/trilearn/tags>`__
   * - Module
     - `trilearn_hyper-dir <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/parameters/trilearn_hyper-dir>`__



.. rubric:: Description

An object of this module defines a categorical decomposable model by sampling the parameters from the hyper Dirichlet distribution, with specified equivalent sample size (``pseudo_obs``) and number of levels per variable (``n_levels``).



.. note:: 

    This module currently only supports graphs with up to 15 nodes.

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "disc-loglin",
        "n_levels": 2,
        "pseudo_obs": 1.0
      }
    ]

.. footbibliography::



.. _trilearn_intra-class: 

``trilearn_intra-class`` 
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
     - `onceltuca/trilearn:1.25 <https://hub.docker.com/r/onceltuca/trilearn/tags>`__
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

