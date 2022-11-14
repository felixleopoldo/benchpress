``parameters``
====================

Parameter modules are listed below. 
Make sure that the parameter module is compatible with the graph module you are using.


.. list-table:: 
   :header-rows: 1 

   * - Algorithm
     - Graph
     - Language
     - Package
     - Version
     - Module
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - bdgraph_rgwish_ 
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - bin_bn_ 
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - fixed_ 
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - sem_params_ 
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - trilearn_g_inv_wishart_ 
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - trilearn_hyper-dir_ 
   * - Some title
     - 
     - 
     - ` <http>`_
     - v0.0.1
     - trilearn_intra-class_ 





``bdgraph_rgwish`` 
------------------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <http>`_
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - `here <>`_
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - 
   * - Docker
     - `username/image:version <https://hub.docker.com/r/username/image>`_
   * - Module
     - `bdgraph_rgwish <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bdgraph_rgwish>`__



.. rubric:: Description


Samples G-Wishart matrix given an undirected graph using the *rgwish* function from the R package  `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_.


Provided that :math:`G` is undirected, an object of this module defines a zero-mean Gaussian graphical model by sampling the precision matrix from the *G-Wishart* distribution [AH2005]_ [Len2013]_ using the *rgwish* function from the R package `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`_.
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

``bin_bn`` 
----------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <http>`_
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - `here <>`_
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - 
   * - Docker
     - `username/image:version <https://hub.docker.com/r/username/image>`_
   * - Module
     - `bin_bn <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bin_bn>`__



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

``fixed`` 
---------

.. rubric:: Some title

.. rubric:: Description

* Bnlearn objects `bn.fit` objects should be stored in `RDS` format in the directory *resources/myparams/bn.fit_networks*.
* Weight matrices for SEM models should be stored in CSV format in *resources/myparams/sem_params*.


.. rubric:: Example

Example standard networks mostly from the `bnlearn repository <https://www.bnlearn.com/bnrepository/>`_ are found `here <https://github.com/felixleopoldo/benchpress/tree/master/resources/parameters/myparams/bn.fit_networks>`_.


.. important::

    This must be combined with the correct graph of the network. For example, the network of ``asia.rds`` should be used with the graph ``asia.csv``, which happens the be corresponding adjacancy matrix.




``sem_params`` 
--------------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <http>`_
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - `here <>`_
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - 
   * - Docker
     - `username/image:version <https://hub.docker.com/r/username/image>`_
   * - Module
     - `sem_params <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/sem_params>`__



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

``trilearn_g_inv_wishart`` 
--------------------------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <http>`_
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - `here <>`_
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - 
   * - Docker
     - `username/image:version <https://hub.docker.com/r/username/image>`_
   * - Module
     - `trilearn_g_inv_wishart <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/trilearn_g_inv_wishart>`__



.. rubric:: Description

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "giw",
        "dof": 1
      }
    ]

``trilearn_hyper-dir`` 
----------------------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <http>`_
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - `here <>`_
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - 
   * - Docker
     - `username/image:version <https://hub.docker.com/r/username/image>`_
   * - Module
     - `trilearn_hyper-dir <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/trilearn_hyper-dir>`__



.. rubric:: Description


An object of the trilearn hyper-dir module defines a catagorical decomposable model by sampling the parameters from the hyper Dirichlet distribution [1]_, with specified equivalent sample size (``pseudo_obs``) and number of levels per variable (``n_levels``).




.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "disc-loglin",
        "n_levels": 2,
        "pseudo_obs": 1.0
      }
    ]

``trilearn_intra-class`` 
------------------------

.. rubric:: Some title

.. list-table:: 

   * - Package
     - ` <http>`_
   * - Version
     - v0.0.1
   * - Language
     - 
   * - Docs
     - `here <>`_
   * - Paper
     - `the paper title <the_url>`_
   * - Graph type
     - 
   * - Docker
     - `username/image:version <https://hub.docker.com/r/username/image>`_
   * - Module
     - `trilearn_intra-class <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/trilearn_intra-class>`__



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