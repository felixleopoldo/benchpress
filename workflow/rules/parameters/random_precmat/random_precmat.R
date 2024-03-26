#install.packages("matrixcalc")
#library(matrixcalc)
library(Matrix)
seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

df <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)
adjmat <- as.matrix(df)
p <- nrow(adjmat)

K_values <- c()

# Store the non null precision values in a vector
print(snakemake@wildcards[["prec_val_3"]])
print(is.null(snakemake@wildcards[["prec_val_1"]]))

if (snakemake@wildcards[["prec_val_1"]] != "None") {
    print("prec_val_1")
    K_values <- c(K_values, as.numeric(snakemake@wildcards[["prec_val_1"]]))
}
if (snakemake@wildcards[["prec_val_2"]] != "None") {
    K_values <- c(K_values, as.numeric(snakemake@wildcards[["prec_val_2"]]))
}
if (snakemake@wildcards[["prec_val_3"]] != "None") {
    K_values <- c(K_values, as.numeric(snakemake@wildcards[["prec_val_3"]]))
}
print(K_values)

precmat <- matrix(0, nrow = p, ncol = p)
# Sample untill we get a positive definite matrix
while (TRUE) {
    print("Simulating random precision matrix")
    if (length(K_values) == 1) {
        precmat <- 1 * (adjmat != 0) * K_values
    }

    if (length(K_values) > 1) {
        M <- sum(adjmat != 0)
        v <- sample.int(length(K_values), M, replace = TRUE)
        precmat <- 1 * (adjmat != 0)
        precmat[which(adjmat != 0)] <- K_values[v]
    }

    eigen_values <- eigen(precmat)$values
    is_positive_definite <- all(eigen_values > 0)
    if (is_positive_definite) break
}
print("Inverting the precision matrix")
covmat <- cov2cor(solve(precmat))
colnames(covmat) <- colnames(df)

filename <- snakemake@output[["params"]]
write.table(covmat,
    file = filename, row.names = FALSE,
    quote = FALSE, col.names = TRUE, sep = ","
)
