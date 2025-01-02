


:og:description: As in GS, this algorithm is also based on the Markov blanket method to first determine the undirected skeleton. However, in incremental association Markov blanket (inter-IAMB) the variable to be included in the Markov blankets are not considered in static order as in GS and the forward-backward stages are combined into a single procedure, which has the effect of reducing the size of the blankets.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: INTER-IAMB (bnlearn)
 
.. meta::
    :title: INTER-IAMB (bnlearn)
    :description: As in GS, this algorithm is also based on the Markov blanket method to first determine the undirected skeleton. However, in incremental association Markov blanket (inter-IAMB) the variable to be included in the Markov blankets are not considered in static order as in GS and the forward-backward stages are combined into a single procedure, which has the effect of reducing the size of the blankets.


.. _bnlearn_interiamb: 

INTER-IAMB (bnlearn) 
*********************



.. list-table:: 

   * - Module name
     - `bnlearn_interiamb <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_interiamb>`__
   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.8.3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - :footcite:t:`1565788`
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




INTER-IAMB 
--------------


As in GS, this algorithm is also based on the Markov blanket method to first determine the
undirected skeleton. However, in incremental association Markov blanket (inter-IAMB) the
variable to be included in the Markov blankets are not considered in static order as in GS
and the forward-backward stages are combined into a single procedure, which has the effect of
reducing the size of the blankets.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "interiamb-zf",
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
        "id": "interiamb-mi",
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

