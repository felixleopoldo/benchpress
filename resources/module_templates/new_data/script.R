library(mvtnorm)

# As the parameterisation differ between models, ther is 
# no sample script here. however, 

# Read the seed number
seed <- as.integer(snakemake@wildcards[["seed"]])

# Read the adjacency matrix
df_params <- read.csv(snakemake@input[["params"]], 
                      header = TRUE, 
                      check.names = FALSE)
covmat <- as.matrix(df_params)

n <- as.integer(snakemake@wildcards[["n"]])

# Set the seed
set.seed(seed)

rmvnorm(n, mean = rep(0, nrow(covmat)), sigma = covmat)

# Write the data to file. 
colnames(covmat) <- colnames(df_params)

write.table(covmat,
            file = snakemake@output[["data"]],
            row.names = FALSE,
            quote = FALSE, col.names = TRUE, sep = ","
            )
