myparam1 <- snakemake@wildcards[["myparam1"]] # These variables are generated from the keys in the JSON config file.
myparam2 <- snakemake@wildcards[["myparam2"]]

data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
start <- proc.time()[1]

# This is a very fast and very bad algorithm, estimating an undirected graph.
p <- ncol(data)
Sys.sleep(3)
set.seed(as.integer(snakemake@wildcards[["replicate"]]))
adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > 0.5 # A bad estimator
adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
diag(adjmat) <- 0 # No self loops

totaltime <- proc.time()[1] - start
colnames(adjmat) <- names(data) # Get the labels from the data
write.csv(adjmat, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)
write(totaltime, file = snakemake@output[["time"]])
write("None", file = snakemake@output[["ntests"]]) # Write the number of c.i. tests here if possible.