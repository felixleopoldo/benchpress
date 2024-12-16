


    .. meta::
        :title: Grow-shrink 
        :description: The grow-shrink (GS) algorithm is based on the Markov blanket of the nodes in a DAG. For a specific node, the Markov blanket it the set of nodes which conditioning upon renders it conditionally independent from all other variables.
    

.. _bnlearn_gs: 

bnlearn_gs 
**************



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
     - :footcite:t:`margaritis2003learning`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_gs <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_gs>`__



Grow-shrink 
---------------


The grow-shrink (GS) algorithm is based on the Markov blanket of the nodes in a DAG. For
a specific node, the Markov blanket it the set of nodes which conditioning upon renders it
conditionally independent from all other variables :footcite:t:`margaritis2003learning`. It is a constraint-based
method which estimates the Markov blanket of a node in a two-stage forward-backward proce-
dure using conditional independence tests. The Markov blankets are used to first estimate an
undirected graph and then estimate a DAG in a four-step procedure.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gs-mi",
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
      },
      {
        "id": "gs-zf",
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
      }
    ]

.. footbibliography::

