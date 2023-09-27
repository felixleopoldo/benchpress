This is a hybrid score-based optimisation technique based on Markov chain Monte Carlo
schemes :footcite:t:`doi:10.1080/10618600.2021.2020127`. The algorithm starts from a skeleton obtained
through a fast method (e.g. a constraint based method, or GES). Then it performs score and
search on the DAGs belonging to the space defined by the starting skeleton. To correct for
edges which may be missed, the search space is iteratively expanded to include one additional
parent for each variable from outside the current search space. The score and search phase relies
on an MCMC scheme producing a chain of DAGs from their posterior probability given the data.


.. rubric:: Example 

Config file: `itsearch_sem.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/bidag_itsearch/config/itsearch_sem.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/bidag_itsearch/config/itsearch_sem.json


:numref:`itsearchroc` and :numref:`itsearchtimings2`  show FP/P vs. TP/P and timings based on 10 datsets corresponding to 10 realisations of a 80-variables random Gaussian SEM, with an average indegree of 2 and maximum indegree of 5.
Each dataset contains 300 samples.
:numref:`itsearchtype2` and :numref:`itsearchprops2` shows the type of graphs estimated and the properties of the true graphs, respectively.


.. _itsearchroc:

.. figure:: ../../workflow/rules/structure_learning_algorithms/bidag_itsearch/images/roc.png
    :width: 320 
    :alt: FP/P vs. TP/P itsearch example
    :align: left

    FP/P vs. TP/P.


.. _itsearchtimings2:

.. figure:: ../../workflow/rules/structure_learning_algorithms/bidag_itsearch/images/time.png
    :width: 320 
    :alt: Timings itsearch example
    :align: right

    Timings.

.. _itsearchtype2:

.. figure:: ../../workflow/rules/structure_learning_algorithms/bidag_itsearch/images/graphtype.png
    :width: 320 
    :alt: Graph types example
    :align: left

    Type of graphs estimated.

.. _itsearchprops2:

.. figure:: ../../workflow/rules/structure_learning_algorithms/bidag_itsearch/images/graph_properties_plot.png
    :width: 320 
    :alt: Properties of the true graphs
    :align: right

    Graph properties.
