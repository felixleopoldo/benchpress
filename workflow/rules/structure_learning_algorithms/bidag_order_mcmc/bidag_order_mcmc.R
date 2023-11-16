library(BiDAG)
source("workflow/scripts/utils/helpers.R")

wrapper <- function() {
  data <- read.csv(snakemake@input[["data"]], check.names = FALSE)

  print("Reading startspace")
  print(snakemake@input[["input_algorithm"]])
  startspace <- read.csv(snakemake@input[["input_algorithm"]])
  print("Reading startspace done")
  rownames(startspace) <- seq(dim(data)[2])
  colnames(startspace) <- seq(dim(data)[2])

  wc <- snakemake@wildcards # save some notation

  myscore <- get_bidag_score(data, wc[["scoretype"]], 
                             aw = wc[["aw"]], am = wc[["am"]], 
                             chi = wc[["chi"]], edgepf = wc[["edgepf"]])

  start <- proc.time()[1]
  set.seed(convert_or_null(wc[["mcmc_seed"]], as.integer))

  order_mcmc_res <- orderMCMC(myscore,
    startspace = startspace,
    plus1 = as.logical(wc[["plus1"]]),
    MAP = as.logical(wc[["MAP"]]),
    chainout = TRUE,
    scoreout = TRUE,
    alpha = convert_or_null(wc[["alpha"]], as.numeric),
    iterations = convert_or_null(wc[["iterations"]], as.integer),
    stepsave = convert_or_null(wc[["stepsave"]], as.integer),
    gamma = as.numeric(wc[["gamma"]]),
    cpdag = as.logical(wc[["cpdag"]])
  )

  totaltime <- proc.time()[1] - start

  res <- bidagtraj_to_bptraj(
    order_mcmc_res$traceadd$incidence,
    order_mcmc_res$trace,
    colnames(data)
  )

  write.csv(x = res, file = file.path(snakemake@output[["seqgraph"]]), 
            row.names = FALSE, quote = FALSE)

  write(totaltime, file = snakemake@output[["time"]])
}

add_timeout_mcmc(wrapper)
