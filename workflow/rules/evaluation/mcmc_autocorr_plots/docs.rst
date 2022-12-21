
This module plots the auto-correlation of a functional of the graphs in a MCMC trajectory. 

+----------------+----------------------------------------------------------------------------------------------------------------------------+
| Field          | Description                                                                                                                |
+----------------+----------------------------------------------------------------------------------------------------------------------------+
| ``id``         | algorithm module object id.                                                                                                |
+----------------+----------------------------------------------------------------------------------------------------------------------------+
| ``burn_in``    | use samples starting from this value. Use 0 if no burn-in.                                                                 |
+----------------+----------------------------------------------------------------------------------------------------------------------------+
| ``thinning``   | use only each ``thinning`` sample of the chain. (It is usually recommended to use this if the number of samples if large). |
+----------------+----------------------------------------------------------------------------------------------------------------------------+
| ``functional`` | the currently supported functionals are the number of edges for the graphs *size* and the graph *score*.                   |
+----------------+----------------------------------------------------------------------------------------------------------------------------+
| ``lags``       | The maximum number of lags after ``thinning``.                                                                             |
+----------------+----------------------------------------------------------------------------------------------------------------------------+

..  figure:: _static/omcmcscoreautocorr.png
    :alt: Score trajectory of order MCMC

    Auto-correlation of the scores in trajectory of order MCMC

..  figure:: _static/alarm/autocorr_score.png
    :alt: Multiple score trajectory of order MCMC

    Auto-correlation of the scores in trajectory of order MCMC for differnt algorithm seeds and parameter settings.

