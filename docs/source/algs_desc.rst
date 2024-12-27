Benchpress provides access to a wide range of open-source packages for causal discovery and structure learning such as `pcalg <https://cran.r-project.org/web/packages/pcalg/>`__, `BDgraph <https://cran.r-project.org/web/packages/BDgraph/>`__, `gCastle <https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle>`__, `TETRAD <https://github.com/cmu-phil/tetrad>`__, `bnlearn <https://www.bnlearn.com/>`__, `causal-learn <https://github.com/cmu-phil/causal-learn>`__, and many others, making it easy to use and compare different algorithms within a unified framework.
The algorithms are accest through their corresponding modules, which are listed below. 
To use an algorithm module, a section with the corresponding name is simply added to the ``structure_learning_algorithms`` section of the JSON config file. 
Sample JSON snippets are provided for each module and you may also review :ref:`json_config` to see how it works.

The algorithm parameters used in the modules are inherited from the underlying packages as much as possible, maintaining consistency with the original implementations.
This means that users familiar with the original packages can easily transfer their knowledge and existing configurations to Benchpress. 
Users can also refer to the documentation of the underlying packages (linked to in each module) to better understand the parameters and their effects.
Apart from the original parameters, each algorithm module is equipped with an additional parameter, ``timeout``, which is the maximum time in seconds allowed for the algorithm to run.
After the timeout, the algorithm will be terminated and either an empty file will be created or the current best graph will be saved (if the algorithm supports that).

Modules for MCMC algorithms can be used seamlessly with the other modules. However, apart from the original parameters and ``timeout``, these modules have four additional fields:

* ``mcmc_seed`` is the random seed for the algorithm. 
* ``mcmc_estimator`` specifies which estimator to use (*threshold* or *map*). 
* ``threshold`` specifies the threshold for the posterior edge probabilities if ``mcmc_estimator`` is set to *threshold*. 
* ``burnin_frac`` is a value in (0, 1) that specifies the fraction of the samples at the beginning of the graph trajectory to be discarded as burn-in.
