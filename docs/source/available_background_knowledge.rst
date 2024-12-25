.. _edge_constraints:

.. meta:: 
    :description: Benchpress allows users to incorporate edge constraints to guide structure learning and causal discovery algorithms in several packages: pcalg, mvpc, bnlearn, tetrad, gobnilp, and bidag. These constraints enable the inclusion of prior knowledge to refine the search space of causal graphs, improving the reliability of the inferred relationships. Users can specify forbidden or required edges, tiers for temporal ordering, and group-based constraints.
    :keywords: edge constraints, causal graph, structure learning,  causal discovery

Edge constraints
---------------------------------------

Benchpress allows users to incorporate edge constraints to guide structure learning algorithms in several modules: 
**pcalg_**, :ref:`bips_tpc`, :ref:`mvpc`, **bnlearn_**, **tetrad_**, :ref:`gobnilp`, and **bidag_**. These constraints enable the inclusion of prior knowledge to refine 
the search space of causal graphs, improving the reliability of the inferred relationships. Users can specify **forbidden or 
required edges**, **tiers for temporal ordering**, **contexts**, and **group-based constraints**.

The edge constraints should be defined in a JSON file located within the ``resources/constraints`` folder.

.. rubric:: Supported constraints

+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| Module:          | :ref:`bips_tpc` | :ref:`mvpc` | pcalg\_ | bnlearn\_ | tetrad\_ | :ref:`gobnilp` | bidag\_ |
+==================+=================+=============+=========+===========+==========+================+=========+
| forbidden_edges  | X               | X           | X       | X         | X        | X              | X       |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| required_edges   | N/A             | X           | X       | X         | X        | X              | N/A     |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| tiers            | X               | N/A         | N/A     | X         | X        | X              | N/A     |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| forbidden_groups | X               | N/A         | N/A     | X         | X        | X              | X       |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| required_groups  | N/A             | N/A         | N/A     | X         | X        | X              | N/A     |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| context_all      | X               | N/A         | N/A     | N/A       | N/A      | N/A            | N/A     |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| context_tier     | X               | N/A         | N/A     | N/A       | N/A      | N/A            | N/A     |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+
| source_nodes     | X               | N/A         | N/A     | N/A       | N/A      | N/A            | N/A     |
+------------------+-----------------+-------------+---------+-----------+----------+----------------+---------+

.. rubric:: Description

- ``forbidden_edges``: A list of directed edges that are explicitly prohibited from existing between specific nodes. Each edge is defined as a pair of nodes, where the first node cannot directly cause the second node. 
- ``required_edges``: A list of directed edges that are enforced between specific nodes. Each edge is defined as a pair of nodes, where the first node must directly cause the second node. 
- ``tiers``: Defines a temporal ordering of nodes across multiple levels (or) tiers. Nodes in one tier are constrained from causing nodes in any of the preceding tiers. 
- ``tier_settings``: 
  
  - ``forbidden_within_tiers``: If set to `true`, prevents edges between nodes that reside within the same tier. 
  - ``can_only_cause_next_tier``: If set to `true`, restricts nodes in one tier to only influence or cause nodes in the immediate next tier. 

- *Groups*: Defines relationships between sets of nodes, grouping them for the purpose of controlling edge behavior across multiple nodes at once. Each group is defined by a collection of "cause" nodes and "effect" nodes.
  
  - ``forbidden_groups``: A set of constraints that prohibits directed edges between specified groups of nodes. 
  - ``required_groups``: A set of requirements that enforces directed edges between specified groups of nodes. 
- ``context_all``: If set to `true`, edges added from this node to all other nodes.
- ``context_tier``: If set to `true`, edges added from this node to all nodes within the same tier.
- ``source_nodes``: A list of nodes that are restricted to have no parents.

.. note::

    For algorithms in the **pcalg** and **mvpc** *package, the above attributes only specify the presence or absence of edges and do not control their directionality.*

.. rubric:: Example JSON

.. code-block:: json

    {
        "forbidden_edges": [["1", "2"], ["3", "4"], ["5", "6"], ["7", "8"], ["9", "10"]],
        "required_edges": [["2", "3"], ["4", "5"], ["6", "7"], ["8", "9"], ["10", "11"]],
        "tiers": [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10", "11"]],
        "tier_settings": {
            "forbid_within_tiers": true,
            "can_only_cause_next_tier": true
        },
        "forbidden_groups": [
            {
                "cause": ["13", "14"],
                "effect": ["15", "16"]
            },
            {
                "cause": ["17", "18"],
                "effect": ["19", "20"]
            },
            {
                "cause": ["21"],
                "effect": ["22", "23"]
            }
        ],
        "required_groups": [
            {
                "cause": ["14", "15"],
                "effect": ["16", "17"]
            },
            {
                "cause": ["18"],
                "effect": ["20", "21"]
            },
            {
                "cause": ["22"],
                "effect": ["23"]
            }
        ],
        "context_all": ["1"],
        "context_tier": ["3"],
        "source_nodes": ["11"]
    }


This JSON structure includes forbidden and required edges, tier constraints, and group constraints that can be used across different packages supported by Benchpress.

- The variable names must match exactly, including case sensitivity, as they appear in the dataset. 
- To apply a single JSON file for defining edge constraints across multiple datasets, the module is designed to ignore any unrecognized variables.
