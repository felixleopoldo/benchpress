

.. _tetrad_fges: 

tetrad_fges 
---------------

.. rubric:: FGES

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
     - :footcite:t:`meek1997graphical`, :footcite:t:`chickering2002optimal`, :footcite:t:`ramsey2017million`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__

   * - Module folder
     - `tetrad_fges <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fges>`__



.. rubric:: Description

From the Tetrad manual:  FGES is an optimized and parallelized version of an algorithm developed by :footcite:t:`meek1997graphical` called the Greedy Equivalence Search (GES). 
The algorithm was further developed and studied by :footcite:t:`chickering2002optimal`. 
GES is a Bayesian algorithm that heuristically searches the space of CBNs and returns the model with highest Bayesian score it finds. In particular, GES starts its search with the empty graph. It then performs a forward stepping search in which edges are added between nodes in order to increase the Bayesian score. This process continues until no single edge addition increases the score. Finally, it performs a backward stepping search that removes edges until no single edge removal can increase the score. More information is available here and here. 
The reference is :footcite:t:`ramsey2017million`.

The algorithms requires a decomposable score—that is, a score that for the entire DAG model is a sum of logged scores of each variables given its parents in the model. The algorithms can take all continuous data (using the SEM BIC score), all discrete data (using the BDeu score).

.. rubric:: Adding Background Knowledge
tetrad_fges allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "fges-sem-bic",
        "faithfulnessAssumed": true,
        "score": "sem-bic-score",
        "datatype": "continuous",
        "samplePrior": 1,
        "semBicStructurePrior": 1,
        "penaltyDiscount": [
          0.8,
          1,
          1.5
        ],
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

