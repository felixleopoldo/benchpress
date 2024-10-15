

.. _bnlearn_iambfdr: 

bnlearn_iambfdr 
-------------------

.. rubric:: IAMB-FDR

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
     - :footcite:t:`10.1007/978-3-540-78757-0_15`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_iambfdr <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_iambfdr>`__



.. rubric:: Description

Abstract: In many cases what matters is not whether a false discovery is made or not but the expected proportion of false discoveries among all the discoveries made, i.e. the so-called false discovery rate (FDR). We present an algorithm aiming at controlling the FDR of edges when learning Gaussian graphical models (GGMs). The algorithm is particularly suitable when dealing with more nodes than samples, e.g. when learning GGMs of gene networks from gene expression data. We illustrate this on the Rosetta compendium [8].

.. rubric:: Adding Background Knowledge
bnlearn_iambfdr allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "iambfdr-zf",
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
        "id": "iambfdr-mi",
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

