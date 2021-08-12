library(BiDAG)
#library(rjson)

adjmatToEdgeString <- function(adjmat, labels) {
  edgeinds <- which(adjmat == 1, arr.ind = TRUE)
  df <- data.frame(edgeinds)
  edges <- "["
  firstrow <- TRUE
  for (i in rownames(df)) {
    edge <- paste(labels[df[i, "row"]], labels[df[i, "col"]], sep = "->")
    if (firstrow) {
      sep <- ""
      firstrow <- FALSE
    } else {
      sep <- ";"
    }
    edges <- paste(edges, edge, sep = sep)
  }
  edges <- paste(edges, sep = "", "]")
  return(edges)
}

dummyEdges <- function(labels) {

  n <- length(labels)
  added <- "["
  for (i in 2:n) {
    edge <- paste(labels[1], labels[i], sep = "->")
    if (i == 2) {
      sep <- ""
    } else {
      sep <- ";"
    }
    added <- paste(added, edge, sep = sep)
  }
  added <- paste(added, sep = "", "]")
  return(added)
}

filename <- file.path(snakemake@output[["seqgraph"]])
filename_data <- snakemake@input[["data"]]

seed <- as.integer(snakemake@wildcards[["mcmc_seed"]])

data <- read.csv(filename_data, check.names = FALSE)

startspace <- read.csv(snakemake@input[["startspace"]])
rownames(startspace) <- seq(dim(data)[2])
colnames(startspace) <- seq(dim(data)[2])
chi <- NULL
if (snakemake@wildcards[["chi"]] != "None") {
  chi <- as.numeric(snakemake@wildcards[["chi"]])
}

edgepf <- NULL
if (snakemake@wildcards[["edgepf"]] != "None") {
  edgepf <- as.numeric(snakemake@wildcards[["edgepf"]])
}

aw <- NULL
if (snakemake@wildcards[["aw"]] != "None") {
  aw <- as.numeric(snakemake@wildcards[["aw"]])
}

am <- NULL
if (snakemake@wildcards[["am"]] != "None") {
  am <- as.numeric(snakemake@wildcards[["am"]])
}

alpha <- NULL
if (snakemake@wildcards[["alpha"]] != "None") {
  alpha <- as.numeric(snakemake@wildcards[["alpha"]])
}

iterations <- NULL
if (snakemake@wildcards[["iterations"]] != "None") {
  iterations <- as.numeric(snakemake@wildcards[["iterations"]])
}

stepsave <- NULL
if (snakemake@wildcards[["stepsave"]] != "None") {
  stepsave <- as.numeric(snakemake@wildcards[["stepsave"]])
}

if (snakemake@wildcards[["scoretype"]] == "bdecat") {
  data <- data[-1,] # Remove range header
  myscore <- scoreparameters("bdecat", data, bdecatpar = list(chi = chi, edgepf = edgepf))
}
if (snakemake@wildcards[["scoretype"]] == "bde") {
  data <- data[-1,] # Remove range header
  myscore <- scoreparameters("bde", data, bdepar = list(chi = chi, edgepf = edgepf))
}
if (snakemake@wildcards[["scoretype"]] == "bge") {
  myscore <- scoreparameters("bge", data, bgepar = list(am = am, aw = aw))
}
start <- proc.time()[1]
set.seed(seed)
order_mcmc_res <- orderMCMC(myscore,
                            startspace = startspace,
                            plus1 = as.logical(snakemake@wildcards[["plus1"]]),
                            MAP = as.logical(snakemake@wildcards[["MAP"]]),
                            chainout = TRUE,
                            scoreout = TRUE,
                            alpha = alpha,
                            iterations = iterations,
                            stepsave = stepsave,
                            gamma = as.numeric(snakemake@wildcards[["gamma"]]),
                            cpdag = as.logical(snakemake@wildcards[["cpdag"]])
                            )

totaltime <- proc.time()[1] - start
endspace <- order_mcmc_res$space$adjacency # This might not be what we want

# This returns a string which is a list of flattened adjacency matrices.

labels <- colnames(data)
added <- dummyEdges(labels)

start_edges <- adjmatToEdgeString(order_mcmc_res$traceadd$incidence[[1]], labels)

res <- data.frame("index" = c(-2, -1, 0),
                  "score" = c(0, 0, order_mcmc_res$trace[[1]]),
                  "added" = c(added, "[]", start_edges),
                  "removed" = c("[]", added, "[]"))

adjmat_traj <- order_mcmc_res$traceadd$incidence
m <- length(adjmat_traj)

prevmat <- order_mcmc_res$traceadd$incidence[[1]]
for (i in seq(2, m)) {
  if (all(adjmat_traj[[i]] == prevmat)) {
    next
  }

  removed_edge_mat <- prevmat - (prevmat & adjmat_traj[[i]]) * 1
  added_edge_mat <- adjmat_traj[[i]] - (prevmat & adjmat_traj[[i]]) * 1

  added_edges <- adjmatToEdgeString(added_edge_mat, labels)
  removed_edges <- adjmatToEdgeString(removed_edge_mat, labels)

  df <- data.frame("index" = i,
                    "score" = order_mcmc_res$trace[i],
                    "added" = added_edges,
                    "removed" = removed_edges)

  res <- rbind(res, df)

  prevmat <- adjmat_traj[[i]]
}

write.csv(x = res, file = filename, row.names = FALSE, quote = FALSE)

write(totaltime, file = snakemake@output[["time"]])
