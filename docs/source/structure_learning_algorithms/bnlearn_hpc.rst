


:og:description: From bnlearn: an algorithm building on iamb.fdr to learn the parents and children of each node like mmpc and si.hiton.pc. The reference publication is the same as that for Hybrid HPC.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: HPC (bnlearn_hpc)
 
.. meta::
    :title: HPC 
    :description: From bnlearn: an algorithm building on iamb.fdr to learn the parents and children of each node like mmpc and si.hiton.pc. The reference publication is the same as that for Hybrid HPC.


.. _bnlearn_hpc: 

HPC (bnlearn) 
**************



.. list-table:: 

   * - Module name
     - `bnlearn_hpc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/bnlearn_hpc>`__
   * - Package
     - `bnlearn <https://www.bnlearn.com/>`__
   * - Version
     - 4.8.3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://www.bnlearn.com/documentation/man/constraint.html>`__
   * - Paper
     - :footcite:t:`GASSE20146755`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/bnlearn:4.8.3 <https://hub.docker.com/r/bpimages/bnlearn/tags>`__




HPC 
-------


From bnlearn: an algorithm building on iamb.fdr to learn the parents and children of each node like mmpc and si.hiton.pc. The reference publication is the same as that for Hybrid HPC.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "hpc-zf",
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
        "id": "hpc-mi",
        "alpha": [
          0.01,
          0.05,
          0.1,
          0.2
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

