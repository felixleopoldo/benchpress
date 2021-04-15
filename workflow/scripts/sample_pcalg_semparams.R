library(pcalg)

# This function gives edges weights between the bounds
# with both positive and negative signs
wFUN <- function(m, lb, ub){ # function for edge weights
    runif(m, lb, ub)*sample(c(-1, 1), m, replace = TRUE)
}

seed <- as.integer(snakemake@wildcards[["seed"]])
min <- as.integer(snakemake@wildcards[["min"]])
max <- as.integer(snakemake@wildcards[["max"]])

filename <- snakemake@output[["bn"]] 
adjmat <- as.matrix(read.csv(snakemake@input[["adjmat"]]))

weight_mat <- adjmat
colnames(weight_mat) <- seq(dim(adjmat)[1]) #colnames(adjmat)

n_edges <- sum(adjmat)

weight_mat[which(weight_mat==1)] <- wFUN(n_edges, min, max)

write.csv(weight_mat, file = filename, row.names = FALSE, quote = FALSE)