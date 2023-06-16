# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
library(equSA)

myalg <- function() {

    output_filename <- snakemake@output[["adjmat"]]
    time_filename <- snakemake@output[["time"]]
    data_filename <- snakemake@input[["data"]]
    ntests_filename <- snakemake@output[["ntests"]]
    alpha1 = as.numeric(snakemake@wildcards[["alpha1"]])
    alpha2 = as.numeric(snakemake@wildcards[["alpha2"]])
    grid = as.integer(snakemake@wildcards[["grid"]])
    iterations = as.integer(snakemake@wildcards[["iterations"]])

    ## The algorithm should be in this function.
    start <- proc.time()[1]
    ## extract codes
    input_data <- read.csv(data_filename)
    n = nrow(input_data)
    p = ncol(input_data)
    neighborhood = n/log(n)
    if(!is.null(snakemake@wildcards[["neig"]]))
        neighborhood = as.integer(snakemake@wildcards[["neig"]])
    
    res = equSAR(iData = input_data,
                iMaxNei = neighborhood,
                ALPHA1 = alpha1,
                ALPHA2 = alpha2,
                GRID = grid,
                iteration = iterations)
    
        
    adjmat <- res$Adj
    
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(input_data) # Get the labels from the data
    write.csv(adjmat, file = output_filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = time_filename)
    # Write the true number of c.i. tests here if possible.
    cat("None", file = ntests_filename, sep = "\n") 
}

add_timeout(myalg)


