This module plots the  values in the trajectory of a given functional. 

The ``mcmc_traj_plots`` module has a list of objects, where each object has

+----------------+-------------------------------------------------------------------+
| Field          | Description                                                       |
+----------------+-------------------------------------------------------------------+
| ``id``         | algorithm module object id.                                       |
+----------------+-------------------------------------------------------------------+
| ``burn_in``    | use samples starting from this value. Use 0 if no burn-in.        |
+----------------+-------------------------------------------------------------------+
| ``functional`` | the currently supported functionals are *size* and graph *score*. |
+----------------+-------------------------------------------------------------------+

Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the ``thinning`` field. 


..  figure:: _static/alarm/score.png
    :alt: Score trajectories of order MCMC

    Score trajectories of order MCMC with 3 different seeds and parameter settings for the ``am`` parameter.
