


:og:description: Max-min hill-climbing (MMHC) is a hybrid method which first estimates the skeleton of a DAG using an algorithm called Max-Min Parents and Children and then performs a greedy hill-climbing search to orient the edges with respect to a Bayesian score.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Max-Min Hill-Climbing (MMHC)
 
.. meta::
    :title: Max-Min Hill-Climbing 
    :description: Max-min hill-climbing (MMHC) is a hybrid method which first estimates the skeleton of a DAG using an algorithm called Max-Min Parents and Children and then performs a greedy hill-climbing search to orient the edges with respect to a Bayesian score.


.. _bnlearn_mmhc: 

MMHC (bnlearn) 
***************



.. list-table:: 

   * - Module name
     - `bnlearn_mmhc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_mmhc>`__
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
   * - Data type
     - C, D, M
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__




Max-Min Hill-Climbing 
-------------------------


Max-min hill-climbing (MMHC) is a hybrid method which first estimates the skeleton of a
DAG using an algorithm called Max-Min Parents and Children and then performs a greedy
hill-climbing search to orient the edges with respect to a Bayesian score. It is a popular approach used as standard benchmark and also well suited for high-
dimensional domains.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


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
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
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
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

