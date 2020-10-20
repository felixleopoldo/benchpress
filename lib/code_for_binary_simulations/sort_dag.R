sortdag <- function(DAG, n) {
  adj <- t(dag2adjacencymatrix(DAG))
  sort <- as.numeric(tsort(DAG))
  sortback <- vector()
  sortedadj <- matrix(rep(0, n * n), nrow = n, ncol = n)
  newedgeweights <- edgeWeights(DAG)
  from <- c()
  to <- c()
  for (i in 1:n) {
    sortback[i] <- which(sort == i)
  }

  for (i in 1:n) {
    for (j in 1:n) {
      if (adj[i, j] > 0) {
        colindex <- which(sort == j)
        rowindex <- which(sort == i)
        sortedadj[rowindex, colindex] <- 1
      }
    }
  }
  return(adjacency2dag(t(sortedadj), nodes = c(1:n)))
}
