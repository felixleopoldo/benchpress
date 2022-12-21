An object of this module defines a Bayesian network by generating the weight matrix :math:`W` of a Gaussian linear structural equation model (SEM) of the form

.. math::

    Y_i=\sum_{j:Y_j\in pa(Y)} W_{ij}Y_j + Z_i,


where :math:`Z_i\sim \mathcal N(\mu, \sigma^2)` and elements of :math:`W` are distributed as
    
.. math::

    W_{ij} \sim 
    \begin{cases}
    \mathrm{Unif}([a, b])\mathrm{Unif}(\{-1,1\}) & \text{ if }(i, j) \in E\\
    0 & \text{ otherwise.}
    \end{cases}
    
