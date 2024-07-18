library(BiDAG)
source("workflow/scripts/utils/helpers.R")

wrapper <- function() {
  data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
  filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]

  startspace <- read.csv(snakemake@input[["input_algorithm"]])

  rownames(startspace) <- seq(dim(data)[2])
  colnames(startspace) <- seq(dim(data)[2])

  wc <- snakemake@wildcards # save some notation

  myscore <- get_bidag_score(data, wc[["scoretype"]], 
                             aw = wc[["aw"]], am = wc[["am"]], 
                             chi = wc[["chi"]], edgepf = wc[["edgepf"]])

  start <- proc.time()[1]
  set.seed(convert_or_null(wc[["mcmc_seed"]], as.integer))


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


  order_mcmc_res <- orderMCMC(myscore,
    startspace = startspace,
    plus1 = as.logical(wc[["plus1"]]),
    MAP = as.logical(wc[["MAP"]]),
    chainout = TRUE,
    scoreout = TRUE,
    blacklist = blacklist,
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
