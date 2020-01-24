generateDAG <- function(n, e) {
  # n is number of nodes
  # e is expected number of parents
  n_offdiag <- n * (n - 1) / 2
  offdiag_vec <- rbinom(n_offdiag, 1, e * n / n_offdiag)

  DAG <- matrix(0, n, n)
  DAG[upper.tri(DAG)] <- offdiag_vec
  permy <- sample(1:n)
  return(DAG[permy, permy])
}

generateDAGs <- function(n, e, n_dags) {
  if (n_dags == 1){
    return(generateDAGn(n, e))
  }
  dags <- c()
  for (i  in seq(n_dags)) {
    dags[i] <- generateDAGn(n, e)
  }
  return(dags)
}

