
For Bayesian inference it is custom to use MCMC methods to simulate a Markov chain of graphs :math:`\{G^l\}_{l=0}^\infty` having the graph posterior as stationary distribution.
Suppose we have a realisation of length :math:`M + 1` of such chain, then the posterior edge probability of an edge e is estimated by :math:`\frac{1}{M+1-b} \sum_{l=b}^{M} \mathbf{1}_{e}(e^l)`, where the first :math:`b` samples are disregarded as a burn-in period.

This module has a list of objects, where each object has 

+-------------+-------------------------+
| Field       | Description             |
+-------------+-------------------------+
| ``id``      | the algorithm object id |
+-------------+-------------------------+
| ``burn_in`` | the burn-in period.     |
+-------------+-------------------------+

The estimated probabilities are plotted in heatmaps using seaborn which are saved in *results/mcmc_heatmaps/* and copied to *results/output/mcmc_heatmaps/* for easy reference.

..  figure:: _static/alarmordermcmc.png
    :alt: The Alarm network 

    Mean graph estimate of the Alarm network using order MCMC with startspace from iterative MCMC 
