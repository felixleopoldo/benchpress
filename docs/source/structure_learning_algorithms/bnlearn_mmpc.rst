


    .. meta::
        :title: MMPC 
        :description: Abstract: Data Mining with Bayesian Network learning has two important characteristics: under conditions learned edges between variables correspond to casual influences, and second, for every variable T in the network a special subset (Markov Blanket) identifiable by the network is the minimal variable set required to predict T. However, all known algorithms learning a complete BN do not scale up beyond a few hundred variables. On the other hand, all known sound algorithms learning a local region of the network require an exponential number of training instances to the size of the learned region.The contribution of this paper is two-fold. We introduce a novel local algorithm that returns all variables with direct edges to and from a target variable T as well as a local algorithm that returns the Markov Blanket of T. Both algorithms (i) are sound, (ii) can be run efficiently in datasets with thousands of variables, and (iii) significantly outperform in terms of approximating the true neighborhood previous state-of-the-art algorithms using only a fraction of the training size required by the existing methods. A fundamental difference between our approach and existing ones is that the required sample depends on the generating graph connectivity and not the size of the local region; this yields up to exponential savings in sample relative to previously known algorithms. The results presented here are promising not only for discovery of local causal structure, and variable selection for classification, but also for the induction of complete BNs.
    

.. _bnlearn_mmpc: 

bnlearn_mmpc 
----------------

.. rubric:: MMPC

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
     - :footcite:t:`10.1145/956750.956838`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__

   * - Module folder
     - `bnlearn_mmpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_mmpc>`__



.. rubric:: Description

Abstract: Data Mining with Bayesian Network learning has two important characteristics: under conditions learned edges between variables correspond to casual influences, and second, for every variable T in the network a special subset (Markov Blanket) identifiable by the network is the minimal variable set required to predict T. However, all known algorithms learning a complete BN do not scale up beyond a few hundred variables. On the other hand, all known sound algorithms learning a local region of the network require an exponential number of training instances to the size of the learned region.The contribution of this paper is two-fold. We introduce a novel local algorithm that returns all variables with direct edges to and from a target variable T as well as a local algorithm that returns the Markov Blanket of T. Both algorithms (i) are sound, (ii) can be run efficiently in datasets with thousands of variables, and (iii) significantly outperform in terms of approximating the true neighborhood previous state-of-the-art algorithms using only a fraction of the training size required by the existing methods. A fundamental difference between our approach and existing ones is that the required sample depends on the generating graph connectivity and not the size of the local region; this yields up to exponential savings in sample relative to previously known algorithms. The results presented here are promising not only for discovery of local causal structure, and variable selection for classification, but also for the induction of complete BNs.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "mmpc-zf",
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
        "id": "mmpc-mi",
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

.. footbibliography::

