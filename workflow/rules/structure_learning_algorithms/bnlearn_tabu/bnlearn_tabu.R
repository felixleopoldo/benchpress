source("workflow/scripts/utils/add_timeout.R")
library(bnlearn)
source("resources/code_for_binary_simulations/make_var_names.R")
filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]

wrapper <- function() {
    seed <- as.integer(snakemake@wildcards[["replicate"]])
    data <- read.csv(filename_data, check.names = FALSE)
    names <- names(data)
    if (snakemake@wildcards[["score"]] %in% c("bde", "bic")) {
        data <- data[-1, ] # Remove range header
        data <- matrixToDataframe(data, names)
    }
    set.seed(seed)

    iss.w <- ifelse(snakemake@wildcards[["issw"]] == "None",
        dim(data)[2] + 2,
        as.numeric(snakemake@wildcards[["issw"]])
    )
    start <- proc.time()[1]
    output <- tabu(data,
        score = snakemake@wildcards[["score"]],
        iss = as.numeric(snakemake@wildcards[["iss"]]),
        iss.mu = as.numeric(snakemake@wildcards[["issmu"]]),
        iss.w = iss.w,
        l = as.numeric(snakemake@wildcards[["l"]]),
        k = as.numeric(snakemake@wildcards[["k"]]),
        prior = snakemake@wildcards[["prior"]],
        beta = as.numeric(snakemake@wildcards[["beta"]])
    )
    totaltime <- proc.time()[1] - start

    ## convert to graphneldag
    gnel_dag <- as.graphNEL(output)
    adjmat <- as(gnel_dag, "matrix")
    colnames(adjmat) <- names
    ntests <- output$learning$ntests
    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    write(ntests, file = snakemake@output[["ntests"]])
}

add_timeout(wrapper)

