library(RBGL)
library(BiDAG)

source("workflow/scripts/utils/helpers.R")

data <- read.csv(snakemake@input[["data"]], check.names = FALSE)


# This is a wrapper to pass into add_timeout.
wrapper <- function() {
  wc <- snakemake@wildcards # save some notation

  start <- proc.time()[1]
  set.seed(wc[["replicate"]])
  # Calculate the score tables

  if (wc[["scoretype"]] == "bdecat") {
    # if categorical data
    data <- data[-1, ] # Remove range header
    myscore <- scoreparameters("bdecat", data,
      bdecatpar = list(chi = chi, edgepf = edgepf)
    )
  }
  if (wc[["scoretype"]] == "bde") {
    # if discrete data
    data <- data[-1, ] # Remove range header
    myscore <- scoreparameters("bde", data,
      bdepar = list(
        chi = convert_or_null(wc[["chi"]], as.numeric),
        edgepf = convert_or_null(wc[["edgepf"]], as.numeric)
      )
    )
  }
  if (wc[["scoretype"]] == "bge") {
    # if continuous data
    myscore <- scoreparameters("bge", data,
      bgepar = list(
        am = convert_or_null(wc[["am"]], as.numeric),
        aw = convert_or_null(wc[["aw"]], as.numeric)
      )
    )
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
