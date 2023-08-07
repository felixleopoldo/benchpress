.. _data: 

Data
==============

The available data modules are listed below.




.. list-table:: 
   :header-rows: 1 

   * - Method
     - Graph
     - Package
     - Version
     - Module
   * - Fixed data
     - 
     - 
     - 
     - fixed_data_ 
   * - gCastle IID (SEM)
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
     - `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__
     - 1.0.3
     - gcastle_iidsim_ 
   * - IID data
     - all
     - 
     - 
     - iid_ 





.. _fixed_data: 

fixed_data 
--------------

.. rubric:: Fixed data

.. rubric:: Description

The table below contains a list of some of the datasets that are available.
However, to use other datasets, you can simply place them in your local  `resources/data/mydatasets <https://github.com/felixleopoldo/benchpress/tree/master/resources/data/mydatasets>`_ along with the others.
The files should be on the csv format specified in :ref:`data_formats`.




.. list-table:: 

   * - Filename 
     - p
     - n
     - Type
     - Graph
   * - :ref:`2005_sachs/`
     - 11
     - 
     - cont
     - `sachs.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/sachs.csv>`__
   * - :ref:`2005_sachs_1_cd3cd28_log.csv`
     - 11
     - 992
     - cont
     - `sachs.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/sachs.csv>`__
   * - :ref:`2005_sachs_2_cd3cd28icam2_log.csv`
     - 11
     - 992
     - cont
     - `sachs.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/sachs.csv>`__
   * - :ref:`2005_sachs_2_cd3cd28icam2_log_std.csv`
     - 11
     - 992
     - cont
     - `sachs.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/sachs.csv>`__
   * - :ref:`2013_green_thomas_p50_n1000.csv`
     - 50
     - 1000
     - cont
     - `greenthomas2013_ar2.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/greenthomas2013_ar2.csv>`__
   * - :ref:`2019_olsson_pavlenko_rios_p15_n1000.csv`
     - 15
     - 1000
     - bin
     - `jonesp15.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/jonesp15.csv>`__
   * - :ref:`czech_autoworkers.csv`
     - 6
     - 1841
     - bin
     - `unknown <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/unknown>`__
   * - :ref:`gmint.csv`
     - 8
     - 5000
     - cont, interv
     - `gmint.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/gmint.csv>`__




.. _2005_sachs/:

.. rubric:: 2005_sachs/

File: `2005_sachs/ <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs/>`__

Directory with all the datasets from :footcite:t:`doi:10.1126/science.1105809`

--------------------



.. _2005_sachs_1_cd3cd28_log.csv:

.. rubric:: 2005_sachs_1_cd3cd28_log.csv

File: `2005_sachs_1_cd3cd28_log.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs_1_cd3cd28_log.csv>`__

The logged version of the 1st dataset from :footcite:t:`doi:10.1126/science.1105809`.

--------------------



.. _2005_sachs_2_cd3cd28icam2_log.csv:

.. rubric:: 2005_sachs_2_cd3cd28icam2_log.csv

File: `2005_sachs_2_cd3cd28icam2_log.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs_2_cd3cd28icam2_log.csv>`__

The logged version of the 2nd dataset from :footcite:t:`doi:10.1126/science.1105809`.

--------------------



.. _2005_sachs_2_cd3cd28icam2_log_std.csv:

.. rubric:: 2005_sachs_2_cd3cd28icam2_log_std.csv

File: `2005_sachs_2_cd3cd28icam2_log_std.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs_2_cd3cd28icam2_log_std.csv>`__

The logged and standardized version of the 2nd dataset from :footcite:t:`doi:10.1126/science.1105809`.

--------------------



.. _2013_green_thomas_p50_n1000.csv:

.. rubric:: 2013_green_thomas_p50_n1000.csv

File: `2013_green_thomas_p50_n1000.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2013_green_thomas_p50_n1000.csv>`__

Synthetic decomposable Gaussian graphical AR-2 (intra-class) model dataset from section 4.3 in :footcite:t:`Green01032013`.

--------------------



.. _2019_olsson_pavlenko_rios_p15_n1000.csv:

.. rubric:: 2019_olsson_pavlenko_rios_p15_n1000.csv

File: `2019_olsson_pavlenko_rios_p15_n1000.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2019_olsson_pavlenko_rios_p15_n1000.csv>`__

The binary decomposable dataset from section 6.2 in :footcite:t:`10.1214/19-EJS1585`.

--------------------



.. _czech_autoworkers.csv:

.. rubric:: czech_autoworkers.csv

File: `czech_autoworkers.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/czech_autoworkers.csv>`__

Czech autoworkers dataset from :footcite:t:`edwards1985fast`.

--------------------



.. _gmint.csv:

.. rubric:: gmint.csv

File: `gmint.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/gmint.csv>`__

Synthetic interventional dataset gmInt from the pcalg package :footcite:t:`kalisch2012causal` (see the documentation of pcalg). 

--------------------



.. rubric:: References

.. footbibliography::



.. footbibliography::



.. _gcastle_iidsim: 

gcastle_iidsim 
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
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
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

iid 
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

Independently identically distributed (IID) samples of a given size ``n``.
The data may be standardized by setting ``standardized`` to true. 




.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "standardized",
        "standardized": true,
        "n": [
          100
        ]
      }
    ]

.. footbibliography::

