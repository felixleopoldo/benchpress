library(RBGL)
library(BiDAG)

source("workflow/scripts/utils/helpers.R")

data <- read.csv(snakemake@input[["data"]], check.names = FALSE)


# This is a wrapper to pass into add_timeout.
wrapper <- function() {

  start <- proc.time()[1]
  set.seed(snakemake@wildcards[["replicate"]])
  # Calculate the score tables

  if (snakemake@wildcards[["scoretype"]] == "bdecat") {
    # if categorical data
    data <- data[-1, ] # Remove range header
    myscore <- scoreparameters("bdecat", data,
      bdecatpar = list(chi = chi, edgepf = edgepf)
    )
  }
  if (snakemake@wildcards[["scoretype"]] == "bde") {
    # if discrete data
    data <- data[-1, ] # Remove range header
    myscore <- scoreparameters("bde", data,
      bdepar = list(
        chi = convert_or_null(snakemake@wildcards[["chi"]], as.numeric),
        edgepf = convert_or_null(snakemake@wildcards[["edgepf"]], as.numeric)
      )
    )
  }
  if (snakemake@wildcards[["scoretype"]] == "bge") {
    # if continuous data
    myscore <- scoreparameters("bge", data,
      bgepar = list(
        am = convert_or_null(snakemake@wildcards[["am"]], as.numeric),
        aw = convert_or_null(snakemake@wildcards[["aw"]], as.numeric)
      )
    )
  }

  itsearch_res <- iterativeMCMC(
    myscore,
    chainout = FALSE,
    posterior = convert_or_null(snakemake@wildcards[["posterior"]], as.numeric),
    mergetype = snakemake@wildcards[["mergetype"]],
    softlimit = as.integer(snakemake@wildcards[["softlimit"]]),
    plus1it = convert_or_null(snakemake@wildcards[["plus1it"]], as.numeric),
    MAP = as.logical(snakemake@wildcards[["MAP"]]),
    hardlimit = as.integer(snakemake@wildcards[["hardlimit"]]),
    scoreout = TRUE,
    alpha = as.numeric(snakemake@wildcards[["alpha"]]),
    gamma = as.numeric(snakemake@wildcards[["gamma"]]),
    cpdag = as.logical(snakemake@wildcards[["cpdag"]]),
  )

  totaltime <- proc.time()[1] - start

  adjmat <- NULL

  if (snakemake@wildcards[["estimate"]] == "map") {
    adjmat <- as.matrix(itsearch_res$DAG)
  }
  if (snakemake@wildcards[["estimate"]] == "endspace") {
    adjmat <- as.matrix(itsearch_res$endspace) # this is the space, not the estimate
  }

  colnames(adjmat) <- names(data)

  write.csv(adjmat, file = file.path(snakemake@output[["adjmat"]]), row.names = FALSE, quote = FALSE)
  write(totaltime, file = snakemake@output[["time"]])
}

add_timeout(wrapper)
