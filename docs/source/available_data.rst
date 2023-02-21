Data
==============

Benchpress supports different strategies for defining models and data. 
One possibility is to generate data, graphs and parameters using the existing modules in the resources_ section, referenced by their objects id, as described above. 
An alternative is to provide user-specified graphs, parameters and data sets, referenced by their corresponding filenames. 
Further we can combine the two approaches as needed.



Data scenarios
******************************


The different sources of data can be summarised in five scenarios
shown in the table below. Scenario I is the typical scenario for data analysts, where the user provides
one or more datasets by hand. Scenario II is similar to Scenario I, with the difference that
the user also provides the true graph underlying the data. This situation arises e.g. when
replicating a simulation study from the literature, where both the true graph and the dataset
are given. Scenario III-V are pure benchmarking scenarios, where either all of the graphs,
parameters and data are generated (V) or the graphs and possibly parameters are specified by
the user (III, IV).


+-----+-----------+------------+-----------+
|     | Graph     | Parameters | Data      |
+-----+-----------+------------+-----------+
| I   | -         | -          | Fixed     |
+-----+-----------+------------+-----------+
| II  | Fixed     | -          | Fixed     |
+-----+-----------+------------+-----------+
| III | Fixed     | Fixed      | Generated |
+-----+-----------+------------+-----------+
| IV  | Fixed     | Generated  | Generated |
+-----+-----------+------------+-----------+
| V   | Generated | Generated  | Generated |
+-----+-----------+------------+-----------+

The following subsections shows some data examples in the benchmark_setup_ section that correspond to the scenarios I-IV.
To try this out, you may change the current data section in `config/config.json <../../config/config.json>`__.
Note that, in general the ``id``'s used must be defined in the resources section (as it is in `config/config.json <https://github.com/felixleopoldo/benchpress/blob/master/config/config.json>`__ ). 
For example, *avneigs4_p20* is the ``id`` of an object in the :ref:`pcalg_randdag` module in the :ref:`graph` section.
Also, datasets, parameters, and graphs must be placed in the proper subfolder of the `resources/ <https://github.com/felixleopoldo/benchpress/blob/master/resources/>`_ folder.

Note that some evaluation modules are not compatible with this scenario as there is no true graph specified.
For example, you may not use the :ref:`graph_true_plots` or :ref:`benchmarks` modules as both require the true graph to be provided.


.. Examples
.. ^^^^^^^^^

.. _I:

I) Data analysis (fixed data)
---------------------------------

Here we use `2005_sachs_2_cd3cd28icam2_log_std.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs_2_cd3cd28icam2_log_std.csv>`_, which is the logged and standardized version of the 2nd dataset from :footcite:t:`doi:10.1126/science.1105809`

.. code-block:: json

    { 
        "graph_id": null,
        "parameters_id": null,
        "data_id": "2005_sachs_2_cd3cd28icam2_log_std.csv",
        "seed_range": null
    }


`2005_sachs <https://github.com/felixleopoldo/benchpress/tree/master/resources/data/mydatasets/2005_sachs>`_ is a subfolder of  `resources/data/mydatasets <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/>`_ containing all the datasets from :footcite:t:`doi:10.1126/science.1105809`.

.. code-block:: json

    { 
        "graph_id": null,
        "parameters_id": null,
        "data_id": "2005_sachs",
        "seed_range": null
    }


.. _II:

II) Data analysis with validation
----------------------------------


.. code-block:: json

    { 
        "graph_id": "sachs.csv",
        "parameters_id": null,
        "data_id": "2005_sachs_2_cd3cd28icam2_log_std.csv",
        "seed_range": null
    }

III) Fixed graph
------------------


.. code-block:: json

    
        {
            "graph_id": "alarm.csv",
            "parameters_id": "SEM",
            "data_id": "standardized",
            "seed_range": [
                1,
                3
            ]
        }


IV) Fixed graph and parameters
--------------------------------

Beware that the parameters in the following example is for binary data so make sure that the algorithms used must be compatible.
You may e.g. use the id *itsearch_sample-bde* in the :ref:`graph_plots` module.

.. code-block:: json

    { 
        "graph_id": "sachs.csv",
        "parameters_id": "sachs.rds",
        "data_id": "nonstandardized",
        "seed_range": [1, 10]
    }


