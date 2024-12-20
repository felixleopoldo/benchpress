


:og:description: mice data imputation for the temporal PC algorithm.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Multivariate Imputation by Chained Equations (mice)
 
.. meta::
    :title: Multivariate Imputation by Chained Equations 
    :description: mice data imputation for the temporal PC algorithm.


.. _mice: 

mice (mice) 
************



.. list-table:: 

   * - Module name
     - `mice <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/mice>`__
   * - Package
     - `mice <https://amices.org/mice/>`__
   * - Version
     - 3.17.0
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://amices.org/mice/>`__
   * - Paper
     - :footcite:t:`mice`
   * - Graph type
     - 
   * - Docker 
     - `bpimages/mice:3.17.0-ranger-amd64 <https://hub.docker.com/r/bpimages/mice/tags>`__




Multivariate Imputation by Chained Equations 
------------------------------------------------


The mice package implements a method to deal with missing data. The package creates multiple imputations (replacement values) for multivariate missing data. The method is based on Fully Conditional Specification, where each incomplete variable is imputed by a separate model. The MICE algorithm can impute mixes of continuous, binary, unordered categorical and ordered categorical data. In addition, MICE can impute continuous two-level data, and maintain consistency between imputations by means of passive imputation. 

.. important::

<<<<<<< HEAD
    This is not a structure learning algorithm, just a workaround to use imputed data for the :ref:`bips_tpc` module.
=======
    This is not a structure learning algorithm, just a workaround to use imputed data for the :ref:`bips_tpc <bips_tpc>` module.
>>>>>>> dev



.. rubric:: Some fields described 
* ``action`` Parameter for the complete function 
* ``defaultMethod`` Parameter for the complete function: Default method to use for imputation 
* ``include`` Parameter for the complete function 
* ``m`` Parameter for the mice function: Number of imputations 
* ``maxit`` Parameter for the mice function: Maximum number of iterations 
* ``method`` Parameter for the complete function: Method to use for imputation 
* ``mild`` Parameter for the complete function 
* ``order`` Parameter for the complete function 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "mice",
        "m": 5,
        "maxit": 3,
        "method": "rf",
        "defaultMethod": "rf",
        "action": "all",
        "include": false,
        "mild": true,
        "order": "last",
        "timeout": null
      }
    ]

.. footbibliography::

