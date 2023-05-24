library(R.utils)

# Helper functions

# Convert a string accoding to a given function, or NULL if the string is "None"
convert_or_null <- function(x, func) {
  if (x == "None") {
    return(NULL)
  } else {
    return(func(x))
  }
}

# Adds a timeout to a function. If the timeout is reached, an empty graph and time file are written.
add_timeout <- function(wrapper) {
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
        file.create(file.path(snakemake@output[["adjmat"]]))
        cat("None", file = snakemake@output[["time"]], sep = "\n")
        cat("None", file = snakemake@output[["ntests"]], sep = "\n")
      }
    )
  }
}

# Adds a timeout to a function. If the timeout is reached, an empty graph and time file are written.
add_timeout_mcmc <- function(wrapper) {
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
        file.create(file.path(snakemake@output[["seqgraph"]]))
        cat("None", file = snakemake@output[["time"]], sep = "\n")
      }
    )
  }
}


# Convert an adjacency matrix to a string of edges. Used in MCMC algorithms.
adjmatToEdgeString <- function(adjmat, labels, directed = TRUE) {
  # if not directed, make upper triangular
  # and set edge symbol to "-"
  edge_symbol <- "->"
  if (!directed) {
    adjmat <- adjmat * upper.tri(adjmat)
    edge_symbol <- "-"
  }

  edgeinds <- which(as.matrix(adjmat) == 1, arr.ind = TRUE)
  df <- data.frame(edgeinds)
  edges <- "["
  firstrow <- TRUE
  for (i in rownames(df)) {
    edge <- paste(labels[df[i, "row"]], labels[df[i, "col"]], sep = edge_symbol)
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

# Creadets dummy edges for the initial graph. Used in MCMC algorithms.
dummyEdges <- function(labels, directed = TRUE) {
  if (directed == TRUE) {
    edge_symbol <- "->"
  } else {
    edge_symbol <- "-"
  }

  n <- length(labels)
  added <- "["
  for (i in 2:n) {
    edge <- paste(labels[1], labels[i], sep = edge_symbol)
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

bidagtraj_to_bptraj <- function(adjmat_traj, scores, labels, directed = TRUE) {
  added <- dummyEdges(labels, directed = directed)

  start_edges <- adjmatToEdgeString(
    adjmat_traj[[1]],
    labels,
    directed = directed
  )

  res <- data.frame(
    "index" = c(-2, -1, 0),
    "score" = c(0, 0, scores[[1]]),
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
    added_edges <- adjmatToEdgeString(added_edge_mat, labels, directed = directed)
    removed_edges <- adjmatToEdgeString(removed_edge_mat, labels, directed = directed)

    df <- data.frame(
      "index" = c(i-1),
      "score" = c(scores[[i]]),
      "added" = c(added_edges),
      "removed" = c(removed_edges)
    )

    res <- rbind(res, df)
    prevmat <- adjmat_traj[[i]]
  }

  return(res)
}


get_bidag_score <- function(data, scoretype, aw = 1, am = 1, chi = 1, edgepf = 1) {
  myscore <- NULL
  if (scoretype == "bdecat") {
    # if categorical data
    data <- data[-1, ] # Remove range header
    myscore <- scoreparameters("bdecat", data,
      bdecatpar = list(chi = chi, edgepf = edgepf)
    )
  }
  if (scoretype == "bde") {
    # if discrete data
    data <- data[-1, ] # Remove range header
    myscore <- scoreparameters("bde", data,
      bdepar = list(
        chi = convert_or_null(chi, as.numeric),
        edgepf = convert_or_null(edgepf, as.numeric)
      )
    )
  }
  if (scoretype == "bge") {
    # if continuous data
    myscore <- scoreparameters("bge", data,
      bgepar = list(
        am = convert_or_null(am, as.numeric),
        aw = convert_or_null(aw, as.numeric)
      )
    )
  }

  return(myscore)
}
