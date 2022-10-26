# Samples and inverts a precision matrics from the G-Wishart distribution.

library(BDgraph)

seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

df <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)
adjmat <- as.matrix(df)
threshold <- as.numeric(snakemake@wildcards[["threshold_conv"]])
p <- nrow(adjmat)

print("Simulating G-Wishart matrix")
precmat <- rgwish(
  n = 1, adj = adjmat,
  b = as.integer(snakemake@wildcards[["b"]]), D = diag(p),
  threshold = threshold
)

print("Inverting the G-Wishart matrix")
covmat <- solve(precmat)
colnames(covmat) <- colnames(df)

filename <- snakemake@output[["params"]]
write.table(covmat,
  file = filename, row.names = FALSE,
  quote = FALSE, col.names = TRUE, sep = ","
)
