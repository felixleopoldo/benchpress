


:og:description: 
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: PC (PC)
 
.. meta::
    :title: PC 
    :description: 


.. _bnlearn_pcstable: 

PC (bnlearn) 
*************



.. list-table:: 

   * - Module name
     - `bnlearn_pcstable <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_pcstable>`__
   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.8.3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - :footcite:t:`doi:10.1177/089443939100900106`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Data type
     - 
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__




PC 
------


.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "pcstable-zf",
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
        "id": "pcstable-mi",
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

