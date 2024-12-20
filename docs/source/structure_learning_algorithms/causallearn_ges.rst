


:og:description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: temporal PC (causallearn_ges)
 
.. meta::
    :title: temporal PC 
    :description: This package implements the tPC algorithm for causal discovery. The 't' stands for 'temporal' or 'tiers' and indicates that background knowledge in the form of a partial node/variable ordering is available.


.. _causallearn_ges: 

tPC (tpc) 
**********



.. list-table:: 

   * - Module name
     - `causallearn_ges <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/causallearn_ges>`__
   * - Package
     - `tpc <https://github.com/bips-hb/tpc>`__
   * - Version
     - 137e18b
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://github.com/bips-hb/tpc>`__
   * - Paper
     - :footcite:t:`meek1997graphical`, :footcite:t:`chickering2002optimal`, :footcite:t:`ramsey2017million`
   * - Graph type
     - `CPDAG <https://search.r-project.org/CRAN/refmans/pcalg/html/dag2cpdag.html>`__
   * - Docker 
     - `bpimages/causal-learn:0.1.3.4-arm64 <https://hub.docker.com/r/bpimages/causal-learn/tags>`__




temporal PC 
---------------


Some text of the algorithm/module.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "myalg",
        "cutoff": 0.5,
        "timeout": null
      }
    ]

.. footbibliography::

