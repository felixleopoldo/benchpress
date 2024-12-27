


:og:description: FTFC (Find Two Factor Clusters) is similar to FOFC, but instead of each cluster having one latent that is the parent of all of the measure in the cluster, it instead has two such latents.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: FTFC (TETRAD)
 
.. meta::
    :title: FTFC (TETRAD)
    :description: FTFC (Find Two Factor Clusters) is similar to FOFC, but instead of each cluster having one latent that is the parent of all of the measure in the cluster, it instead has two such latents.


.. _tetrad_ftfc: 

FTFC (TETRAD) 
**************



.. list-table:: 

   * - Module name
     - `tetrad_ftfc <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_ftfc>`__
   * - Package
     - `TETRAD <https://github.com/bd2kccd/causal-cmd>`__
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
   * - MCMC
     - No
   * - Edge constraints
     - :ref:`Yes <edge_constraints>`
   * - Data type
     - C, D
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__




Find Two Factor Clusters 
----------------------------


From the Tetrad manual: FTFC (Find Two Factor Clusters) is similar to FOFC, but instead of each cluster having one latent that is the parent of all of the measure in the cluster, it instead has two such latents. So each measure has two latent parents; these are two “factors.” Similarly to FOFC, constraints are checked for, but in this case, the constraints must be sextad constraints, and more of them must be satisfied for each pure cluster (see Kummerfelt et al., 2014). Thus, the number of measures in each cluster, once impure edges have been taken into account, must be at least six, preferably more.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "ftfc",
        "datatype": "continuous",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

