# Samples a matrix of weights for a structueal equation model (SEM).

wFUN <- function(m, lb, ub) {
  # This function gives edges weights between the bounds
  # with both positive and negative signs
  runif(m, lb, ub) * sample(c(-1, 1), m, replace = TRUE)
}

seed <- as.integer(snakemake@wildcards[["seed"]])
lb <- as.numeric(snakemake@wildcards[["min"]])
ub <- as.numeric(snakemake@wildcards[["max"]])

filename <- snakemake@output[["bn"]]
df <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)

adjmat <- as.matrix(df)

weight_mat <- adjmat
colnames(weight_mat) <- colnames(df)

n_edges <- sum(adjmat)

set.seed(seed)
weight_mat[which(weight_mat == 1)] <- wFUN(n_edges, lb = lb, ub = ub)

write.table(weight_mat, file = filename, row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ",")
