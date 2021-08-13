# Samples and inverts a precision matrics from the G-Wishart distribution.

library(BDgraph)

seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

df <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)

adjmat <- as.matrix(df)

print("Simulating G Wishart matrix")
precmat <- rgwish( n = 1, adj = adjmat, b = as.integer(snakemake@wildcards[["b"]]), D = NULL, 
                threshold = as.numeric(snakemake@input[["threshold"]]))

covmat = solve(precmat)
colnames(covmat) <- colnames(df)

filename <- snakemake@output[["params"]]
write.table(covmat, file = filename, row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ",")