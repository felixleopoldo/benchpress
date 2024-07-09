source("workflow/scripts/utils/helpers.R")
library("R.utils")
library(RBGL)
library(pcalg)


filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]
seed <- as.integer(snakemake@wildcards[["seed"]])

myalg <- function() {
    # Here is where you should put your algorithm.


    idata <- read.csv(filename_data, check.names = FALSE)

    edgeConstraints <- read.csv(filename_edge_constraints)
    p <- ncol(data)
    node_names <- colnames(data)

    fixedGaps <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))

    for (i in 1:nrow(edgeConstraints)) {
        node1 <- edgeConstraints$node1[i]
        node2 <- edgeConstraints$node2[i]
        if (edgeConstraints$matrix_type[i] == "fixedGaps") {
            fixedGaps[node1, node2] <- TRUE
            fixedGaps[node2, node1] <- TRUE
        }
    }

    p <- length(unique(colnames(idata)))
    n <- nrow(idata)

    n_intvars <- length(colnames(idata)) - length(unique(colnames(idata)))

    # The right part of the dataset defines the interventional targets.

    start <- proc.time()[1]

    data <- idata[, 1:p]
    imat <- idata[, (p + 1):ncol(idata)]

    ivar2ind <- function(targets, ivar) {
        i <- 1
        for (t in targets) {
            if (all.equal(t, ivar) == TRUE) {
                return(i)
            }
            i <- i + 1
        }
    }

    targets <- list(as.integer(0)) # means observational (has index 1 here)
    target.index <- c()

    for (r in seq(n)) {
        ivars <- c()
        for (c in 1:n_intvars) {
            if (imat[r, c] == 1) {
                cind <- which(colnames(imat)[c] == colnames(data))
                ivars <- c(ivars, cind) # index of the ivar
            }
        }

        # ivars is a potential target.
        ivars <- as.integer(ivars)

        if (length(ivars) == 0) {
            ivars <- as.integer(0)
        }

        if (ivars %in% targets) {
            target_ind <- ivar2ind(targets, ivars)
        } else {
            targets <- append(targets, ivars)
            target_ind <- length(targets)
        }

        target.index[r] <- target_ind
    }

    # Fix this in the end
    if (targets[[1]] == 0) {
        targets[[1]] <- integer(0)
    }

    ## Define the score (BIC)
    score <- new("GaussL0penIntScore", data, targets, target.index, nodes = colnames(data))

    ## Estimate the (interventional) essential graph
    maxDegree <- integer(0)
    if (snakemake@wildcards[["maxDegree"]] != "None") {
        maxDegree <- as.integer(snakemake@wildcards[["maxDegree"]])
    }

    gies.fit <- gies(score,
        maxDegree = maxDegree,
        fixedGaps = fixedGaps,
        iterate = as.logical(snakemake@wildcards[["iterate"]]),
        verbose = as.logical(snakemake@wildcards[["verbose"]])
    )

    adjmat <- as(gies.fit$essgraph, "matrix") * 1

    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data) # Get the labels from the data

    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
}


add_timeout(myalg)
