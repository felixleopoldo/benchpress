


:og:description: Abstract: This paper presents a number of new algorithms for discovering the Markov Blanket of a target variable T from training data. The Markov Blanket can be used for variable selection for classification, for causal discovery, and for Bayesian Network learning. We introduce a low-order polynomial algorithm and several variants that soundly induce the Markov Blanket under certain broad conditions in datasets with thousands of variables and compare them to other state-of-the-art local and global methods with excellent results.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: Incremental Association Markov Blanket (IAMB)
 
.. meta::
    :title: Incremental Association Markov Blanket 
    :description: Abstract: This paper presents a number of new algorithms for discovering the Markov Blanket of a target variable T from training data. The Markov Blanket can be used for variable selection for classification, for causal discovery, and for Bayesian Network learning. We introduce a low-order polynomial algorithm and several variants that soundly induce the Markov Blanket under certain broad conditions in datasets with thousands of variables and compare them to other state-of-the-art local and global methods with excellent results.


.. _bnlearn_iamb: 

IAMB (bnlearn) 
***************



.. list-table:: 

   * - Module name
     - `bnlearn_iamb <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_iamb>`__
   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.8.3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - :footcite:t:`tsamardinos2003algorithms`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - :ref:`Yes <edge_constraints>`
   * - Data type
     - C, D, M
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__




Incremental Association Markov Blanket 
------------------------------------------


Abstract: This paper presents a number of new algorithms for discovering the Markov Blanket of a target variable T from training data. The Markov Blanket can be used for variable selection for classification, for causal discovery, and for Bayesian Network learning. We introduce a low-order polynomial algorithm and several variants that soundly induce the Markov Blanket under certain broad conditions in datasets with thousands of variables and compare them to other state-of-the-art local and global methods with excellent results.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "iamb-zf",
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
        "id": "iamb-mi",
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