.. _V:

V) Fully generated
-------------------

.. code-block:: json

    { 
        "graph_id": "avneigs4_p20",
        "parameters_id": "SEM",
        "data_id": "standardized",
        "seed_range": [1, 10]
    }

Modules
*************

The availabe data modules are listed below.




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

.. rubric:: Fixed dataset(s)

.. rubric:: Description


.. list-table::

  * - Filename
    - p
    - n
    - Type
    - Graph
  * - :ref:`czech_autoworkers.csv`
    - 6
    - 1841
    - Bin
    - Not known
  * - :ref:`2019_olsson_pavlenko_rios_p15_n1000.csv`
    - 15
    - 1000
    - Bin
    - `jonesp15.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/jonesp15.csv>`__
  * - :ref:`2005_sachs_2_cd3cd28icam2_log_std.csv`
    - 11
    - 992
    - Cont
    - `sachs.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/adjmat/myadjmats/sachs.csv>`__

----------------------

.. _czech_autoworkers.csv:

.. rubric:: czech_autoworkers.csv


File: `czech_autoworkers.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/czech_autoworkers.csv>`__

Paper: :footcite:t:`edwards1985fast`

Description:

A 6 way contingency table representing the cross classification of 1841 men. All 6 classification criteria are binary. The variables are (smoke) smoking, (mental) strenuous mental work, (phys) strenuous physical work, (blodp) systolic blood pressure, (lipo) ratio of beta and alpha lipoproteins and (coron) family anamnesis of coronary heart disease.


------------------------

.. _2019_olsson_pavlenko_rios_p15_n1000.csv:

.. rubric:: 2019_olsson_pavlenko_rios_p15_n1000.csv


File: `2019_olsson_pavlenko_rios_p15_n1000.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2019_olsson_pavlenko_rios_p15_n1000.csv>`__

Paper: :footcite:t:`10.1214/19-EJS1585`

Description:



-------------------

.. _2005_sachs_2_cd3cd28icam2_log_std.csv:

.. rubric:: 2005_sachs_2_cd3cd28icam2_log_std.csv


File: `2005_sachs_2_cd3cd28icam2_log_std.csv <https://github.com/felixleopoldo/benchpress/blob/master/resources/data/mydatasets/2005_sachs_2_cd3cd28icam2_log_std.csv>`__

Paper: :footcite:t:`doi:10.1126/science.1105809`

.. We consider the data from \cite{sachs2005causal} containing cytometry measurements of 11 phosphorylated proteins and phospholipids, which has become standard in this field since the true underlying graph is regarded as known.
.. The dataset consists of totally 7644 measurements from nine different perturbation conditions, each defining a unique intervention scheme.

.. %This data has several times been used carelessly to benchmark structure learning algorithms for observational data.

.. \cite{sachs2005causal} removed any data points that fell more than three standard deviations from the mean. % , which resulted in 5400 datapoints which are not available. 
.. The data were then discretized to three levels. 
.. %The purely observational data had merely 1200 data points.
.. They also use bootstrapping methodologies and handle the interventional dataset to determine causal directions of edges. 

.. However, since the purpose here is to benchmark algorithms suited for observational data, we consider only the first two interventions, referred to as \emph{(anti-CD3/CD28)} and \emph{(anti-CD3/CD28 + ICAM-2)} as only these are expected to be independent of the nodes in the network and just activate the T-cells generally. 
.. Algorithms that can handle interventional data (or a combination of interventional and observential), are also available  \citep[see \emph{e.g.},][]{hauser2012characterization,NIPS2017_275d7fb2, kuipers2022interventional} but not studied in this paper and are not yet supported by \ttl.
.. We show results for the (logged and standardized version of) the second dataset (\emph{anti-CD3/CD28 + ICAM-2}) with 902 observations since the graphs estimated from this dataset were in general closer to the gold standard network. The data are visualised in Figure~\ref{fig:sachs_pairs} with independent and pairwise scatter plots using the \texttt{ggally\_ggpairs} module.


.. rubric:: References
    
.. footbibliography::

.. footbibliography::

-------

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

-------

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

-------