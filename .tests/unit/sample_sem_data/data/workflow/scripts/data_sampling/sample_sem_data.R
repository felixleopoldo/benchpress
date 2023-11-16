# This function generates Gaussian data from a DAG
# following the topological order.

rmvDAG <- function(trueDAGedges, N) {
  trueDAG <- 1 * (trueDAGedges != 0) # the edge presence in the DAG
  n <- ncol(trueDAG) # number of variables
  data <- matrix(0, nrow = N, ncol = n) # to store the simulated data
  top_order <- rev(BiDAG:::DAGtopartition(n, trueDAG)$permy) # go down order
  for (jj in top_order) {
    parents <- which(trueDAG[, jj] == 1) # find parents
    lp <- length(parents) # number of parents
    if (lp == 0) {
      # no parents
      data[, jj] <- 0
    } else if (lp == 1) {
      # one parent
      data[, jj] <- data[, parents] * trueDAGedges[parents, jj]
    } else {
      # more than one parent
      data[, jj] <- colSums(t(data[, parents]) * trueDAGedges[parents, jj])
    }
    # add random noise
    data[, jj] <- data[, jj] + rnorm(N)
  }
  data
}

weight_mat_filename <- snakemake@input[["bn"]]
N <- as.integer(snakemake@wildcards[["n"]])
seed <- as.integer(snakemake@wildcards[["seed"]])
filename <- snakemake@output[["data"]]

trueDAGedges <- as.matrix(read.csv(weight_mat_filename, check.names = FALSE))

set.seed(seed)
data <- rmvDAG(trueDAGedges, N)
colnames(data) <- colnames(trueDAGedges)

write.table(data, file = filename, row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ",")