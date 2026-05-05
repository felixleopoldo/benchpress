TDIC runs temporal PC-style structure learning with conditional independence tests from ``micd``.

**``mgraph`` (boolean)**

- ``true``: For each substantive variable with missing values, add a binary indicator column ``R_<name>``, extend forbidden-edge constraints for those nodes, and estimate structure on the augmented set (missingness DAG / m-graph style).
- ``false``: Use only the substantive columns from the dataset CSV (no ``R_*`` nodes); ``forbEdges`` from edge constraints are left at the original size. Choose this when you want structure learning without explicit missingness-indicator variables.

This flag appears as a Snakemake wildcard and in output paths as ``mgraph={value}``.
