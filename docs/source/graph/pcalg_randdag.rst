

.. _pcalg_randdag: 

pcalg_randdag 
-----------------

.. rubric:: randDAG

.. list-table:: 

   * - Package
     - `pcalg <https://cran.r-project.org/web/packages/pcalg/index.html>`__
   * - Version
     - 2.7-3
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`__
   * - Paper
     - :footcite:t:`JSSv047i11`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__, `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/bidag:2.1.4 <https://hub.docker.com/r/bpimages/bidag/tags>`__

   * - Module
     - `pcalg_randdag <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/pcalg_randdag>`__



.. rubric:: Description

This is the *randDAG* from the R package `pcalg <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`_  with the extra feature that the maximum average number of parents can be set by ``max_parents``.

An object of the pcalg_randdag module specifies a graph generated using the randDAG
function from the pcalg package, with the extra functionality of restricting
the maximal number of parents per node (max_parents). It samples a random graph with n
nodes and d neighbours per node on average, using the algorithm specified by method with
parameters par1 and par2, for further details see :footcite:t:`JSSv047i11`.

.. Source `resources/binarydatagen/generate_DAG.R <https://github.com/felixleopoldo/benchpress/blob/master/resources/binarydatagen/generate_DAG.R>`_

.. See `JSON schema <https://github.com/felixleopoldo/benchpress/blob/master/schema/docs/config-definitions-generatedagmaxparents.md>`_ 



.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "avneigs4",
        "max_parents": 5,
        "n": 80,
        "d": 4,
        "par1": null,
        "par2": null,
        "method": "er",
        "DAG": true
      }
    ]

.. footbibliography::

