

.. _mcmc_autocorr_plots: 

mcmc_autocorr_plots 
-----------------------

.. rubric:: MCMC auto-correlation

.. list-table:: 

   * - Module
     - `mcmc_autocorr_plots <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/evaluation/mcmc_autocorr_plots>`__



.. rubric:: Description



* Fields

  * ``burn_in`` percent [0, 1] to burn of the number of samples. 
  * ``functional`` the currently supported functionals are *size* and graph *score*. 
  * ``thinning`` tells the module to only considering every graph at a given interval length.
  * ``active`` should be set to *false* to deactivate.  
  * ``lags``  the maximum number of lags after ``thinning``.



This module plots the auto-correlation of a functional of the graphs in a MCMC trajectory. 


..  figure:: ../_static/omcmcscoreautocorr.png
    :alt: Score trajectory of order MCMC

    Auto-correlation of the scores in trajectory of order MCMC

..  figure:: ../_static/alarm/autocorr_score.png
    :alt: Multiple score trajectory of order MCMC

    Auto-correlation of the scores in trajectory of order MCMC for differnt algorithm seeds and parameter settings.


.. note:: 
    
    Bug fix: For this to run, the ``mcmc_traj_plots`` module should also be present in the evaluation section. E.g. ``mcmc_traj_plots=[]``. 

.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "omcmc_itsample-bge",
        "burn_in": 0.5,
        "thinning": 1,
        "lags": 50,
        "functional": [
          "score",
          "size"
        ],
        "active": true
      }
    ]

