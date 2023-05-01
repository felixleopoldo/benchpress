library(BiDAG)
source("workflow/scripts/utils/helpers.R")

wrapper <- function() {
  start <- proc.time()[1]
  data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
  startspace <- read.csv(snakemake@input[["startspace"]])
  rownames(startspace) <- seq(dim(data)[2])
  colnames(startspace) <- seq(dim(data)[2])

  wc <- snakemake@wildcards # save some notation

  myscore <- get_bidag_score(data, wc[["scoretype"]], aw = wc[["aw"]], am = wc[["am"]], chi = wc[["chi"]], edgepf = wc[["edgepf"]])

  set.seed(as.integer(wc[["mcmc_seed"]]))
  
  partition_mcmc_res <- partitionMCMC(myscore,
    startspace = startspace,
    scoreout = TRUE,
    iterations = convert_or_null(wc[["iterations"]], as.integer),
    stepsave = convert_or_null(wc[["stepsave"]], as.integer),
    gamma = as.numeric(wc[["gamma"]]),
    verbose = wc[["verbose"]]
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
