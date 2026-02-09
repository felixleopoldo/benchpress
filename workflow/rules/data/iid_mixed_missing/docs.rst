This module samples IID data from a mixed Bayesian network containing both continuous and discrete variables, with support for missingness indicators.

**How data is generated:**

Variables are sampled in topological order:

- **Continuous nodes without parents:** Sampled from Gaussian N(mean, sd)
- **Continuous nodes with parents:** Linear regression on continuous parents, with coefficients partitioned by discrete parent values
- **Discrete nodes without parents:** Sampled from multinomial distribution
- **Discrete nodes with continuous parents:** Continuous parents are discretized using equal-frequency binning, then sampled from CPT

**Missingness handling:**

- Variables prefixed with ``R_`` are missingness indicators
- After sampling, for each ``R_X`` variable, the corresponding ``X`` variable is set to NA where ``R_X = 0``
- This creates Missing At Random (MAR) or Missing Not At Random (MNAR) patterns depending on the DAG structure

**Output format:**

- CSV file with variable names as column headers
- First data row contains metadata: number of levels for discrete variables, NA for continuous
- Missing values are encoded as ``NA``

**Parameters:**

- ``n``: Sample size (single integer or list for multiple datasets)
- ``standardized``: Whether to standardize continuous variables (not yet implemented)

**Note:** This module must be used with the ``mixed_bn`` parameters module.
