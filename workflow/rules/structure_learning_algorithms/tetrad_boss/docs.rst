BOSS (Best Order Score Search) is an algorithm that, like GRaSP, generalizes and extends the GSP (Greedy Sparsest Permutation) algorithm. It has been tested to 1000 variables with an average degree of 20 and gives near perfect precisions and recalls for N = 10,000 (with recall that drop to 0.9 for N = 1000). The algorithms works by building DAGs given permutations in ways similar to those described in Raskutti and Uhler and Solus et al.

.. rubric:: Example 

Config file: `boss_SEM.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/tetrad_boss/config/boss_SEM.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/tetrad_boss/config/boss_SEM.json

:numref:`bossplot` and :numref:`bosstimings`  show FP/P vs. TP/P and timings based on 10 datsets corresponding to 10 realisations of a 60-variables random Gaussian SEM, with an average indegree of 4.
Each dataset contains 300 samples.
:numref:`bosstype` and :numref:`bossprops` show the type of graphs estimated and the properties of the true graphs, respectively.

.. _bossplot:

.. figure:: ../../workflow/rules/structure_learning_algorithms/tetrad_boss/images/tprfpr_pattern.png
    :width: 320 
    :alt: FP/P vs. TP/P BOSS example
    :align: left

    FP/P vs. TP/P.

.. _bosstimings:

.. figure:: ../../workflow/rules/structure_learning_algorithms/tetrad_boss/images/time.png
    :width: 320 
    :alt: Timings BOSS example
    :align: right

    Timings.

.. _bosstype:

.. figure:: ../../workflow/rules/structure_learning_algorithms/tetrad_boss/images/graphtype.png
    :width: 320 
    :alt: Graph types example
    :align: left

    Type of graphs estimated.

.. _bossprops:

.. figure:: ../../workflow/rules/structure_learning_algorithms/tetrad_boss/images/graph_properties_plot.png
    :width: 320 
    :alt: Properties of the true graphs
    :align: right

    Graph properties.



