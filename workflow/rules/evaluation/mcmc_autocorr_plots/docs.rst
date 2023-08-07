

* Fields

  * ``burn_in`` percent [0, 1] to burn of the number of samples. 
  * ``functional`` the currently supported functionals are *size* and graph *score*. 
  * ``thinning`` tells the module to only considering every graph at a given interval length.
  * ``active`` should be set to *false* to deactivate.  
  * ``lags``  the maximum number of lags after ``thinning``.



This module plots the auto-correlation of a functional of the graphs in a MCMC trajectory. 


..  figure:: _static/omcmcscoreautocorr.png
    :alt: Score trajectory of order MCMC

    Auto-correlation of the scores in trajectory of order MCMC

..  figure:: _static/alarm/autocorr_score.png
    :alt: Multiple score trajectory of order MCMC

    Auto-correlation of the scores in trajectory of order MCMC for differnt algorithm seeds and parameter settings.

