Abstract:
We consider the problem of estimating the marginal independence structure of a Bayesian network from observational data in the form of an undirected graph called the unconditional dependence graph. We show that unconditional dependence graphs of Bayesian networks correspond to the graphs having equal independence and intersection numbers. Using this observation, a Gröbner basis for a toric ideal associated to unconditional dependence graphs of Bayesian networks is given and then extended by additional binomial relations to connect the space of all such graphs. An MCMC method, called GrUES (Gröbner-based Unconditional Equivalence Search), is implemented based on the resulting moves and applied to synthetic Gaussian data. GrUES recovers the true marginal independence structure via a penalized maximum likelihood or MAP estimate at a higher rate than simple independence tests while also yielding an estimate of the posterior, for which the 20% HPD credible sets include the true structure at a high rate for data-generating graphs with density at least 0.5.

.. rubric:: Example

Config file: `grues_vs_corr-thresh.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/grues/grues_vs_corr-thresh.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/grues/grues_vs_corr-thresh.json
