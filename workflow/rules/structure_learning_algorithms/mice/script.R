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
    print("Mice imputation done")

    mi_data <- complete(
        mi_object,
        action = action,
        include = include,
        mild = mild,
        order = order # c("last", "first")
    )

    print("Mice imputation done. from complete:")
    #print(mi_data)

    # mi_data_joined <- NULL

    # # for datafram in the mi_data list, join them in one dataframe wiht a column for the imputed values
    # for (i in 1:length(mi_data)) {
    #     if (is.null(mi_data_joined)) {
    #         mi_data_joined <- mi_data[[i]]
    #         mi_data_joined$imputed <- i
    #     } else {
    #         mi_data[[i]]$imputed <- i
    #         mi_data_joined <- rbind(mi_data_joined, mi_data[[i]])
    #     }
    # }
    # print("mi data joined")
    # #print(mi_data_joined)
    # print(names(mi_data))
    
    # # colnames(mi_data) <- names(data) # Get the labels from the data
    # write.csv(mi_data_joined, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)

    totaltime <- proc.time()[1] - start
    saveRDS(mi_data, file = snakemake@output[["adjmat"]])


    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n")
}

add_timeout(myalg)
