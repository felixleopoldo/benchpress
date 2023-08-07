# If you have a Docker image with files to source you can source them here.
# Be careful to use the absolute path in the Docker image.
# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
# source("/path/in/dockerimage/filetosource.R")

myalg <- function() {
    # The algorithm should be in this function.

    cutoff <- as.numeric(snakemake@wildcards[["cutoff"]])
    data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
    start <- proc.time()[1]

    # This is a fast and naiive algorithm.
    p <- ncol(data)
    Sys.sleep(3)
    set.seed(as.integer(snakemake@wildcards[["replicate"]]))
    adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > cutoff
    adjmat <- 1 * (adjmat | t(adjmat))
    diag(adjmat) <- 0
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data) # Get the labels from the data
    write.csv(adjmat, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n") 
}

add_timeout(myalg)