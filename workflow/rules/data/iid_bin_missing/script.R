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

print("=== BN Structure ===")
print("Adjacency matrix:")
print(bn$adj)
print("Number of parents per node:")
print(bn$np)
print("Node names:")
print(colnames(bn$adj))

print("\n=== BN Parameters (fp) ===")
for (i in 1:length(bn$fp)) {
  node_name <- colnames(bn$adj)[i]
  n_parents <- bn$np[i]
  cat(sprintf("Node %d (%s): %d parent(s), %d parameter(s)\n", i, node_name, n_parents, length(bn$fp[[i]])))
  if (n_parents > 0) {
    # Calculate dependency strength (difference between min and max probabilities)
    prob_range <- range(bn$fp[[i]])
    dep_strength <- diff(prob_range)
    cat(sprintf("  Probability range: [%.3f, %.3f], Dependency strength: %.3f\n", 
                prob_range[1], prob_range[2], dep_strength))
    print(bn$fp[[i]])
  } else {
    cat(sprintf("  Baseline probability: %.3f\n", bn$fp[[i]][1]))
  }
}

print("\n=== Generated Data (before missingness) ===")
print(paste("Sample size:", nrow(bindata)))
print("First few rows:")
print(head(bindata, 10))
print("Column means (proportion of 1s):")
print(colMeans(bindata))

new_bindata <- bindata
for (colname in colnames(bindata)) {
    if (grepl("R_", colname)) {
        R_X <- colname
        X <- sub("R_", "", colname)
        new_bindata[, X] <- ifelse(bindata[[R_X]] == 0, NA, bindata[, X])
    }
}


# Remove the R_varname_na columns
new_bindata <- new_bindata[, !grepl("R_", colnames(new_bindata))]

print("\n=== Data After Missingness ===")
print("Missing data percentage per variable:")
missing_pct <- colMeans(is.na(new_bindata)) * 100
print(missing_pct)
print(paste("Complete cases:", sum(complete.cases(new_bindata)), "out of", nrow(new_bindata), 
            sprintf("(%.1f%%)", mean(complete.cases(new_bindata)) * 100)))

myrow <- rep(2, ncol(new_bindata))
new_bindata_range_header <- data.frame(rbind(myrow, as.matrix(new_bindata)))
rownames(new_bindata_range_header) <- NULL

print("\n=== Final Data with Range Header ===")
print(head(new_bindata_range_header, 10))

write.csv(new_bindata_range_header  , file = filename, row.names = FALSE, quote = FALSE, na = "")
