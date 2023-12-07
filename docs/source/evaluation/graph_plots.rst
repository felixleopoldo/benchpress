

.. _graph_plots: 

graph_plots 
---------------

.. rubric:: Graph plots

.. list-table:: 

   * - Module
     - `graph_plots <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/evaluation/graph_plots>`__



.. rubric:: Description

This module plots and saves the estimated graphs in dot-format and adjacency matrix.
It also plots graph comparison using *graphviz.compare* from `bnlearn <https://www.bnlearn.com/>`_.

..  figure:: ../_static/alarmpcgraph.png
    :alt: The Alarm network 

    Estimate of the Alarm network using PC algorithm

..  figure:: ../_static/alarmpcest.png
    :alt: The Alarm network 

    Estimate of the Alarm network using PC algorithm


.. rubric:: Example


.. code-block:: json


    [
      "fges-sem-bic",
      "mmhc-bge-zf",
      "omcmc_itsample-bge",
      "pc-gaussCItest"
    ]

