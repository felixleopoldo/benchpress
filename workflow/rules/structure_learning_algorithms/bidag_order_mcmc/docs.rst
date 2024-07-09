This technique relies on a Bayesian perspective on structure learning, where the score of a DAG
is defined as its posterior distribution. To overcome the limitation of simple structure-based
MCMC schemes, :footcite:t:`friedman2003being` turned to a score defined as the sum of the
posterior scores of all DAG which are consistent with a given topological ordering of the
nodes. One can then run a Metropolis-Hasting algorithm to sample from the distribution
induced by the order score, and later draw a DAG consistent with the order. This strategy
substantially improves convergence with respect to earlier structure MCMC scheme, though it
unfortunately produces a biased sample on the space of DAGs. The implementation considered
in Benchpress is a hybrid version with the sampling performed on a restricted search space
initialised with constraint-based testing and improved with a score-based search :footcite:t:`doi:10.1080/10618600.2021.2020127`.