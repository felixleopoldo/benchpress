

.. _bnlearn_mmhc: 

bnlearn_mmhc 
----------------

.. rubric:: MMHC

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
     - :footcite:t:`tsamardinos2006max`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_mmhc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_mmhc>`__



.. rubric:: Description

Max-min hill-climbing (MMHC) is a hybrid method which first estimates the skeleton of a
DAG using an algorithm called Max-Min Parents and Children and then performs a greedy
hill-climbing search to orient the edges with respect to a Bayesian score. It is a popular approach used as standard benchmark and also well suited for high-
dimensional domains.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "mmhc-bde-mi",
        "alpha": [
          0.01,
          0.05,
          0.1
        ],
        "test": "mi",
        "score": "bde",
        "iss": 0.1,
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": 1,
        "timeout": null
      },
      {
        "id": "mmhc-bge-zf",
        "alpha": [
          0.001,
          0.01,
          0.05,
          0.1
        ],
        "score": "bge",
        "test": "zf",
        "iss": 1,
        "issmu": 1,
        "issw": null,
        "l": 5,
        "k": 1,
        "prior": "uniform",
        "beta": null,
        "timeout": null
      }
    ]

.. footbibliography::

