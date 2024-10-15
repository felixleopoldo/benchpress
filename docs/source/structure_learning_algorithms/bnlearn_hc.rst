

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

.. rubric:: Adding Background Knowledge
bnlearn_hc allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

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

