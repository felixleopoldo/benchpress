


:og:description: A score-based two-phase algorithm where the first phase aims to identify the possible parent sets, :footcite:t:`scanagatta2015learning`; :footcite:t:`scanagatta2018approximate`.  The second phase performs an optimisation on a modification of the space of node orders introduced in :footcite:t:`teyssier2012ordering`, allowing edges from nodes of higher to lower order, provided that no cycles are introduced.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: ASOBS (rblip_asobs)
 
.. meta::
    :title: ASOBS 
    :description: A score-based two-phase algorithm where the first phase aims to identify the possible parent sets, :footcite:t:`scanagatta2015learning`; :footcite:t:`scanagatta2018approximate`.  The second phase performs an optimisation on a modification of the space of node orders introduced in :footcite:t:`teyssier2012ordering`, allowing edges from nodes of higher to lower order, provided that no cycles are introduced.


.. _rblip_asobs: 

rblip_asobs 
***************



.. list-table:: 

   * - Package
     - `r.blip <https://cran.r-project.org/web/packages/r.blip/index.html>`__
   * - Version
     - 1.1
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/r.blip/r.blip.pdf>`__
   * - Paper
     - :footcite:t:`scanagatta2018approximate`, :footcite:t:`scanagatta2015learning`, :footcite:t:`teyssier2012ordering`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - Docker 
     - `bpimages/rblip:1.1 <https://hub.docker.com/r/bpimages/rblip/tags>`__

   * - Module folder
     - `rblip_asobs <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/rblip_asobs>`__



ASOBS 
---------


A score-based two-phase algorithm where the first phase aims to identify the possible parent
sets, :footcite:t:`scanagatta2015learning`; :footcite:t:`scanagatta2018approximate`. 
The second phase performs an optimisation on a modification of the space of node orders introduced
in :footcite:t:`teyssier2012ordering`, allowing edges from nodes of higher to lower order, provided
that no cycles are introduced.



.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "winasobs-bdeu",
        "scorermethod": "is",
        "solvermethod": "winasobs",
        "indeg": 80,
        "timeout": 180,
        "allocated": 80,
        "scorefunction": "bdeu",
        "alpha": [
          0.001,
          0.01,
          0.1
        ],
        "cores": 1,
        "verbose_level": 0
      }
    ]

.. footbibliography::

