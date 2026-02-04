# Samples data from a binary or discrete Bayesian network and also writes the range header.

library(argparser)

source("resources/binarydatagen/generatenstatesBNf.r")
source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("Sampling data from a discrete Bayesian network.")
p <- add_argument(
    p, "--filename",
    help = "output filename", default = "data.csv"
)
p <- add_argument(p,
    "--filename_bn",
    help = "Bayesian network filename", default = "bn.rds"
)
p <- add_argument(p,
    "--samples",
    help = "Sample size", type = "numeric"
)
p <- add_argument(p,
    "--seed",
    help = "Random seed",
    type = "numeric", default = 1
)
argv <- parse_args(p)

filename <- file.path(argv$filename)
filename_bn <- argv$filename_bn
seed <- argv$seed

bn <- readRDS(filename_bn)
samples <- argv$samples

n <- numNodes(bn$DAG)
set.seed(seed)

# Detect if this is a binary BN or discrete BN
# Binary BNs don't have 'nstates' field, discrete BNs do
is_binary_bn <- is.null(bn$nstates) || !("nstates" %in% names(bn))

if (is_binary_bn) {
    # Use binary BN data generation
    disc_data <- generatebinaryBN.data(n = n, binaryBN = bn, samplesize = samples)
} else {
    # Use discrete BN data generation
    disc_data <- generateNStatesBN.data(n = n, nstatesBN = bn, samplesize = samples)
}


colnames(disc_data) <- colnames(bn$adj)
disc_data <- as.data.frame(disc_data)

# This data has columns with R_varname indicating missing values.
# Create a copy of the data frame where the values are set to NA if the R_varname is 0.
# Convention: R_X = 0 means X is missing, R_X = 1 means X is observed.
new_disc_data <- disc_data
# Fix: Ensure bindata is a data.frame with column names before access by colname

# For each R_column, at each row replace the value with NA if the R_column is 0.
# The column names should not change

for (colname in colnames(disc_data)) {
    if (grepl("R_", colname)) {
        R_X <- colname
        X <- sub("R_", "", colname)
        new_disc_data[, X] <- ifelse(disc_data[[R_X]] == 0, NA, new_disc_data[, X])
    }
}

# Remove the R_varname_na columns
new_disc_data <- new_disc_data[, !grepl("R_", colnames(new_disc_data))]

# get the range header from the node_states of the bn
if (is_binary_bn) {
    # Binary BN: all nodes have 2 states
    node_states <- rep(2, ncol(new_disc_data))
} else {
    # Discrete BN: use nstates from the BN
    node_states <- rep(bn$nstates, ncol(new_disc_data))
}
node_states_range_header <- data.frame(rbind(node_states))
colnames(node_states_range_header) <- colnames(new_disc_data)

rownames(node_states_range_header) <- NULL

print("node_states_range_header:")
print(head(node_states_range_header,10))

new_disc_data_range_header <- data.frame(rbind(node_states_range_header, as.matrix(new_disc_data)))
rownames(new_disc_data_range_header) <- NULL

print("new_disc_data_range_header:")
print(head(new_disc_data_range_header,10))

write.csv(new_disc_data_range_header  , file = filename, row.names = FALSE, quote = FALSE, na = "")
