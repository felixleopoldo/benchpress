

.. _mcmc_traj_plots: 

mcmc_traj_plots 
-------------------

.. rubric:: MCMC trajectories

.. list-table:: 

   * - Module
     - `mcmc_traj_plots <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/evaluation/mcmc_traj_plots>`__



.. rubric:: Description

This module plots the  values in the trajectory of a given functional. 

The ``mcmc_traj_plots`` module has a list of objects, where each object has

* Fields

  * ``burn_in`` percent [0, 1] to burn of the number of samples. 
  * ``functional`` the currently supported functionals are *size* and graph *score*. 
  * ``thinning`` tells the module to only considering every graph at a given interval length.
  * ``active`` should be set to *false* to deactivate.  



Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the ``thinning`` field. 


..  figure:: ../_static/alarm/score.png
    :alt: Score trajectories of order MCMC

    Score trajectories of order MCMC with 3 different seeds and parameter settings for the ``am`` parameter.


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "omcmc_itsample-bge",
        "burn_in": 0.5,
        "thinning": 1,
        "functional": [
          "score",
          "size"
        ],
        "active": true
      }
    ]

