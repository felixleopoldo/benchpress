# As the parameterisation differ between models, ther is 
# no sample script here. however, 

# Read the seed number
seed <- as.integer(snakemake@wildcards[["seed"]])

# Read the adjacency matrix
df_adjmat <- read.csv(snakemake@input[["adjmat"]], 
                      header = TRUE, 
                      check.names = FALSE)
adjmat <- as.matrix(df_adjmat)

# Set the seed
set.seed(seed)

# Write the parameters to file. 
cat("Replace this", file = snakemake@output[["params"]], sep = "\n")

