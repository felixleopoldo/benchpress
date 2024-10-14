

.. _tetrad_ftfc: 

tetrad_ftfc 
---------------

.. rubric:: FTFC

.. list-table:: 

   * - Package
     - `causal-cmd <https://github.com/bd2kccd/causal-cmd>`__
   * - Version
     - 1.10.0
   * - Language
     - `Java <https://www.java.com/en/>`__
   * - Docs
     - `here <https://cmu-phil.github.io/tetrad/manual/#search_box>`__
   * - Paper
     - 
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__

   * - Module folder
     - `tetrad_ftfc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_ftfc>`__



.. rubric:: Description

From the Tetrad manual: FTFC (Find Two Factor Clusters) is similar to FOFC, but instead of each cluster having one latent that is the parent of all of the measure in the cluster, it instead has two such latents. So each measure has two latent parents; these are two “factors.” Similarly to FOFC, constraints are checked for, but in this case, the constraints must be sextad constraints, and more of them must be satisfied for each pure cluster (see Kummerfelt et al., 2014). Thus, the number of measures in each cluster, once impure edges have been taken into account, must be at least six, preferably more.

.. rubric:: Adding Background Knowledge
tetrad_tfc allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "ftfc",
        "datatype": "continuous",
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

