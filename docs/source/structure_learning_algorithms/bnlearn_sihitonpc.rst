

.. _bnlearn_sihitonpc: 

bnlearn_sihitonpc 
---------------------

.. rubric:: S-I HITON-PC

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
     - :footcite:t:`JMLR:v11:aliferis10a`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_sihitonpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_sihitonpc>`__



.. rubric:: Description

Abstract: We present an algorithmic framework for learning local causal structure around target variables of interest in the form of direct causes/effects and Markov blankets applicable to very large data sets with relatively small samples. The selected feature sets can be used for causal discovery and classification. The framework (Generalized Local Learning, or GLL) can be instantiated in numerous ways, giving rise to both existing state-of-the-art as well as novel algorithms. The resulting algorithms are sound under well-defined sufficient conditions. In a first set of experiments we evaluate several algorithms derived from this framework in terms of predictivity and feature set parsimony and compare to other local causal discovery methods and to state-of-the-art non-causal feature selection methods using real data. A second set of experimental evaluations compares the algorithms in terms of ability to induce local causal neighborhoods using simulated and resimulated data and examines the relation of predictivity with causal induction performance.
Our experiments demonstrate, consistently with causal feature selection theory, that local causal feature selection methods (under broad assumptions encompassing appropriate family of distributions, types of classifiers, and loss functions) exhibit strong feature set parsimony, high predictivity and local causal interpretability. Although non-causal feature selection methods are often used in practice to shed light on causal relationships, we find that they cannot be interpreted causally even when they achieve excellent predictivity. Therefore we conclude that only local causal techniques should be used when insight into causal structure is sought.
In a companion paper we examine in depth the behavior of GLL algorithms, provide extensions, and show how local techniques can be used for scalable and accurate global causal graph learning.



.. rubric:: Adding Background Knowledge
bnlearn_sihitonpc allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "sihitonpc-zf",
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
        "id": "sihitonpc-mi",
        "alpha": [
          0.01,
          0.05
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

