

.. _bnlearn_hpc: 

bnlearn_hpc 
---------------

.. rubric:: HPC

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
     - :footcite:t:`GASSE20146755`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_hpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_hpc>`__



.. rubric:: Description

From bnlearn: an algorithm building on iamb.fdr to learn the parents and children of each node like mmpc and si.hiton.pc. The reference publication is the same as that for Hybrid HPC.

.. rubric:: Adding Background Knowledge
bnlearn_hpc allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "hpc-zf",
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
        "id": "hpc-mi",
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

