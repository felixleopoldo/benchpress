# If you have a Docker image with files to source you can source them here.
# Be careful to use the absolute path in the Docker image.

#source("/path/in/dockerimage/filetosource.R")

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["replicate"]])


wrapper <- function() {
    # Here is where you should put your algorithm.
    mystringparam <- snakemake@wildcards[["mystringparam"]]

    # If myintparam can be null in the JSON file, it can be handeled like this.
    myintparam <- NULL
    if(snakemake@wildcards[["myintparam"]] != "None") {
        myintparam <- as.integer(snakemake@wildcards[["myintparam"]])
    }

    data <- read.csv(filename_data, check.names = FALSE)
    start <- proc.time()[1]

    # This is a very fast and bad algorithm.
    p <- ncol(data)
    set.seed(seed)
    adjmat <- matrix(runif(p*p), nrow=p, ncol=p) > 0.5
    adjmat <- 1 * (adjmat | t(adjmat))
    diag(adjmat) <- 0
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data) # Get the labels from the data
    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
}

if (snakemake@wildcards[["timeout"]] == "None") {
    wrapper()
} else {
    res <- NULL
    tryCatch({
        res <- withTimeout({wrapper()}, 
                           timeout = snakemake@wildcards[["timeout"]])
    }, TimeoutException = function(ex) {
        message(paste("Timeout after ", snakemake@wildcards[["timeout"]], " seconds. Writing empty graph and time files.", sep = ""))
        file.create(filename)
        cat("None", file = snakemake@output[["time"]], sep = "\n")
    })
}