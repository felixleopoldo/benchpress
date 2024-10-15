

.. _tetrad_ica-lingam: 

tetrad_ica-lingam 
---------------------

.. rubric:: ICA-LINGAM

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
     - :footcite:t:`shimizu2006linear`, :footcite:t:`hyvarinen2002independent`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__

   * - Module folder
     - `tetrad_ica-lingam <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_ica-lingam>`__



.. rubric:: Description

From the Tetrad manual: LiNGAM :footcite:t:`shimizu2006linear` was one of the first of the algorithms that assumed linearity among the variables and non-Gaussianity of error term, and still one of the best for smaller models, for the basic algorithm, implemented here. The idea is to use the Independent Components Analysis (ICA) algorithm to check all permutations of the variables to find one that is a causal order—that is, one in which earlier variables can cause later variables but not vice-versa. The method is clever. First, since we assume the model is a directed acyclic graph (DAG), there must be some permutation of the variables for which the main diagonal of the inverse of the weight matrix contains no zeros. This gives us a permuted estimate of the weight matrix. Then we look for a permutation of this weight matrix that is lower triangular. There must be one, since the model is assumed to be a DAG. But a lower triangular weight matrix just gives a causal order, so we’re done.

In the referenced paper, we implement Algorithm A, which is described above. Once one has a causal order the only thing one needs to do is to eliminate the extra edges. For this, we use the causal order to define knowledge of tiers and run FGES.

Our implementation of LiNGAM has one parameter, penalty discount, used for the FGES adjacency search. The method as implemented does not scale much beyond 10 variables, because it is checking every permutation of all of the variables (twice). The implementation of ICA we use is FastIca  :footcite:t:`hyvarinen2002independent`.


.. rubric:: Adding Background Knowledge
tetrad_ica-lingam allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "lingam",
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

