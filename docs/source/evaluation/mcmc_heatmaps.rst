

.. _mcmc_heatmaps: 

mcmc_heatmaps 
-----------------

.. rubric:: MCMC mean graphs

.. list-table:: 

   * - Module
     - `mcmc_heatmaps <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/evaluation/mcmc_heatmaps>`__



.. rubric:: Description


For Bayesian inference it is custom to use MCMC methods to simulate a Markov chain of graphs :math:`\{G^l\}_{l=0}^\infty` having the graph posterior as stationary distribution.
Suppose we have a realisation of length :math:`M + 1` of such chain, then the posterior edge probability of an edge e is estimated by :math:`\frac{1}{M+1-b} \sum_{l=b}^{M} \mathbf{1}_{e}(e^l)`, where the first :math:`b` samples are disregarded as a burn-in period.

This module has a list of objects, where each object has 


* Fields

  * ``burn_in`` percent [0, 1] to burn of the number of samples. 
  


The estimated probabilities are plotted in heatmaps using seaborn which are saved in *results/mcmc_heatmaps/* and copied to *results/output/mcmc_heatmaps/* for easy reference.

..  figure:: ../_static/alarmordermcmc.png
    :alt: The Alarm network 

    Mean graph estimate of the Alarm network using order MCMC with startspace from iterative MCMC 


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "omcmc_itsample-bge",
        "burn_in": 0,
        "active": true
      }
    ]

