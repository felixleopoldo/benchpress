library(BiDAG)
source("workflow/scripts/utils/helpers.R")

data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]

# This is a wrapper to pass into add_timeout.
wrapper <- function() {
  wc <- snakemake@wildcards # save some notation

  start <- proc.time()[1]
  set.seed(wc[["seed"]])
  # Calculate the score tables

  myscore <- get_bidag_score(data, wc[["scoretype"]], 
                             aw = wc[["aw"]], am = wc[["am"]], 
                             chi = wc[["chi"]], edgepf = wc[["edgepf"]])

    p <- ncol(data)
    node_names <- colnames(data)
    blacklist <- matrix(0, nrow = p, ncol = p, dimnames = list(node_names, node_names))
    edgeConstraints <- NULL

    # get the size of the edge constraints file
    size_edge_constraints <- file.info(filename_edge_constraints)$size
    if(size_edge_constraints > 1) {        
        edgeConstraints <- read.csv(filename_edge_constraints)
        for (i in 1:nrow(edgeConstraints)) {
            from <- as.character(edgeConstraints$from[i])
            to <- as.character(edgeConstraints$to[i])
            blacklist[from, to] <- 1
        }
    }

  itsearch_res <- iterativeMCMC(
    myscore,
    chainout = FALSE,
    posterior = convert_or_null(wc[["posterior"]], as.numeric),
    mergetype = wc[["mergetype"]],
    softlimit = as.integer(wc[["softlimit"]]),
    plus1it = convert_or_null(wc[["plus1it"]], as.numeric),
    MAP = as.logical(wc[["MAP"]]),
    hardlimit = as.integer(wc[["hardlimit"]]),
    scoreout = TRUE,
    blacklist = blacklist,
    alpha = as.numeric(wc[["alpha"]]),
    gamma = as.numeric(wc[["gamma"]]),
    cpdag = as.logical(wc[["cpdag"]]),
  )

  totaltime <- proc.time()[1] - start

  adjmat <- NULL

  if (wc[["estimate"]] == "map") {
    adjmat <- as.matrix(itsearch_res$DAG)
  }
  if (wc[["estimate"]] == "endspace") {
    adjmat <- as.matrix(itsearch_res$endspace) # this is the space, not the estimate
  }

  colnames(adjmat) <- names(data)

  write.csv(adjmat, file = file.path(snakemake@output[["adjmat"]]), row.names = FALSE, quote = FALSE)
  write(totaltime, file = snakemake@output[["time"]])
}

add_timeout(wrapper)
