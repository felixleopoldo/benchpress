# Samples daata from a binary Bayesian network and also writes the range header.

library(argparser)

source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("Sampling data from a binary Bayesian network.")
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
bindata <- generatebinaryBN.data(n = n, binaryBN = bn, samplesize = samples)


colnames(bindata) <- colnames(bn$adj)
bindata <- as.data.frame(bindata)

# This data has columns with R_varname indicating missing values.
# Create a copy of the data frame where the values are set to NA if the R_varname is 1.
new_bindata <- bindata
# Fix: Ensure bindata is a data.frame with column names before access by colname

# no we just, for each R_column, at each row replace the value with NA if the R_column is 1.
# the column names should not chnge

#print("bindata:")
#print(head(bindata,10))
#quit()

for (colname in colnames(bindata)) {
    if (grepl("R_", colname)) {
        R_X <- colname
        X <- sub("R_", "", colname)
        new_bindata[, X] <- ifelse(bindata[[R_X]] == 0, NA, new_bindata[, X])
    }
}

# Remove the R_varname_na columns
new_bindata <- new_bindata[, !grepl("R_", colnames(new_bindata))]

myrow <- rep(2, ncol(new_bindata))
new_bindata_range_header <- data.frame(rbind(myrow, as.matrix(new_bindata)))
rownames(new_bindata_range_header) <- NULL

print("new_bindata_range_header:")
print(head(new_bindata_range_header,10))

write.csv(new_bindata_range_header  , file = filename, row.names = FALSE, quote = FALSE, na = "")
