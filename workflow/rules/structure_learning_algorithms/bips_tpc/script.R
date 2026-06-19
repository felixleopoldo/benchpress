source("workflow/scripts/utils/helpers.R")
source("workflow/rules/structure_learning_algorithms/bips_tpc/R/ci_test_diagnostics.R")

library(RBGL)
library(tpc)
insertSource("workflow/rules/structure_learning_algorithms/bips_tpc/R/tskeleton.R", package = "tpc")
# minCell for tskeleton: NULL = standard PC; e.g. 5 = require min_cell >= 5 (see config minCell)
library(micd)
source("resources/code_for_binary_simulations/bnlearn_help_fns.R")

print_removed_edges <- function(pc_fit) {
    removed_edges <- attr(pc_fit, "removedEdges")
    if (is.null(removed_edges) && methods::is(pc_fit, "pcAlgo")) {
        removed_edges <- attr(pc_fit@sepset, "removedEdges")
    }
    if (is.null(removed_edges)) {
        message("No removed-edge log found. Ensure tskeleton was called with returnRemovedEdges = TRUE.")
        return(invisible(NULL))
    }
    if (nrow(removed_edges) == 0) {
        message("No edges were removed by high p-values (pval >= alpha).")
        return(invisible(removed_edges))
    }

    cols <- c(
        "node_1", "node_2", "n_used", "min_cell", "n_table_cells",
        "sep_between", "sep_between_final", "pval", "ord", "sepset", "alpha"
    )
    cols <- cols[cols %in% names(removed_edges)]
    pretty_tbl <- removed_edges[, cols, drop = FALSE]
    pretty_tbl <- pretty_tbl[order(pretty_tbl$node_1, pretty_tbl$node_2, -pretty_tbl$pval), ]
    rownames(pretty_tbl) <- NULL
    display_names <- c(
        node_1 = "node_1",
        node_2 = "node_2",
        n_used = "n_used",
        min_cell = "min_cell",
        n_table_cells = "n_table_cells",
        sep_between = "sep_between",
        sep_between_final = "sep_between_final",
        pval = "p_value",
        ord = "order",
        sepset = "separating_set",
        alpha = "alpha"
    )
    names(pretty_tbl) <- unname(display_names[cols])
    print(pretty_tbl)
    invisible(pretty_tbl)
}



wrapper <- function() {
    filename <- file.path(snakemake@output[["adjmat"]])
    filename_data <- snakemake@input[["data"]]
    filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]

    filename_mice_data <- snakemake@input[["input_algorithm"]]

    seed <- as.integer(snakemake@wildcards[["seed"]])
    alpha <- as.numeric(snakemake@wildcards[["alpha"]])
    mmax <- as.numeric(snakemake@wildcards[["mmax"]])
    conservative <- as.logical(snakemake@wildcards[["conservative"]])
    majrule <- as.logical(snakemake@wildcards[["majrule"]])
    solveconfl <- as.logical(snakemake@wildcards[["solveconfl"]])
    numCores <- as.integer(snakemake@wildcards[["numCores"]])
    verbose <- as.logical(snakemake@wildcards[["verbose"]])
    indepTest <- match.fun(snakemake@wildcards[["indepTest"]])
    cl_type <- snakemake@wildcards[["cl_type"]]
    minCell <- snakemake@wildcards[["minCell"]]
    if (is.null(minCell) || identical(minCell, "None")) {
        options(bips_tpc.minCell = NULL)
    } else {
        options(bips_tpc.minCell = as.integer(minCell))
    }

    data <- read.csv(filename_data, check.names = FALSE)

    tiers <- NULL
    context.all <- NULL
    context.tier <- NULL
    forbEdges <- NULL

    if (!is.null(filename_edge_constraints)) {
        edgeConstraints <- readRDS(filename_edge_constraints)
        p <- ncol(data)
        node_names <- colnames(data)

        if (length((edgeConstraints$tiers)) > 0) {
            tiers <- edgeConstraints$tiers
        }

        if (length((edgeConstraints$context.all)) > 0) {
            context.all <- edgeConstraints$context.all
        }

        if (length(edgeConstraints$context.tier) > 0) {
            context.tier <- edgeConstraints$context.tier
        }

        forbEdges <- edgeConstraints$forbEdges
    }

    suffStat <- NULL
    if (snakemake@wildcards[["indepTest"]] %in% c("binCItest", "disCItwd")) {
        # the discrete case
        nlev <- as.numeric(data[1, ])
        data <- data[-1, ] # Remove range header
        # creaate factor variables from the data
        data <- as.data.frame(lapply(data, as.factor))
        
        suffStat <- list(dm = data, nlev = nlev, adaptDF = FALSE)
    } else if (snakemake@wildcards[["indepTest"]] == "gaussCItest") {
        n <- dim(data)[1]
        suffStat <- list(C = cor(data), n = n)
    } else if (snakemake@wildcards[["indepTest"]] %in% c("gaussCItwd", "mixCItwd", "flexCItwd", "flexCItest")) {
     #   data <- data[-1, ]
        # creaate factor variables from the data
        # to see if a column is a factor. Check it it contains more than 10 unique values
        for (i in 1:ncol(data)) {
            if (length(unique(data[, i])) < 10) {
                data[, i] <- as.factor(data[, i])
            }
        }

        suffStat <- data
        if (snakemake@wildcards[["indepTest"]] == "flexCItest") {            
            suffStat <- getSuff(data, test = "flexCItest")
        }
    } else if (snakemake@wildcards[["indepTest"]] %in% c("gaussMItest", "mixMItest", "disMItest", "flexMItest")) {
        if (filename_mice_data != "None") {
            imputed_datasets <- readRDS(filename_mice_data)
            test <- snakemake@wildcards[["indepTest"]]
            suffStat <- getSuff(imputed_datasets, test = test)
        }
    }

    start <- proc.time()[1]
    set.seed(seed)

    pc.fit <- tpc(
        suffStat,
        indepTest,
        alpha,
        colnames(data),
        m.max = mmax,
        conservative = conservative,
        maj.rule = majrule,
        numCores = numCores,
        cl.type = cl_type,
        forbEdges = forbEdges,
        tiers = tiers,
        context.all = context.all,
        context.tier = context.tier,
        verbose = verbose
    )
    print_removed_edges(pc.fit)

    totaltime <- proc.time()[1] - start

    graph <- pc.fit@graph
    adjmat <- as(graph, "matrix")

    colnames(adjmat) <- names(data)

    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

    write(totaltime, file = snakemake@output[["time"]])
}

add_timeout(wrapper)
