Abstract: We propose a methodology for Bayesian model determination in decomposable graphical Gaussian models. To achieve this aim we consider a hyper inverse Wishart prior
distribution on the concentration matrix for each given graph. To ensure compatibility
across models, such prior distributions are obtained by marginalisation from the prior
conditional on the complete graph. We explore alternative structures for the hyperparameters of the latter, and their consequences for the model. Model determination is carried
out by implementing a reversible jump Markov chain Monte Carlo sampler. In particular,
the dimension-changing move we propose involves adding or dropping an edge from the
graph. We characterise the set of moves which preserve the decomposability of the graph,
giving a fast algorithm for maintaining the junction tree representation of the graph at
each sweep. As state variable, we use the incomplete variance-covariance matrix, containing only the elements for which the corresponding element of the inverse is nonzero. This
allows all computations to be performed locally, at the clique level, which is a clear
advantage for the analysis of large and complex datasets.