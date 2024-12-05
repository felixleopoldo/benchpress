


    .. meta::
        :title: HC 
        :description: Hill climbing (HC) is a score-based algorithm which starts with a DAG with no edges and adds, deletes or reverses edges in a greedy manner until an optimum is reached.
    

.. _bnlearn_hc: 

bnlearn_hc 
--------------

.. rubric:: HC

.. list-table:: 

   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.8.3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - :footcite:t:`scutari2019learning`, :footcite:t:`norvig2002modern`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_hc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_hc>`__



.. rubric:: Description

Hill climbing (HC) is a score-based algorithm which starts with a DAG with no edges and
adds, deletes or reverses edges in a greedy manner until an optimum is reached.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "hc-bde",
        "score": "bde",
        "iss": [
          0.001,
          0.01,
          0.1
        ],
        "issmu": null,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "restart": 0,
        "perturb": 1,
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      },
      {
        "id": "hc-bge",
        "score": "bge",
        "iss": 1,
        "issmu": [
          0.0001,
          0.001,
          0.01,
          0.05
        ],
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "restart": 0,
        "perturb": 1,
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

