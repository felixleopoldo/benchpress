bnfit2matrix <- function(bnfit.obj) {
  n <- length(bnfit.obj)
  adj <- matrix(0, ncol = n, nrow = n)
  namesbn <- names(bnfit.obj)
  colnames(adj) <- namesbn
  rownames(adj) <- namesbn

  for (i in 1:n) {
    colnames(adj)[i] <- bnfit.obj[[i]]$node
    if (length(bnfit.obj[[i]]$parents) > 0) {
      parvec <- which(namesbn %in% bnfit.obj[[i]]$parents)
      adj[parvec, i] <- 1
      rownames(adj)[parvec] <- namesbn[parvec]
    }
  }
  return(adj)
}

gesadjacencymatrix <- function(g) {
  l <- length(g$.in.edges)
  adj <- matrix(rep(0, l * l), nrow = l, ncol = l)
  for (i in 1:l)
  {
    adj[i, g$.in.edges[[i]]] <- 1
  }
  return(adj)
}

bnarcs2dag <- function(varnames, bnarcs) {
  n <- length(varnames)
  adj <- matrix(0, ncol = n, nrow = n)
  ll <- nrow(bnarcs)
  for (i in 1:ll) {
    fromedge <- which(varnames == bnarcs[i, 1])
    toedge <- which(varnames == bnarcs[i, 2])
    adj[fromedge, toedge] <- 1
  }
  return(adjacency2dag(adj))
}

rearrangeMatrix <- function(adj, namesvec) {
  adjnew <- adj
  oldnames <- colnames(adj)
  j <- 1
  for (i in namesvec) {
    k <- which(oldnames == i)
    adjnew[, j] <- adj[, k]
    colnames(adjnew)[j] <- i
    j <- j + 1
  }
  adj <- adjnew
  oldnames <- rownames(adj)
  j <- 1
  for (i in namesvec) {
    k <- which(oldnames == i)
    adjnew[j, ] <- adj[k, ]
    rownames(adjnew)[j] <- i
    j <- j + 1
  }

  return(adjnew)
}
