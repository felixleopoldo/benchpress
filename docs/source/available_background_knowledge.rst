.. _edge_constraints:

Edge Constraints for Structure Learning
---------------------------------------

.. rubric:: Overview

Benchpress allows users to incorporate edge constraints to guide structure learning algorithms in several packages: 
**pcalg**, **bnlearn**, **tetrad**, **gobnilp**, and **bidag**. These constraints help incorporate prior knowledge to refine 
the search space of causal graphs, improving the reliability of the inferred relationships. Users can specify **forbidden** or 
**required** edges, tiers for temporal ordering, and group-based constraints.

The edge constraints should be defined in a JSON file located within the ``resources/constraints`` folder.

.. rubric:: Supported Constraints

+--------------------+---------------------+---------------------+--------------------+----------------------+-----------------------+
| **Package**        | **forbidden_edges** | **required_edges**  | **tiers**          | **forbidden_groups** | **required_groups**   |
+====================+=====================+=====================+====================+======================+=======================+
| pcalg              | X                   | X                   | N/A                | N/A                  | N/A                   |
+--------------------+---------------------+---------------------+--------------------+----------------------+-----------------------+
| bnlearn            | X                   | X                   | X                  | X                    | X                     |
+--------------------+---------------------+---------------------+--------------------+----------------------+-----------------------+
| tetrad             | X                   | X                   | X                  | X                    | X                     |
+--------------------+---------------------+---------------------+--------------------+----------------------+-----------------------+
| gobnilp            | X                   | X                   | X                  | X                    | X                     |
+--------------------+---------------------+---------------------+--------------------+----------------------+-----------------------+
| bidag              | X                   | N/A                 | N/A                | X                    | N/A                   |
+--------------------+---------------------+---------------------+--------------------+----------------------+-----------------------+

.. rubric:: Description

- **Forbidden Edges**: Directed edges that cannot exist.
- **Required Edges**: Directed edges that must exist.
- **Tiers**: Defines temporal ordering where nodes in one tier cannot cause nodes in preceding tiers.
- **Tier Settings**:
  - `forbid_within_tiers`: Prevents edges between nodes within the same tier.
  - `can_only_cause_next_tier`: Nodes in one tier can only cause nodes in the next tier.
- **Groups**: Defines edge relationships between groups of nodes.
  - `forbidden_groups`: Prevents directed edges between specified groups.
  - `required_groups`: Enforces directed edges between specified groups.

.. rubric:: Example JSON 

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

This JSON structure includes forbidden and required edges, tier constraints, and group constraints that can be used across different packages supported by Benchpress.
- The variable names must match exactly, including case sensitivity, as they appear in the dataset. 
- To apply a single JSON file for defining edge constraints across multiple datasets, the module is designed to ignore any unrecognized variables.
