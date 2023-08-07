library(BiDAG)
source("workflow/scripts/utils/helpers.R")

data <- read.csv(snakemake@input[["data"]], check.names = FALSE)

# This is a wrapper to pass into add_timeout.
wrapper <- function() {
  wc <- snakemake@wildcards # save some notation

  start <- proc.time()[1]
  set.seed(wc[["replicate"]])
  # Calculate the score tables

  myscore <- get_bidag_score(data, wc[["scoretype"]], 
                             aw = wc[["aw"]], am = wc[["am"]], 
                             chi = wc[["chi"]], edgepf = wc[["edgepf"]])

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
