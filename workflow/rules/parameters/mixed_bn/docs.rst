This module generates parameters for a mixed Bayesian network with both continuous and discrete variables, based on the approach from Andrews et al. "Scoring Bayesian Networks of Mixed Variables".

**How it works:**

- **Continuous nodes without parents:** Sampled from Gaussian with random mean and variance
- **Continuous nodes with parents:** Linear regression on continuous parents, partitioned by discrete parents. Each partition has different regression coefficients.
- **Discrete nodes without parents:** Marginal distribution sampled from Dirichlet
- **Discrete nodes with continuous parents:** Continuous parents are discretized into bins. CPT is sampled from Dirichlet over all (discretized) parent configurations.

**Missingness indicators (R_ nodes):**

Nodes prefixed with ``R_`` are automatically treated as binary discrete variables, representing missingness indicators. They can have both continuous and discrete parents.

**Parameters:**

- ``prob_discrete``: Probability a substantive node is discrete (default 0.5)
- ``min_levels``, ``max_levels``: Range for number of levels in discrete nodes
- ``min_bins``, ``max_bins``: Range for number of bins when discretizing continuous parents
- ``coef_min``, ``coef_max``: Range for regression coefficients
- ``noise_sd_min``, ``noise_sd_max``: Range for noise standard deviation
- ``dirichlet_alpha``: Concentration parameter for Dirichlet distribution

**Reference:** Andrews, B., Ramsey, J., & Cooper, G. F. (2018). Scoring Bayesian Networks of Mixed Variables. International Journal of Data Science and Analytics.
