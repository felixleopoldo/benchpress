
.. _smallstudy:

Random  Gaussian SEM (small study)
****************************************************************************

Config file: `config/paper_er_sem_small.json <https://github.com/felixleopoldo/benchpress/blob/master/config/paper_er_sem_small.json>`__.

Command:

.. prompt:: bash

    snakemake --cores all --use-singularity --configfile config/paper_er_sem_small.json

Approximate time: 40 min. on a 3.1 GHz Dual-Core Intel Core i5.


In the present study we consider a broader simulation over 13 algorithms in a similar Gaussian data setting as in  :ref:`pcdualpcstudy`, with the only difference that the number of nodes is reduced to 20 and the number of seeds is increased to 20.


.. _study_2/FPR_TPR_pattern.png:

.. figure:: _static/study_2/FPR_TPR_pattern.png
    :width: 305 
    :alt: FP/P vs. TP/P
    :align: left

    FP/P vs. TP/P.

.. _study_2/elapsed_time_joint.png:

.. figure:: _static/study_2/elapsed_time_joint.png
    :width: 305
    :alt: 

    Timing.



:numref:`study_2/FPR_TPR_pattern.png` shows `FP/P <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>`_ / `TP/P <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>`_  based on pattern graphs and :numref:`study_2/elapsed_time_joint.png`  shows the computational times.
We can directly observe that :ref:`bidag_order_mcmc` (*omcmc-bge*) has the best (near perfect) performance, and that it comes at the cost of longer computational time.
Apart from this, the results of :numref:`study_2/FPR_TPR_pattern.png` may be partitioned into two regions, :ref:`tetrad_fges` (*fges-sem-bic*), :ref:`bnlearn_hc` (*hc-bge*), and :ref:`bnlearn_tabu` (*tabu-bge*) having higher values for both `FP/P <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>`_ and `TP/P <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>`_  and the rest having lower values for both `FP/P <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>`_  and `TP/P <https://en.wikipedia.org/wiki/Receiver_operating_characteristic>`_ .


