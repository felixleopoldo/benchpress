source("workflow/scripts/utils/add_timeout.R")
library(BDgraph)


adjmatToEdgeString <- function(adjmat, labels) {
  edgeinds <- which(adjmat == 1, arr.ind = TRUE)
  df <- data.frame(edgeinds)
  edges <- "["
  firstrow <- TRUE
  for (i in rownames(df)) {
    edge <- paste(labels[df[i, "row"]], labels[df[i, "col"]], sep = "-")
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
    edge <- paste(labels[1], labels[i], sep = "-")
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

strvec_to_adjmat <- function(str, p) {
  vec <- strsplit(str, "")[[1]]

  adjmat <- matrix(0, nrow = p, ncol = p)
  k <- 1
  for (i in seq(2, p)) {
    for (j in seq(1, i - 1)) {
      adjmat[i, j] <- as.integer(vec[k])
      k <- k + 1
    }
  }

  return(adjmat)
}


filename <- file.path(snakemake@output[["seqgraph"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["mcmc_seed"]])
data <- read.csv(filename_data, check.names = FALSE)


wrapper <- function() {
  start <- proc.time()[1]
  set.seed(seed) # BUG: Seeds doesn't seem to work in BDgraph.
  p <- dim(data)[2]

  bdgraph.obj <- bdgraph(data,
    n = NULL,
    method = snakemake@wildcards[["method"]],
    algorithm = snakemake@wildcards[["algo"]],
    iter = as.integer(snakemake@wildcards[["iter"]]),
    burnin = 0,
    not.cont = NULL,
    g.prior = as.numeric(snakemake@wildcards[["gprior"]]),
    df.prior = as.numeric(snakemake@wildcards[["dfprior"]]),
    g.start = snakemake@wildcards[["gstart"]],
    jump = NULL,
    save = TRUE,
    cores = NULL,
    threshold = as.numeric(snakemake@wildcards[["thresh"]])
  )

  totaltime <- proc.time()[1] - start

  adjmat_traj <- list()
  # all_graph contain indices from sample_graphs
  j <- 1

  for (i in bdgraph.obj$all_graphs) {
    strvec <- bdgraph.obj$sample_graphs[[i]]

    # graphs are stores as upper triangular matrices, stacked as strings
    # like 00100110 of length (p choose 2).
    adjmat <- strvec_to_adjmat(strvec, p)
    adjmat_traj[[j]] <- adjmat
    j <- j + 1
  }

  # This returns a string which is a list of flattened adjacency matrices.
  labels <- colnames(data)
  added <- dummyEdges(labels)

  start_edges <- adjmatToEdgeString(
    adjmat_traj[[1]],
    labels
  )
    minweight = min(bdgraph.obj$all_weights)
  
  if (snakemake@wildcards[["algo"]] %in% c("bdmcmc", "bd-dmh")) {
    # Translate weights into indices by dividing by the smallest weight. This
    # is not perfect though, so one could instead divide by the smallest weight diff.
    # However, which gives the highest resolution depends on the chain.
    # We also save the actual times in the time column.
        
    indices <- c(0, cumsum(bdgraph.obj$all_weights)) / minweight 
    indices <- round(indices)
    
  } else {
    indices <- c(0, cumsum(bdgraph.obj$all_weights)) # no difference since the weight are all 1s.
  }

  res <- data.frame(
    "index" = c(-2, -1, indices[1]),
    "time"= c(-2, -1, indices[1]), # adding the raw times as well. Can be used in e.g. heatmaps
    "score" = c(0, 0, bdgraph.obj$graph_weights[[bdgraph.obj$all_graphs[[1]]]]),
    "added" = c(added, "[]", start_edges),
    "removed" = c("[]", added, "[]")
  )

  m <- length(adjmat_traj)

  prevmat <- adjmat_traj[[1]]

  cumsum_weights = c(0,cumsum(bdgraph.obj$all_weights))

  for (i in seq(2, m)) {
    if (all(adjmat_traj[[i]] == prevmat)) {
      next
    }

    removed_edge_mat <- prevmat - (prevmat & adjmat_traj[[i]]) * 1
    added_edge_mat <- adjmat_traj[[i]] - (prevmat & adjmat_traj[[i]]) * 1

    added_edges <- adjmatToEdgeString(added_edge_mat, labels)
    removed_edges <- adjmatToEdgeString(removed_edge_mat, labels)

    df <- data.frame(
      "index" = indices[i],
      "time"= cumsum_weights[i], # adding the raw times as well. Can be used in e.g. heamaps
      "score" = bdgraph.obj$graph_weights[[bdgraph.obj$all_graphs[[i]]]],
      "added" = added_edges,
      "removed" = removed_edges
    )

    res <- rbind(res, df)
    prevmat <- adjmat_traj[[i]]
  }

  write.csv(x = res, file = filename, row.names = FALSE, quote = FALSE)
  write(totaltime, file = snakemake@output[["time"]])

}

add_timeout(wrapper)
