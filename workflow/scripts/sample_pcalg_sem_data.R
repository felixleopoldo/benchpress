library(pcalg)
library(BiDAG)

weight_mat_filename <- snakemake@input[["bn"]]
N <- as.integer(snakemake@wildcards[["n"]])
seed <- as.integer(snakemake@wildcards[["replicate"]])
filename <- snakemake@output[["data"]]

trueDAGedges <- read.csv(weight_mat_filename)
trueDAG <- 1 *  (trueDAGedges != 0)

n <- dim(trueDAG)[1]

set.seed(seed)
data <- matrix(0, nrow = N, ncol = n) # to store the simulated data
top_order <- rev(BiDAG:::DAGtopartition(n, trueDAG)$permy) # go down order

for (node in top_order) {
    parents <- which(trueDAG[, node] == 1) # find parents
    n_parents <- length(parents) # number of parents
    if (n_parents == 0) { # no parents
        data[, node] <- rnorm(N)
    } else if (n_parents == 1) { # one parent
        data[, node] <- data[, parents]*trueDAGedges[parents, node] + rnorm(N)
    } else { # more than one parent
        data[, node] <- colSums(t(data[, parents])*trueDAGedges[parents, node]) + rnorm(N)
    }
}

colnames(data) <- colnames(trueDAGedges)

write.table(data, file = filename, row.names = FALSE, quote = FALSE, col.names=TRUE, sep=",")