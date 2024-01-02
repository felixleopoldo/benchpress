library(R.utils)
library(huge)
source("workflow/scripts/utils/helpers.R")



# File paths and seed
output_filename <- file.path(snakemake@output[["adjmat"]])
data_filename <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["seed"]])

myalg <- function() {
    # Read in data
    data <- read.csv(data_filename, check.names = FALSE)
    start <- proc.time()[1]
    
    ## Set seed for reproducibility
    set.seed(seed)

    ## Here is where you should put your algorithm.
    lambda = NULL
    if (snakemake@wildcards[["lambda"]]!="None") 
        lambda <- as.numeric(snakemake@wildcards[["lambda"]])

    nlambda = NULL
    if (snakemake@wildcards[["nlambda"]]!="None") 
        lambda <- as.numeric(snakemake@wildcards[["nlambda"]])

    ## "ric" and "stars" and "ebic" are available
    select_criterion = 'ebic'
    if (snakemake@wildcards[["select_criterion"]]!="None")
        select_criterion <-snakemake@wildcards[["select_criterion"]]
    
    ## estimation
    huge_result <- huge(as.matrix(data),
                        method = "glasso",
                        lambda = lambda,
                        nlambda = nlambda,
                        verbose = FALSE)

    ## select the precision matrix
    out.select = huge.select(huge_result,
                             criterion = select_criterion,
                             verbose = FALSE)
    ## transform to an adjmat
    adjmat <- as.matrix(abs(as.matrix(out.select$opt.icov)) > 0)
   
    # Format and save the results
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data)
    write.csv(adjmat, file = output_filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])

    cat("None", file = snakemake@output[["ntests"]], sep = "\n") 
}

add_timeout(myalg)
