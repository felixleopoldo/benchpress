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
  for (i in seq(2, p)) {
    for (j in seq(1, i - 1)) {
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
  set.seed(seed) # BUG: Doesnt seemd to work
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

#     totw = sum(bdgraph.obj$all_weights)
# its = as.integer(snakemake@wildcards[["iter"]])
#   atom = ceiling(minweight * (totw / its)) # Shoul round to closest smallest part (say we chunk into its chunks)
#   print(bdgraph.obj$all_weights)
#   print(min(bdgraph.obj$all_weights))
#   print(sum(bdgraph.obj$all_weights))
#   print(atom) # Shoul round to closest smallest part (say we chunk into its chunks))
#   print(atom *  its)

#   print(totw/atom)
  
  if (snakemake@wildcards[["algo"]] %in% c("bdmcmc", "bd-dmh")) {
    # translate weights into indecies
    # Scale up. If the resolution is to low, there might be duplicates
    # in the index. This could perhaps instead be done on plotting be
    # done while plotting. Could also dicide by min element,
    # but then we also loose controls, if it is eg 1000000
    #indices <- (ceiling (c(0, cumsum(bdgraph.obj$all_weights)) /minweight  / totw) * its) # as.integer(snakemake@wildcards[["weight_resolution"]])
    
    # Find min weight differnce. Then we to make the index we divide my min(minweight, mindiff)
    # That should be fine grained.
    # T = length(bdgraph.obj$all_weights)
    # all_weights = bdgraph.obj$all_weights
    # mindiff = Inf
    # for (k in seq(1,T-1)){
    #   for (l in seq(k+1,T)){
    #     diff <- abs(all_weights[[k]] - all_weights[[l]])
    #     if (abs(all_weights[[k]] - all_weights[[l]]) < mindiff){
    #       mindiff <- diff
    #     }
    #   }
    # }

    #print("mindiff")
    #print(mindiff)
    #print("minweight")
    #print(minweight)    
    indices <- c(0, cumsum(bdgraph.obj$all_weights)) / minweight # as.integer(snakemake@wildcards[["weight_resolution"]])
    indices <- round(indices)
    #print(indices)
  } else {
    indices <- c(0, cumsum(bdgraph.obj$all_weights)) # no difference since the weight are all 1s.
  }

  res <- data.frame(
    "index" = c(-2, -1, indices[1]),
    "time"= c(-2, -1, indices[1]), # adding the raw times as well. Can be used in e.g. heamaps
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

if (snakemake@wildcards[["timeout"]] == "None") {
  wrapper()
} else {
  res <- NULL
  tryCatch({
    res <- withTimeout({
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
