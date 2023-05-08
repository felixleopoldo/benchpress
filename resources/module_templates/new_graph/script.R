# Samples the adjacency matrix for a random undirected graph.

# These are the parameters that are passed to the script from the config file.
p <- as.integer(snakemake@wildcards[["p"]])
cutoff <- as.numeric(snakemake@wildcards[["cutoff"]])

set.seed(as.integer(snakemake@wildcards[["replicate"]]))

adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > cutoff
adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
diag(adjmat) <- 0 # No self loops
colnames(adjmat) <- as.character(seq(p))

write.table(adjmat,
  file = snakemake@output[["adjmat"]], row.names = FALSE,
  quote = FALSE, col.names = TRUE, sep = ","
)
