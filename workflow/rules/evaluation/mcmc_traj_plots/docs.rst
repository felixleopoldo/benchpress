This module plots the  values in the trajectory of a given functional. 

* Fields 

  * ``burn_in`` is the final index of the so-called burn-in period. Use 0 for no burn-in.
  * ``functional`` should be one of the supported functionals *size* or graph *score*. 
  * ``thinning`` tells the module to only considering every graph at a given interval length.  
  * ``active`` should be set to *false* to exclude deactivate.

..  figure:: _static/alarm/score.png
    :alt: Score trajectories of order MCMC

    Score trajectories of order MCMC with 3 different seeds and parameter settings for the ``am`` parameter.
