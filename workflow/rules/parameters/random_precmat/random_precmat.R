library(Matrix)

seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

df <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)
adjmat <- as.matrix(df)
p <- nrow(adjmat)

K_values <- c()

# Store the non null precision values in a vector

if (!is.null(snakemake@wildcards[["prec_val_1"]])) {
    K_values <- c(K_values, as.numeric(snakemake@wildcards[["prec_val_1"]]))
}
if (!is.null(snakemake@wildcards[["prec_val_2"]])) {
    K_values <- c(K_values, as.numeric(snakemake@wildcards[["prec_val_2"]]))
}
if (!is.null(snakemake@wildcards[["prec_val_3"]])) {
    K_values <- c(K_values, as.numeric(snakemake@wildcards[["prec_val_3"]]))
}


precmat <- matrix(0, nrow = p, ncol = p)
# Sample untill we get a positive definite matrix

print("Simulating random precision matrix")
if (length(K_values) == 1) {
    precmat <- 1 * (adjmat != 0) * K_values
}

if (length(K_values) > 1) {
    is_positive_definite <- FALSE
    k = 0
    while (!is_positive_definite) {
        M <- sum(adjmat != 0)
        v <- sample.int(length(K_values), M, replace = TRUE)
        precmat <- 1 * (adjmat != 0)
        precmat[which(adjmat != 0)] <- K_values[v]
        eigen_values <- eigen(precmat)$values
        is_positive_definite <- all(Re(eigen_values) > 0)
        print(paste("Iteration", k, "is_positive_definite", is_positive_definite))
    }
    #M <- sum(adjmat != 0)
    #v <- sample.int(length(K_values), M, replace = TRUE)
    #precmat <- 1 * (adjmat != 0)
    #precmat[which(adjmat != 0)] <- K_values[v]
}
# while (TRUE) {
#     eigen_values <- eigen(precmat)$values
#     is_positive_definite <- all(Re(eigen_values) > 0)
#     if (is_positive_definite) break
#     print("Adding 0.1 to the diagonal")
#     precmat <- precmat + 0.1 * diag(p)
# }
print("Inverting the precision matrix")
covmat <- cov2cor(solve(precmat))
colnames(covmat) <- colnames(df)

filename <- snakemake@output[["params"]]
write.table(covmat,
    file = filename, row.names = FALSE,
    quote = FALSE, col.names = TRUE, sep = ","
)
