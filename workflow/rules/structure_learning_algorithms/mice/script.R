# If you have a Docker image with files to source you can source them here.
# Be careful to use the absolute path in the Docker image.
# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
# source("/path/in/dockerimage/filetosource.R")

library(mice)

myalg <- function() {
    # The algorithm should be in this function.

    cutoff <- as.numeric(snakemake@wildcards[["cutoff"]])
    data <- read.csv(snakemake@input[["data"]], check.names = FALSE)

    m <- as.integer(snakemake@wildcards[["m"]])
    ignore <- snakemake@wildcards[["ignore"]]
    method <- snakemake@wildcards[["method"]]
    maxit <- as.integer(snakemake@wildcards[["maxit"]])
    seed <- as.integer(snakemake@wildcards[["seed"]])
    defaultMethod <- snakemake@wildcards[["defaultMethod"]]

    # for complete
    action <- snakemake@wildcards[["action"]]
    include <- as.logical(snakemake@wildcards[["include"]])
    mild <- as.logical(snakemake@wildcards[["mild"]])
    order <- snakemake@wildcards[["order"]]

    start <- proc.time()[1]

    # This is a fast and naiive algorithm.    
    set.seed(seed)

    # Check if data is a range header. That happens if the sum of
    # the first and second row (or all rows) is a whole number.
    is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol

    if (is.wholenumber(sum(na.omit(t(data[1:2,]))))) {
        data <- data[-1, ]
        #print("range header removed. discrete")
    }

    mi_object <- mice(data,
        m = m,
        method = method,
        # predictorMatrix,
        ignore = NULL,
        where = NULL,
        # blocks,
        visitSequence = NULL,
        # formulas,
        blots = NULL,
        post = NULL,
        defaultMethod = defaultMethod, # c("pmm", "logreg", "polyreg", "polr"),
        maxit = maxit,
        printFlag = TRUE,
        seed = seed,
        data.init = NULL,
    )

    mi_data <- complete(
        mi_object,
        action = action,
        include = include,
        mild = mild,
        order = order # c("last", "first")
    )

    totaltime <- proc.time()[1] - start
    saveRDS(mi_data, file = snakemake@output[["adjmat"]])

    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n")
}

add_timeout(myalg)
