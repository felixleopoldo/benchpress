src_path <- paste(proj_path, "/src", sep = "")

source(paste(src_path, "/SyntheticDataGeneration.R", sep = ""))

# Samples multivariate normal data given a covariance matrix.

# Read the covariance matrix from the params file.
df_params <- read.csv(snakemake@input[["params"]],
    header = TRUE,
    check.names = FALSE
)

weightmat <- as.matrix(df_params)
print(weightmat)
myDAG <- as(weightmat, "graphNEL")
print(myDAG)

num_sample <- as.integer(snakemake@wildcards[["n"]])
num_extra_e <- as.integer(snakemake@wildcards[["num_extra_e"]])
num_m <- as.integer(snakemake@wildcards[["num_m"]])
mode <- snakemake@wildcards[["mode"]]

seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

# data <- rmvnorm(n, mean = rep(0, nrow(covmat)), sigma = covmat)

# myDAG <- randomDAG(num_var,2/(num_var-1))

gen_result_list <- gen_data(
    num_sample = num_sample,
    mode = mode,
    myDAG = myDAG,
    num_extra_e = num_extra_e,
    num_m = num_m,
    seed = seed
)

#data <- gen_result_list$data # ?

#data_complete = gen_result_list$data_complete
data = gen_result_list$data_m


# Set the proper header and write the data to file.
colnames(data) <- colnames(df_params)
write.table(data,
    file = snakemake@output[["data"]],
    row.names = FALSE,
    quote = FALSE, col.names = TRUE, sep = ","
)
