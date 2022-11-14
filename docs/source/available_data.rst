``data``
==============

The data modules.

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





``fixed`` 
---------

.. rubric:: Datasets

.. rubric:: Description



Observations should be stored as row vectors in a matrix, where the columns are separated by
commas. The first row should contain the labels of the variables and if the data is categorical,
the second row should contain the cardinality (number of levels) of each variable.

.. rubric:: Example (continuous)

An example showing of two samples from continuous distribution is shown below.

.. code-block:: text

    a,b,c,d
    0.2,2.3,5.3,0.5
    3.2,1.5,2.5,1.2

.. rubric:: Example (categorical)

Below is a formatting example of two samples of a categorical distribution where the cardinalities
are 2,3,2, and 2.

.. code-block:: text

    a,b,c,d
    2,3,2,2
    1,2,0,1
    0,1,1,1

``gcastle_iidsim`` 
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
     - `gcastle_iidsim <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gcastle_iidsim>`__



.. rubric:: Description

IID samples from a SEM model using the  ``IIDSimulation`` object in the ``gCastle`` library.
The data may be standardized by setting ``standardized`` to true. 


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "gcastle_sem",
        "standardized": true,
        "method": "linear",
        "sem_type": "gauss",
        "noise_scale": 1.0,
        "n": [
          1000
        ]
      }
    ]

``iid`` 
-------

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
     - `iid <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/iid>`__



.. rubric:: Description

Independently identically distributed (IID) samples of a given size ``sample_sizes``.
The data may be standardized by setting ``standardized`` to true. 


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "standardized",
        "standardized": true,
        "sample_sizes": [
          100
        ]
      }
    ]