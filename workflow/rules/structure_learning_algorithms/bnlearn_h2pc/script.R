library(pcalg)
library(RBGL)
library(bnlearn)

source("resources/code_for_binary_simulations/make_var_names.R")

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["seed"]])


wrapper <- function() {
    data <- read.csv(filename_data, check.names = FALSE)

    header <- names(data)
    # Implicitly checking it discrete data.
    if (snakemake@wildcards[["test"]] %in% c(
        "mi", "mi-adf", "mc-mi", "smc-mi",
        "sp-mi", "mi-sh", "x2", "x2-adf", "sp-x2",
        "jt", "mc-jt", "smc-jt"
    )) {
        data <- data[-1, ] # Remove range header
        data <- matrixToDataframe(data, header)
        args <- list(
            iss = ifelse(snakemake@wildcards[["iss"]] == "None",
                1,
                as.numeric(snakemake@wildcards[["iss"]])
            ),
            l = ifelse(snakemake@wildcards[["l"]] == "None",
                5,
                as.numeric(snakemake@wildcards[["l"]])
            ),
            k = ifelse(snakemake@wildcards[["k"]] == "None",
                1,
                as.numeric(snakemake@wildcards[["k"]])
            ),
            prior = snakemake@wildcards[["prior"]],
            beta = as.numeric(snakemake@wildcards[["beta"]]),
            score = snakemake@wildcards[["score"]]
        )
    } else {
        iss.w <- ifelse(snakemake@wildcards[["issw"]] == "None",
            dim(data)[2] + 2,
            as.numeric(snakemake@wildcards[["issw"]])
        )
        args <- list(
            iss.w = iss.w,
            iss.mu = ifelse(snakemake@wildcards[["issmu"]] == "None",
                1,
                as.numeric(snakemake@wildcards[["issmu"]])
            ),
            l = ifelse(snakemake@wildcards[["l"]] == "None",
                5,
                as.numeric(snakemake@wildcards[["l"]])
            ),
            k = ifelse(snakemake@wildcards[["k"]] == "None",
                1,
                as.numeric(snakemake@wildcards[["k"]])
            ),
            prior = snakemake@wildcards[["prior"]],
            beta = as.numeric(snakemake@wildcards[["beta"]]),
            score = snakemake@wildcards[["score"]]
        )
    }
    set.seed(seed)

    start <- proc.time()[1]
    mmoutput <- h2pc(data,
        restrict.args = list(
            alpha = ifelse(snakemake@wildcards[["alpha"]] == "None",
                NULL,
                as.numeric(snakemake@wildcards[["alpha"]])
            ),
            test = snakemake@wildcards[["test"]]
        ),
        maximize.args = args
    )
    totaltime <- proc.time()[1] - start

    ## convert to graphneldag
    gnel_dag <- as.graphNEL(mmoutput)
    ntests <- mmoutput$learning$ntests
    adjmat <- as(gnel_dag, "matrix")
    colnames(adjmat) <- header

    print(adjmat)
    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    write(ntests, file = snakemake@output[["ntests"]])
}

if (snakemake@wildcards[["timeout"]] == "None") {
    wrapper()
} else {
    res <- NULL
    tryCatch(
        {
            res <- withTimeout(
                {
                    wrapper()
                },
                timeout = snakemake@wildcards[["timeout"]]
            )
        },
        TimeoutException = function(ex) {
            message(paste("Timeout after ",
                snakemake@wildcards[["timeout"]],
                " seconds. Writing empty grape and time files.",
                sep = ""
            ))
            file.create(filename)
            cat("None", file = snakemake@output[["time"]], sep = "\n")
            cat("None", file = snakemake@output[["ntests"]], sep = "\n")
        }
    )
}
