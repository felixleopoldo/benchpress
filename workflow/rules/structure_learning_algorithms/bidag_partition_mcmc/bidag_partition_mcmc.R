library(BiDAG)
source("workflow/scripts/utils/helpers.R")

wrapper <- function() {
  start <- proc.time()[1]
  data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
  startspace <- read.csv(snakemake@input[["startspace"]])
  rownames(startspace) <- seq(dim(data)[2])
  colnames(startspace) <- seq(dim(data)[2])

  wc <- snakemake@wildcards # save some notation

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
  set.seed(as.integer(snakemake@wildcards[["mcmc_seed"]]))
  partition_mcmc_res <- partitionMCMC(myscore,
    startspace = startspace,
    scoreout = TRUE,
    iterations = convert_or_null(wc[["iterations"]], as.integer),
    stepsave = convert_or_null(wc[["stepsave"]], as.integer),
    gamma = as.numeric(snakemake@wildcards[["gamma"]]),
    verbose = snakemake@wildcards[["verbose"]]
  )

  totaltime <- proc.time()[1] - start

  res <- bidagtraj_to_bptraj(
    partition_mcmc_res$traceadd$incidence,
    partition_mcmc_res$trace,
    colnames(data)
  )

  write.csv(x = res, file = file.path(snakemake@output[["seqgraph"]]), row.names = FALSE, quote = FALSE)
  write(totaltime, file = snakemake@output[["time"]])
}

add_timeout_mcmc(wrapper)
