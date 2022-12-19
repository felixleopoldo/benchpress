``data``
==============

The data modules.

.. list-table:: 
   :header-rows: 1 

   * - Method
     - Graph
     - Package
     - Version
     - Module
   * - Fixed dataset(s)
     - 
     - 
     - 
     - fixed_data_ 
   * - gCastle IID (SEM)
     - DAG
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - 1.0.3
     - gcastle_iidsim_ 
   * - IID data
     - all
     - 
     - 
     - iid_ 





.. _fixed_data: 

``fixed_data`` 
--------------

.. rubric:: Fixed dataset(s)

.. rubric:: Description


.. list-table::

  * - Filename
    - p
    - n
    - Type
    - Graph
    - Reference
  * - :ref:`czech_autoworkers.csv`
    - 6
    - 1841
    - Bin
    - Not known
    - :footcite:t:`edwards1985fast`
  * - `2019_olsson_pavlenko_rios_p15_n1000.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2019_olsson_pavlenko_rios_p15_n1000.csv>`__
    - 15
    - 1000
    - Bin
    - `jonesp15.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/jonesp15.csv>`__
    - :footcite:t:`10.1214/19-EJS1585`
  * - `2005_sachs_2_cd3cd28icam2_log_std.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2019_olsson_pavlenko_rios_p15_n1000.csv>`__
    - 11
    - 992
    - Cont
    - `sachs.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/sachs.csv>`__
    - :footcite:t:`doi:10.1126/science.1105809`


.. _czech_autoworkers.csv:

.. rubric:: czech_autoworkers.csv
----------------------

File: `czech_autoworkers.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/czech_autoworkers.csv>`__

Description:

A 6 way contingency table representing the cross classification of 1841 men. All 6 classification criteria are binary. The variables are (smoke) smoking, (mental) strenuous mental work, (phys) strenuous physical work, (blodp) systolic blood pressure, (lipo) ratio of beta and alpha lipoproteins and (coron) family anamnesis of coronary heart disease.



    
.. rubric:: References
    
.. footbibliography::

.. footbibliography::



.. _gcastle_iidsim: 

``gcastle_iidsim`` 
------------------

.. rubric:: gCastle IID (SEM)

.. list-table:: 

   * - Package
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
   * - Version
     - 1.0.3
   * - Docs
     - `here <https://github.com/huawei-noah/trustworthyAI/blob/master/gcastle/castle/datasets/simulator.py>`__
   * - Paper
     - :footcite:t:`zhang2021gcastle`
   * - Graph type
     - DAG
   * - Module
     - `gcastle_iidsim <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/data/gcastle_iidsim>`__



.. rubric:: Description

IID samples from a SEM model using the  *IIDSimulation* object in the `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`_ library.
The data may be standardized by setting ``standardized`` to *true*. 


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

.. footbibliography::



.. _iid: 

``iid`` 
-------

.. rubric:: IID data

.. list-table:: 

   * - Package
     - 
   * - Version
     - 
   * - Docs
     - 
   * - Paper
     - 
   * - Graph type
     - all
   * - Module
     - `iid <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/data/iid>`__



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

.. footbibliography::

