This module generates random DAGs with missingness indicator nodes using *randDAG* from the R package `pcalg <https://cran.r-project.org/web/packages/pcalg/pcalg.pdf>`_.

It first generates a DAG with ``n`` nodes and ``d`` neighbours per node on average, then relabels ``n_missing`` nodes as missingness indicators (``R_X``) where ``X`` is a substantive variable.

**Constraints for missingness indicator nodes:**

- ``R_X`` nodes must be either sink nodes (no children) or only have other ``R_`` nodes as children
- ``R_X`` cannot be a neighbor of ``X`` (the variable it represents missingness for)

**Parameters:**

- ``n``: Total number of nodes (substantive + missingness indicators)
- ``d``: Average neighborhood size
- ``n_missing``: Number of nodes to relabel as ``R_X`` (must be <= n/2)
- ``max_parents``: Maximum number of parents per node
- ``method``: Algorithm for randDAG (e.g., 'er' for Erdos-Renyi)
- ``par1``, ``par2``: Additional parameters for randDAG method

For further details on the underlying randDAG function, see :footcite:t:`JSSv047i11`.

