

.. _tetrad_fofc: 

tetrad_fofc 
---------------

.. rubric:: FOFC

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
     - `tetrad_fofc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fofc>`__



.. rubric:: Description

From the Tetrad manual: Searches for causal structure over latent variables, where the true models are Multiple Indicator Models (MIM’s) as described in the Graphs section. 
The idea is this. 
There is a set of latent (unmeasured) variables over which a directed acyclic model has been defined, Then for each of these latent L there are 3 (preferably 4) or more measures of that variable—that is, measured variables that are all children of L. Under these conditions, one may define tetrad constraints (see :footcite:t:`spirtes2000causation`). 
There is a theorem to the effect that if certain CPDAGs of these tetrad constraints hold, there must be a latent common cause of all of them (the Tetrad Representation Theorem). The FOFC (Find One Factor Clusters) takes advantage of this fact. The basic idea is to build up clusters one at a time by adding variables that keep them pure in the sense that all relevant tetrad constraints still hold. There are different ways of going about this. One could try to build one cluster up as far as possible, then remove all of those variables from the set, and try to make a another cluster using the remaining variables (SAG, Seed and Grow). Or one can try in parallel to grow all possible clusters and then choose among the grown clusters using some criterion such as cluster size (GAP, Grow and Pick). In general, GAP is more accurate. The result is a clustering of variables. Once one has such a “measurement model, one can estimate (using the ESTIMATOR box) a covariance matrix over the latent variables that are parents of the measures and use some algorithm such as PC or GES to estimate a CPDAG over the latent variables. The algorithm to run PC or GES on this covariance matrix is called MimBuild (“MIM” is the graph, Multiple Indicator Model; “Build” means build). MimBUILD is an optional choice inside FOFC In this way, one may recover causal structure over the latents. The more measures one has for each latent the better the result is, generally. At least 3 measured indicator variables are needed for each latent variable. The larger the sample size the better. 
One important issue is that the algorithm is sensitive to so-called “impurities”—that is,causal edges among the measured variables, or between measured variables and multiple latent variables. The algorithm will in effect remove one measure in each impure pair from consideration. Note that for FOFC, a test is done for each final cluster as to whether the variables in teh cluster are all mutually dependent. 

.. rubric:: Adding Background Knowledge
tetrad_fofc allows users to incorporate background knowledge directly into the causal algorithm using ``required_edges``, ``forbidden_edges``, ``tiers``, ``tier_settings``, ``required_groups`` and ``forbidden_groups``, which are specified in a JSON file.
For more details on defining edge constraints, see :doc:`../available_background_knowledge`.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "fofc",
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

