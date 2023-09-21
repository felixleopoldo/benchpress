Abstract: The Sparsest Permutation (SP) algorithm is accurate but limited to about 9 variables in practice; the
Greedy Sparest Permutation (GSP) algorithm is faster but less weak theoretically. A compromise can
be given, the Best Order Score Search, which gives results as accurate as SP but for much larger and
denser graphs. BOSS (Best Order Score Search) is more accurate for two reason: (a) It assumes the
“brute faithfuness” assumption, which is weaker than faithfulness, and (b) it uses a different traversal
of permutations than the depth first traversal used by GSP, obtained by taking each variable in turn and
moving it to the position in the permutation that optimizes the model score. Results are given comparing
BOSS to several related papers in the literature in terms of performance, for linear, Gaussian data. In
all cases, with the proper parameter settings, accuracy of BOSS is lifted considerably with respect to
competing approaches. In configurations tested, models with 60 variables are feasible with large samples
out to about an average degree of 12 in reasonable time, with near-perfect accuracy, and sparse models
with an average degree of 4 are feasible out to about 300 variables on a laptop, again with near-perfect
accuracy. Mixed continuous discrete and all-discrete datasets were also tested. The mixed data analysis
showed advantage for BOSS over GES more apparent at higher depths with the same score; the discrete
data analysis showed a very small advantage for BOSS over GES with the same score, perhaps not
enough to prefer it.

.. rubric:: Example 

Config file: `dense_large_SEM.json <../../workflow/rules/structure_learning_algorithms/tetrad_boss/config/dense_large_SEM.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/tetrad_boss/config/dense_large_SEM.json

:numref:`bossplot` and :numref:`bosstimings`  shows FP/P vs. TP/P and timings based on 3 datsets corresponding to 3 realisations of a 80-variables random Gaussian SEM, with an average indegree of 4.
Each dataset contains 300 samples.
:numref:`bosstype` and :numref:`bossprops` shows the type of graphs estimated and the properties of the true graphs, respectively.

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



