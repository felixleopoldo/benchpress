gesadjacencymatrix <- function(g) {
  l <- length(g$.in.edges)
  adj <- matrix(rep(0, l * l), nrow = l, ncol = l)
  for (i in 1:l)
  {
    adj[i, g$.in.edges[[i]]] <- 1
  }
  return(adj)
}
