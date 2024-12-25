Abstract: Bayesian inference for undirected graphical models is mostly restricted to
the class of decomposable graphs, as they enjoy a rich set of properties making them amenable to high-dimensional problems. While parameter inference is
straightforward in this setup, inferring the underlying graph is a challenge driven
by the computational difficultly in exploring the space of decomposable graphs.
This work makes two contributions to address this problem. First, we provide
sufficient and necessary conditions for when multi-edge perturbations maintain
decomposability of the graph. Using these, we characterize a simple class of
partitions that efficiently classify all edge perturbations by whether they maintain decomposability. Second, we propose a new parallel non-reversible Markov
chain Monte Carlo sampler for distributions over junction tree representations
of the graph, where at every step, all edge perturbations within a partition are
executed simultaneously. Through simulations, we demonstrate the efficiency of
our new edge perturbation conditions and class of partitions. We find that our
parallel sampler yields improved mixing properties in comparison to the single-
move variate, and outperforms current methods.

.. important:: 

  This module only works on the AMD64 architecture.