source("workflow/scripts/utils/helpers.R")

library(RBGL)
library(pcalg)
source("resources/code_for_binary_simulations/bnlearn_help_fns.R")

wrapper <- function() {

  filename <- file.path(snakemake@output[["adjmat"]])
  filename_data <- snakemake@input[["data"]]
  filename_edge_constraints <- snakemake@input[["edgeConstraints_formatted"]]
  seed <- as.integer(snakemake@wildcards[["seed"]])
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

  data <- read.csv(filename_data, check.names = FALSE)
  edgeConstraints <- read.csv(filename_edge_constraints)
  p <- ncol(data)  
  node_names <- colnames(data)

  if (nrow(edgeConstraints) == 0) {
    fixedGaps <- NULL
    fixedEdges <- NULL
  } else {
    fixedGaps <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))
    fixedEdges <- matrix(FALSE, nrow = p, ncol = p, dimnames = list(node_names, node_names))

    for (i in 1:nrow(edgeConstraints)) {
      node1 <- edgeConstraints$node1[i]
      node2 <- edgeConstraints$node2[i]
      if (edgeConstraints$matrix_type[i] == "fixedGaps") {
        fixedGaps[node1, node2] <- TRUE
        fixedGaps[node2, node1] <- TRUE
      } else if (edgeConstraints$matrix_type[i] == "fixedEdges") {
        fixedEdges[node1, node2] <- TRUE
        fixedEdges[node2, node1] <- TRUE
      }
    }
  }

  suffStat <- NULL
  if (snakemake@wildcards[["indepTest"]] != "gaussCItest") {
    nlev <- as.numeric(data[1,])
    data <- data[-1,]  # Remove range header
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
    fixedGaps = fixedGaps,
    fixedEdges = fixedEdges,
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

add_timeout(wrapper)
