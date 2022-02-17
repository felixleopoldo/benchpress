myparam1 <- snakemake@wildcards[["myparam1"]] # These variables are generated from the keys in the JSON config file.
myparam2 <- snakemake@wildcards[["myparam2"]]
data <- read.csv(snakemake@input[["data"]], check.names = FALSE)

# This is a very fast and very bad algorithm, estimating an undirected graph.
start <- proc.time()[1]
p <- ncol(data)
set.seed(as.integer(snakemake@wildcards[["replicate"]]))
Sys.sleep(3)
adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > 0.9 # A bad estimator
adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
diag(adjmat) <- 0 # No self loops
colnames(adjmat) <- names(data) # Get the labels from the data
totaltime <- proc.time()[1] - start

write.csv(adjmat, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)
write(totaltime, file = snakemake@output[["time"]])
write("None", file = snakemake@output[["ntests"]]) # Write the number of c.i. tests here if possible.