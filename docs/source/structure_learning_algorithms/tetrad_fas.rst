


:og:description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: temporal PC (tetrad_fas)
 
.. meta::
    :title: temporal PC 
    :description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.


.. _tetrad_fas: 

tPC (tpc) 
**********



.. list-table:: 

   * - Module name
     - `tetrad_fas <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/tetrad_fas>`__
   * - Package
     - `tpc <https://github.com/bips-hb/tpc>`__
   * - Version
     - 137e18b
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://github.com/bips-hb/tpc>`__
   * - Paper
     - 
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Docker 
     - `bpimages/causal-cmd:1.10.0 <https://hub.docker.com/r/bpimages/causal-cmd/tags>`__




temporal PC 
---------------


From the Tetrad manual: This is just the adjacency search of the PC algorithm, included here for times when just the adjacency search is needed, as when one is subsequently just going to orient variables pairwise.

.. rubric:: Some fields described 
* ``edgeConstraints`` Name of the JSON file containing background knowledge 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "fas-fisher-z",
        "test": "fisher-z-test",
        "datatype": "continuous",
        "timeout": null,
        "edgeConstraints": "edgeConstraints.json"
      }
    ]

.. footbibliography::

