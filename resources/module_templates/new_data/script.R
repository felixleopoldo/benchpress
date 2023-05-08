library(mvtnorm)
# Samples multivariate normal data given a covariance matrix.

# Read the covariance matrix from the params file.
df_params <- read.csv(snakemake@input[["params"]], 
                      header = TRUE, 
                      check.names = FALSE)
covmat <- as.matrix(df_params)
n <- as.integer(snakemake@wildcards[["n"]])

set.seed(as.integer(snakemake@wildcards[["seed"]]))
data <- rmvnorm(n, mean = rep(0, nrow(covmat)), sigma = covmat)

# Set the proper header and write the data to file. 
colnames(data) <- colnames(df_params)
write.table(data,
            file = snakemake@output[["data"]],
            row.names = FALSE,
            quote = FALSE, col.names = TRUE, sep = ","
            )
