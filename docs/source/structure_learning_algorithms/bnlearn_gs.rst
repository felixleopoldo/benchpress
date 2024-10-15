

.. _bnlearn_gs: 

bnlearn_gs 
--------------

.. rubric:: Grow-shrink

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



.. rubric:: Description

The grow-shrink (GS) algorithm is based on the Markov blanket of the nodes in a DAG. For
a specific node, the Markov blanket it the set of nodes which conditioning upon renders it
conditionally independent from all other variables :footcite:t:`margaritis2003learning`. It is a constraint-based
method which estimates the Markov blanket of a node in a two-stage forward-backward proce-
dure using conditional independence tests. The Markov blankets are used to first estimate an
undirected graph and then estimate a DAG in a four-step procedure.

.. rubric:: Adding Background Knowledge
bnlearn_gs allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

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

.. rubric:: Example edgeConstraints.json 

.. code-block:: json

    {
        "forbidden_edges": [["1", "2"], ["3", "4"]],
        "required_edges": [["2", "3"], ["4", "5"]],
        "tiers": [["1", "2"], ["3", "4"]],
        "tier_settings": {
            "forbid_within_tiers": true,
            "can_only_cause_next_tier": false
        },
        "forbidden_groups": [{"cause": ["1"], "effect": ["3", "4"]}],
        "required_groups": [{"cause": ["2"], "effect": ["5"]}]
    }

.. footbibliography::

