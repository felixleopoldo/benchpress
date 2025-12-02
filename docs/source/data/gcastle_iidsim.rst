

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
     - `here <https://gcastle.readthedocs.io/en/latest/castle/castle.datasets.html#castle.datasets.simulator.IIDSimulation>`__
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

