proj_path <- "/MVPC"
library(igraph)
library(graph)
src_path <- paste(proj_path, "/src", sep = "")

source(paste(src_path, "/SyntheticDataGeneration.R", sep = ""))
source(paste(src_path, "/CITest.R", sep = ""))
source(paste(src_path, "/Evaluation.R", sep = ""))
source(paste(src_path, "/MissingValuePC.R", sep = ""))

# Samples multivariate normal data given a covariance matrix.

# Read the covariance matrix from the params file.
df_params <- read.csv(snakemake@input[["params"]],
    header = TRUE,
    check.names = FALSE
)

weightmat <- as.matrix(df_params)

myDAG <- graph_from_adjacency_matrix(t(weightmat), weighted = TRUE)
myDAG <- as_graphnel(myDAG)

num_sample <- as.integer(snakemake@wildcards[["n"]])
num_extra_e <- as.integer(snakemake@wildcards[["num_extra_e"]])
num_m <- as.integer(snakemake@wildcards[["num_m"]])
mode <- snakemake@wildcards[["mode"]]
p_missing_h <- as.numeric(snakemake@wildcards[["p_missing_h"]])
p_missing_l <- as.numeric(snakemake@wildcards[["p_missing_l"]])

seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

gen_result_list <- gen_data(
    num_sample = num_sample,
    mode = mode,
    myDAG = myDAG,
    num_extra_e = num_extra_e,
    num_m = num_m,
    p_missing_h = p_missing_h,
    p_missing_l = p_missing_l,
    seed = seed
)

data <- gen_result_list$data_m

# TODO: binary data support.
#gen.bin.data(data, DAG, mode = 'mar', num_var=20,num_extra_e=5,num_m = 10)


# Set the proper header and write the data to file.
colnames(data) <- colnames(df_params)
write.table(data,
    file = snakemake@output[["data"]],
    row.names = FALSE,
    quote = FALSE, col.names = TRUE, sep = ",",
    na = ""
)
