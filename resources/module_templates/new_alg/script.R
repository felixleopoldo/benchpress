# If you have a Docker image with files to source you can source them here.
# Be careful to use the absolute path in the Docker image.
# R.utils is needed for the timeout. Make sure this is installed.
source("workflow/scripts/utils/add_timeout.R")
library("R.utils") 
# source("/path/in/dockerimage/filetosource.R")

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["replicate"]])

myalg <- function() {
    # Here is where you should put your algorithm.
    myparam1 <- snakemake@wildcards[["myparam1"]]
    myparam2 <- snakemake@wildcards[["myparam2"]]

    data <- read.csv(filename_data, check.names = FALSE)
    start <- proc.time()[1]

    # This is a very fast and bad algorithm.
    p <- ncol(data)
    Sys.sleep(3)
    set.seed(seed)
    adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > 0.5
    adjmat <- 1 * (adjmat | t(adjmat))
    diag(adjmat) <- 0
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data) # Get the labels from the data
    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n") 
}


add_timeout(myalg)