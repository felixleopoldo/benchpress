# If you have a Docker image with files to source you can source them here.
# Be careful to use the absolute path in the Docker image.
# R.utils is needed for the timeout. Make sure this is installed.
source("workflow/scripts/utils/helpers.R")
# source("/path/in/dockerimage/filetosource.R")

filename <- file.path(snakemake@output[["seqgraph"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["mcmc_seed"]])

myalg <- function() {
    data <- read.csv(filename_data, check.names = FALSE)
    p <- ncol(data)
    start <- proc.time()[1]

    # Generate a trajectory of adjacency matrices and scores.
    set.seed(seed)
    adjmats <- list()
    scores <- list()

    cutoff <- as.numeric(snakemake@wildcards[["cutoff"]])
    n_iterations <- as.integer(snakemake@wildcards[["n_iterations"]])
    # sample n_iterations adjacency matrices and scores.
    for (i in 1:n_iterations) {
        adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > cutoff
        adjmat <- 1 * (adjmat | t(adjmat))
        colnames(adjmat) <- names(data)
        diag(adjmat) <- 0
        adjmats[[i]] <- adjmat
        scores[[i]] <- rnorm(1, -1000, 10)
    }
    totaltime <- proc.time()[1] - start

    # Convert the adjacency matrices and scores to the Benchpress format.
    df <- bidagtraj_to_bptraj(adjmats, scores, colnames(data), directed = FALSE)

    write.csv(x = df, file = file.path(snakemake@output[["seqgraph"]]),
              row.names = FALSE, quote = FALSE)

    write(totaltime, file = snakemake@output[["time"]])
}

add_timeout_mcmc(myalg)