


    .. meta::
        :title: Tabu 
        :description: Tabu is a less greedy version of the HC algorithm allowing for non-optimal moves that might be beneficial from a global perspective to avoid local maxima.
    

.. _bnlearn_tabu: 

bnlearn_tabu 
----------------

.. rubric:: Tabu

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
     - `bnlearn_tabu <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_tabu>`__



.. rubric:: Description

Tabu is a less greedy version of the HC algorithm allowing for non-optimal moves that might be
beneficial from a global perspective to avoid local maxima.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "tabu-bde",
        "score": "bde",
        "iss": [
          0.001,
          0.01,
          0.1
        ],
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      },
      {
        "id": "tabu-bge",
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
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

