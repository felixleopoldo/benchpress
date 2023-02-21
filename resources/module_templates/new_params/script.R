library(BDgraph)

seed <- set.seed(as.integer(snakemake@wildcards[["seed"]]))

# Read the adjacency matrix
df_adjmat <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)
adjmat <- as.matrix(df_adjmat)
p <- dim(adjmat)[2]

precmat <- rgwish(n = 1,
                  adj = adjmat,
                  b = as.integer(snakemake@wildcards[["b"]]),
                  D = diag(p),
                  threshold = snakemake@wildcards[["thresh"]])
covmat <- solve(precmat)

colnames(covmat) <- colnames(df)

write.table(covmat,
            file = snakemake@output[["params"]],
            row.names = FALSE,
            quote = FALSE, col.names = TRUE, sep = ","
            )