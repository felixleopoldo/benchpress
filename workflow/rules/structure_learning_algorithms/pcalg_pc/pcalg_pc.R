library(RBGL)
library(pcalg)
library(R.utils)
source("resources/code_for_binary_simulations/bnlearn_help_fns.R")

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["replicate"]])
alpha <- as.numeric(snakemake@wildcards[["alpha"]])
NAdelete <- as.logical(snakemake@wildcards[["NAdelete"]])
mmax <- as.numeric(snakemake@wildcards[["mmax"]])
u2pd <- snakemake@wildcards[["u2pd"]]
skelmethod <- snakemake@wildcards[["skelmethod"]]
conservative <- as.logical(snakemake@wildcards[["conservative"]])
majrule <- as.logical(snakemake@wildcards[["majrule"]])
solveconfl <- as.logical(snakemake@wildcards[["solveconfl"]])
numCores <- as.integer(snakemake@wildcards[["numCores"]])
verbose <- as.logical(snakemake@wildcards[["verbose"]])
indepTest <- match.fun(snakemake@wildcards[["indepTest"]])

wrapper <- function() {
  data <- read.csv(filename_data, check.names = FALSE)

  suffStat <- NULL
  if (snakemake@wildcards[["indepTest"]] != "gaussCItest") {
    nlev <- as.numeric(data[1, ])
    data <- data[-1, ] # Remove range header
    suffStat <- list(dm = data, nlev = nlev, adaptDF = FALSE)
  } else {
    n <- dim(data)[1]
    suffStat <- list(C = cor(data), n = n)
  }

  start <- proc.time()[1]
  set.seed(seed)
  pc.fit <- pc(
    suffStat = suffStat,
    indepTest = indepTest,
    alpha = alpha,
    labels = colnames(data),
    fixedGaps = NULL,
    fixedEdges = NULL,
    NAdelete = NAdelete,
    m.max = mmax,
    u2pd = u2pd,
    skel.method = skelmethod,
    conservative = conservative,
    maj.rule = majrule,
    solve.confl = solveconfl,
    numCores = numCores,
    verbose = verbose
  )

  totaltime <- proc.time()[1] - start

  graph <- pc.fit@graph



  adjmat <- as(graph, "matrix")
  colnames(adjmat) <- names(data)
  write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)

  write(totaltime, file = snakemake@output[["time"]])
}

if (snakemake@wildcards[["timeout"]] == "None") {
  wrapper()
} else {
  res <- NULL
  tryCatch(
    {
      res <- withTimeout(
        {
          wrapper()
        },
        timeout = snakemake@wildcards[["timeout"]]
      )
    },
    TimeoutException = function(ex) {
      message(paste("Timeout after ", snakemake@wildcards[["timeout"]],
        " seconds. Writing empty graph and time files.",
        sep = ""
      ))
      file.create(filename)
      cat("None", file = snakemake@output[["time"]], sep = "\n")
    }
  )
}
