
Samples G-Wishart matrix given an undirected graph using the *rgwish* function from the R package  `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__.


Provided that :math:`G` is undirected, an object of this module defines a zero-mean Gaussian graphical model by sampling the precision matrix from the *G-Wishart* distribution [AH2005]_ [Len2013]_ using the *rgwish* function from the R package `BDgraph <https://cran.r-project.org/web/packages/BDgraph/index.html>`__.
The inverted precision matrix is saved, serving as covariance matrix in a Gaussian distribution.


