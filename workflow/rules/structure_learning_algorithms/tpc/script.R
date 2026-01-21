source("workflow/scripts/utils/helpers.R")

library(RBGL)
library(micd)
source("workflow/rules/structure_learning_algorithms/tpc/micd/flexCItwd.R")

source("workflow/rules/structure_learning_algorithms/tpc/R/tpc.R")
source("workflow/rules/structure_learning_algorithms/tpc/R/tskeleton.R")
source("workflow/rules/structure_learning_algorithms/tpc/R/tpc_cons_intern.R")
source("workflow/rules/structure_learning_algorithms/tpc/R/MeeksRules.R")
source("workflow/rules/structure_learning_algorithms/tpc/R/tpc-package.R")
source("workflow/rules/structure_learning_algorithms/tpc/R/tcheckTriple.R")


source("resources/code_for_binary_simulations/bnlearn_help_fns.R")

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

    

    print("In TPC script.R")

    #if (!is.null(edgeConstraints)) {
    #    print("Edge constraints")
    #    print(edgeConstraints)

    #    print("context.tier")
    #    print(context.tier)
    #}

    # create a new data frame with the missingness indicators, called R_original_var_name_na for each variable that has missingness
    
    #message("Adding missingness indicators to the data")
    data_with_missingness <- data
    num_missing <- 0
    for (i in 1:ncol(data)) {
        if (any(is.na(data[, i]))) {
            data_with_missingness[, paste0("R_", colnames(data)[i])] <- ifelse(is.na(data[, i]), 0, 1)
            num_missing <- num_missing + 1
        }
    }
    # first row should be  only 2s
    #data_with_missingness[1, ] <- 2
    data <- data_with_missingness   

    if (is.null(forbEdges)) {
        forbEdges <- matrix(0, nrow = ncol(data), ncol = ncol(data))
        colnames(forbEdges) <- colnames(data)
        rownames(forbEdges) <- colnames(data)
    } else {
        # Extend forbEdges matrix by adding num_missing rows and columns
        forbEdges <- cbind(forbEdges, matrix(0, nrow = nrow(forbEdges), ncol = num_missing))
        forbEdges <- rbind(forbEdges, matrix(0, nrow = num_missing, ncol = ncol(forbEdges)))
        colnames(forbEdges) <- c(colnames(forbEdges), paste0("R_", colnames(data)[1:num_missing]))
        rownames(forbEdges) <- c(rownames(forbEdges), paste0("R_", colnames(data)[1:num_missing]))
    }

    # Forbid edges from the R_ variables to the original variables
    for (i in 1:ncol(data)) {
        for (j in 1:ncol(data)) {
            print(paste0("i: ", i, " j: ", j))

            if (grepl("^R_", colnames(data)[i]) && !grepl("^R_", colnames(data)[j])) {
                forbEdges[i, j] <- 1
            }
        }
    }

    # Forbid edges like X to R_X
    for (i in 1:ncol(data)) {
        for (j in 1:ncol(data)) {
            # check is it is a substantive variable 
            X <- colnames(data)[i]
            Y <- colnames(data)[j]
            # If Y is the R_X of X, then forbid the edge X to Y
            if (grepl("^R_", Y) && gsub("^R_", "", Y) == X) {
                forbEdges[i, j] <- 1
            }
        }
    }

    print("forbEdges")
    print(forbEdges)

    suffStat <- NULL
    if (snakemake@wildcards[["indepTest"]] %in% c("binCItest", "disCItwd")) {
        # the discrete case
        nlev <- as.numeric(data[1, ])
        data <- data[-1, ] # Remove range header
        #data <- data & TRUE
        suffStat <- list(dm = data, nlev = nlev, adaptDF = TRUE)
        #suffStat <- getSuff(data, test = snakemake@wildcards[["indepTest"]], nlev = nlev, adaptDF = FALSE)

    } else if (snakemake@wildcards[["indepTest"]] == "gaussCItest") {
        n <- dim(data)[1]
        suffStat <- list(C = cor(data), n = n)
    } else if (snakemake@wildcards[["indepTest"]] %in% c("gaussCItwd", "mixCItwd", "flexCItwd", "flexCItest")) {

        data <- data[-1, ]
        # creaate factor variables from the data
        data <- as.data.frame(lapply(data, as.factor))
        suffStat <- data

        # if the first row is only 2s, then remove it

        if (snakemake@wildcards[["indepTest"]] == "flexCItest") {            
            suffStat <- getSuff(data, test = "flexCItest")
        }
        
    } else if (snakemake@wildcards[["indepTest"]] %in% c("gaussMItest", "mixMItest", "disMItest", "flexMItest")) {
                
        if (filename_mice_data != "None" ) {
            imputed_datasets <- readRDS(filename_mice_data)            
            suffStat <- getSuff(imputed_datasets, test = snakemake@wildcards[["indepTest"]])
        } 
        print("4")

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

    totaltime <- proc.time()[1] - start

    graph <- pc.fit@graph
    adjmat <- as(graph, "matrix")

    colnames(adjmat) <- names(data)

    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

    write(totaltime, file = snakemake@output[["time"]])
}

add_timeout(wrapper)
