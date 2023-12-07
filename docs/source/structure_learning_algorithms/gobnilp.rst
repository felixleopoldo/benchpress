

.. _gobnilp: 

gobnilp 
-----------

.. rubric:: GOBNILP

.. list-table:: 

   * - Package
     - `GOBNILP (BitBucket) <https://bitbucket.org/jamescussens/gobnilp>`__
   * - Version
     - #4347c64
   * - Language
     - `C <https://en.wikipedia.org/wiki/C_(programming_language)>`__
   * - Docs
     - `here <https://www.cs.york.ac.uk/aig/sw/gobnilp/manual.pdf>`__
   * - Paper
     - :footcite:t:`https://doi.org/10.48550/arxiv.1202.3713`, :footcite:t:`BARTLETT2017258`, :footcite:t:`cussens2017bayesian`, :footcite:t:`pmlr-v138-cussens20a`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/gobnilp:4347c64 <https://hub.docker.com/r/bpimages/gobnilp/tags>`__

   * - Module folder
     - `gobnilp <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/gobnilp>`__



.. rubric:: Description

Globally optimal Bayesian network learning using integer linear programming (GOBNILP) is a score based method using integer linear programming (ILP) for learning an optimal DAG
for a Bayesian network with limit on the maximal number of parents for each node. It is a two-stage approach where candidate parent sets for each node are discovered in
the first phase and the optimal sets are determined in a second phase.

.. important:: 

  This module only works on the AMD64 architecture.

.. rubric:: Some fields described 
* ``constraints`` File with constraints to pass to the solver. The file should be placed in resources/constraints and the format is the same as used by gobnilp (see the docs). 
* ``extra_args`` File with extra arguments to pass to the solver. The file should be placed in resources/extra_args and the format is the same as used by gobnilp (see the docs). 
* ``gap_limit`` Gap limit. 
* ``time_limit`` Time limit in seconds for the solver (not including the time to build the score tables). 
* ``timeout`` Use the best DAG found so far after this number of seconds. 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gobnilp-bge",
        "continuous": true,
        "score_type": "BGe",
        "extra_args": null,
        "constraints": null,
        "plot": false,
        "palim": 3,
        "alpha_mu": [
          1e-05,
          0.0001,
          0.001
        ],
        "alpha_omega_minus_nvars": 2,
        "alpha": null,
        "time_limit": null,
        "gap_limit": null,
        "prune": true,
        "timeout": 800
      },
      {
        "id": "gobnilp-bde",
        "continuous": false,
        "score_type": "BDeu",
        "extra_args": null,
        "constraints": null,
        "plot": false,
        "palim": 4,
        "alpha_mu": null,
        "alpha_omega_minus_nvars": null,
        "alpha": [
          0.001,
          0.01,
          0.1
        ],
        "time_limit": null,
        "gap_limit": null,
        "prune": true,
        "timeout": 600
      }
    ]

.. footbibliography::

