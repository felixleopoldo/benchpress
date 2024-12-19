


:og:description: A variant of IAMB which uses speculative stepwise forward selection to reduce the number of conditional independence tests.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Fast IAMB (bnlearn_fastiamb)
 
.. meta::
    :title: Fast IAMB 
    :description: A variant of IAMB which uses speculative stepwise forward selection to reduce the number of conditional independence tests.


.. _bnlearn_fastiamb: 

bnlearn_fastiamb 
********************



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
     - :footcite:t:`1565788`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_fastiamb <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_fastiamb>`__



Fast IAMB 
-------------


Abstract: In this paper we address the problem of learning the Markov blanket of a quantity from data in an efficient manner Markov blanket discovery can be used in the feature selection problem to find an optimal set of features for classification tasks, and is a frequently-used preprocessing phase in data mining, especially for high-dimensional domains. Our contribution is a novel algorithm for the induction of Markov blankets from data, called Fast-IAMB, that employs a heuristic to quickly recover the Markov blanket. Empirical results show that Fast-IAMB performs in many cases faster and more reliably than existing algorithms without adversely affecting the accuracy of the recovered Markov blankets.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "fastiamb-zf",
        "alpha": [
          0.01,
          0.05
        ],
        "test": "zf",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      },
      {
        "id": "fastiamb-mi",
        "alpha": [
          0.01,
          0.05,
          0.1,
          0.2
        ],
        "test": "mi",
        "B": null,
        "maxsx": null,
        "debug": false,
        "undirected": false,
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

