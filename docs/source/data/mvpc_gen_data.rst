

.. _mvpc_gen_data: 

mvpc_gen_data 
-----------------

.. rubric:: Missing data generation

.. list-table:: 

   * - Package
     - `MVPC <https://github.com/felixleopoldo/MVPC>`__
   * - Version
     - d901361
   * - Docs
     - `here <https://github.com/felixleopoldo/MVPC/blob/d901361e349f4620094fff9e621734f681053d7e/src/SyntheticDataGeneration.R#L3>`__
   * - Paper
     - :footcite:t:`mohan2013graphical`, :footcite:t:`rubin1976inference`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Module
     - `mvpc_gen_data <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/data/mvpc_gen_data>`__



.. rubric:: Description

Module for synthetic Gaussian data generation with different types of missingness: missing at random (MAR), 
missing completely at random (MCAR), and missing not at random (MNAR) :footcite:t:`mohan2013graphical`, :footcite:t:`rubin1976inference`.

.. rubric:: Some fields described 
* ``mode`` different methods to generate data sets with different missingness mechanisms, such as mcar, mar and mnar 
* ``num_extra_e`` number of the variables with missing values that lead to wrong results 
* ``num_m`` number of the variables with missing values 
* ``p_missing_e`` The probability of missing values when the missingness condition is not satisfied, e.g., missingness indicator R = 0 
* ``p_missing_h`` The probability of missing values when the missingness condition is satisfied, e.g., missingness indicator R = 1 


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "missing",
        "num_extra_e": 2,
        "num_m": 5,
        "mode": "mar",
        "p_missing_h": 0.9,
        "p_missing_e": 0.1,
        "standardized": false,
        "n": 1001
      }
    ]

.. footbibliography::

