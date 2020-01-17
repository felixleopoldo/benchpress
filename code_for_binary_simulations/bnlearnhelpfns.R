bnfit2matrix <- function(bnfit.obj) {
  n <- length(bn)
  adj <- matrix(0, ncol = n, nrow = n)
  namesbn <- names(bn)
  for (i in 1:n) {
    if (length(bnfit.obj[[i]]$parents) > 0) {
      parvec <- which(namesbn %in% bnfit.obj[[i]]$parents)
      adj[parvec, i] <- 1
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
