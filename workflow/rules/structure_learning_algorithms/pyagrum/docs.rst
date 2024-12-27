pyAgrum is a scientific C++ and Python library dedicated to Bayesian networks (BN) and other Probabilistic Graphical Models. Based on the C++ aGrUM library, it provides a high-level interface to the C++ part of aGrUM allowing to create, manage and perform efficient computations with Bayesian networks and others probabilistic graphical models : Markov random fields (MRF), influence diagrams (ID) and LIMIDs, credal networks (CN), dynamic BN (dBN), probabilistic relational models (PRM).


.. rubric:: Example 

Config file: `config.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/pyagrum/config.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/pyagrum/config.json

The following figure shows FP/P vs. TP/P for pattern graphs based on 5 datsets corresponding to 5 realisations of a 80-variables random binary Bayesian network, with an average indegree of 4.


.. _pyagrumplot:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/pyagrum/pattern.png
    :width: 320 
    :alt: pyAgrum FP/P vs. TP/P example
    :align: center

    FP/P vs. TP/P. for pattern graphs

