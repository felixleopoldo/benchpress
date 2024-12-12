source("workflow/scripts/utils/helpers.R")

library(RBGL)
# library(pcalg)
library(tpc)
library(micd)
source("resources/code_for_binary_simulations/bnlearn_help_fns.R")

wrapper <- function() {
    filename <- file.path(snakemake@output[["adjmat"]])
    filename_data <- snakemake@input[["data"]]
    filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]
    seed <- as.integer(snakemake@wildcards[["seed"]])
    alpha <- as.numeric(snakemake@wildcards[["alpha"]])
    mmax <- as.numeric(snakemake@wildcards[["mmax"]])
    conservative <- as.logical(snakemake@wildcards[["conservative"]])
    majrule <- as.logical(snakemake@wildcards[["majrule"]])
    solveconfl <- as.logical(snakemake@wildcards[["solveconfl"]])
    numCores <- as.integer(snakemake@wildcards[["numCores"]])
    verbose <- as.logical(snakemake@wildcards[["verbose"]])
    indepTest <- match.fun(snakemake@wildcards[["indepTest"]])

    data <- read.csv(filename_data, check.names = FALSE)

    if (!is.null(filename_edge_constraints)) {
        edgeConstraints <- read.csv(filename_edge_constraints)
        p <- ncol(data)
        node_names <- colnames(data)
        fixedGaps <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))
        fixedEdges <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))

        for (i in 1:nrow(edgeConstraints)) {
            node1 <- edgeConstraints$node1[i]
            node2 <- edgeConstraints$node2[i]
            if (edgeConstraints$matrix_type[i] == "fixedGaps") {
                fixedGaps[node1, node2] <- TRUE
                fixedGaps[node2, node1] <- TRUE
            } else if (edgeConstraints$matrix_type[i] == "fixedEdges") {
                fixedEdges[node1, node2] <- TRUE
                fixedEdges[node2, node1] <- TRUE
            }
        }
    } else {
        fixedGaps <- NULL
        fixedEdges <- NULL
    }

    suffStat <- NULL
    if (!snakemake@wildcards[["indepTest"]] %in% c("gaussCItest", "gaussCItwd")) {
        # the discrete case
        nlev <- as.numeric(data[1, ])
        data <- data[-1, ] # Remove range header
        suffStat <- list(dm = data, nlev = nlev, adaptDF = FALSE)
    } else {
        n <- dim(data)[1]
        suffStat <- list(C = cor(data), n = n)
        print("cont data")
        
    }

    if (snakemake@wildcards[["indepTest"]] %in% c("gaussCItwd")) {
        suffStat = data
    }

    print(suffStat)
    
    start <- proc.time()[1]
    set.seed(seed)
    print("Starting TPC")
    print("conservative")
    print(conservative)
    print("majrule")
    print(majrule)

    pc.fit <- tpc(
        suffStat,
        indepTest,
        alpha,
        colnames(data),
        m.max = mmax,
        conservative = conservative,
        maj.rule = majrule,
        numCores = numCores,
        cl.type = "PSOCK",
        forbEdges = NULL,
        tiers = NULL,
        context.all = NULL,
        context.tier = NULL,
        verbose = verbose
    )

    print("Finished TPC")
    totaltime <- proc.time()[1] - start

    graph <- pc.fit@graph
    adjmat <- as(graph, "matrix")

    colnames(adjmat) <- names(data)
    print(adjmat)
    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

    write(totaltime, file = snakemake@output[["time"]])
}

add_timeout(wrapper)
