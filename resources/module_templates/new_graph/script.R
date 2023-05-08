# Samples the adjacency matrix for a random undirected graph.


p <- as.integer(snakemake@wildcards[["p"]])

# This is not used, just here to show how to handle null and integers.
# You may add other parameters in the config file.

seed_number <- as.integer(snakemake@wildcards[["replicate"]])
set.seed(seed_number)

adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > as.numeric(snakemake@wildcards[["cutoff"]])
adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
diag(adjmat) <- 0 # No self loops
colnames(adjmat) <- as.character(seq(p))

write.table(adjmat,
  file = snakemake@output[["adjmat"]], row.names = FALSE,
  quote = FALSE, col.names = TRUE, sep = ","
)
