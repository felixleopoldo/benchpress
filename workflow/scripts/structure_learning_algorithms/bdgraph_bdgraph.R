library(BDgraph)
library(R.utils)

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
  for (i in seq(1, p - 1)) {
    for (j in seq(i + 1, p)) {
      adjmat[i, j] <- as.integer(vec[k])
      #adjmat[j, i] <- as.integer(vec[k])
      k <- k + 1
    }
  }

  return(adjmat)
}

filename <- file.path(snakemake@output[["adjvecs"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["mcmc_seed"]])
data <- read.csv(filename_data, check.names = FALSE)


wrapper <- function() {
  start <- proc.time()[1]
  set.seed(seed)
  p <- dim(data)[2]
  # print(snakemake@wildcards[["method"]])
  # print(snakemake@wildcards)
  # print(data)
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
  #print("done")
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

  #print(adjmat_traj)

  # This returns a string which is a list of flattened adjacency matrices.
  labels <- colnames(data)
  added <- dummyEdges(labels)

  start_edges <- adjmatToEdgeString(
    adjmat_traj[[1]],
    labels
  )

  res <- data.frame(
    "index" = c(-2, -1, 0),
    "score" = c(0, 0, 0),
    "added" = c(added, "[]", start_edges),
    "removed" = c("[]", added, "[]")
  )

 

  m <- length(adjmat_traj)

  prevmat <- adjmat_traj[[1]]
  for (i in seq(2, m)) {
    if (all(adjmat_traj[[i]] == prevmat)) {
      next
    }

    removed_edge_mat <- prevmat - (prevmat & adjmat_traj[[i]]) * 1
    added_edge_mat <- adjmat_traj[[i]] - (prevmat & adjmat_traj[[i]]) * 1

    added_edges <- adjmatToEdgeString(added_edge_mat, labels)
    removed_edges <- adjmatToEdgeString(removed_edge_mat, labels)

    df <- data.frame(
      "index" = i,
      "score" = 0,
      "added" = added_edges,
      "removed" = removed_edges
    )

    res <- rbind(res, df)

    prevmat <- adjmat_traj[[i]]
  }
  #print(res[3:100,])
  #print(head(res))
  #print(filename)
  write.csv(x = res, file = filename, row.names = FALSE, quote = FALSE)

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
